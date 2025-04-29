import 'dart:io';
import 'dart:isolate';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:locket_clone/core/id_generator.dart';
import 'package:locket_clone/core/mapper/newsfeed_local_mapper.dart/newsfeed_local_mapper.dart';
import 'package:locket_clone/core/mapper/newsfeed_mapper/newsfeed_mapper.dart';
import 'package:locket_clone/core/mapper/post_local_mapper/post_local_mapper.dart';
import 'package:locket_clone/core/mapper/post_mapper/post_mapper.dart';
import 'package:locket_clone/core/mapper/user_mapper/user_mapper.dart';
import 'package:locket_clone/data/model/all_post_local.dart';
import 'package:locket_clone/data/model/all_posts_res.dart';
import 'package:locket_clone/data/model/post_dto/post_dto.dart';
import 'package:locket_clone/data/model/post_local_data.dart';
import 'package:locket_clone/data/model/user_dto/user_dto.dart';
import 'package:locket_clone/data/source/auth_local_service.dart';
import 'package:locket_clone/data/source/image_local_service.dart';
import 'package:locket_clone/data/source/post_api_service.dart';
import 'package:locket_clone/data/source/post_local_service.dart';
import 'package:locket_clone/data/source/user_api_service.dart';
import 'package:locket_clone/data/source/user_local_service.dart';
import 'package:locket_clone/domain/entities/newsfeed_entity.dart';
import 'package:locket_clone/domain/entities/post_entity.dart';
import 'package:locket_clone/domain/entities/user_entity.dart';
import 'package:locket_clone/domain/repository/user_repository.dart';
import 'package:locket_clone/presentation/data/upload_post.dart';
import 'package:image/image.dart' as img;

import '../../domain/repository/post_repository.dart';
import '../../set_up_sl.dart';

class PostRepositoryImpl implements PostRepository {
  final tempIdGen = IdGenerator();
  @override
  Future<PostEntity> getPostById(String postId) async {
    final dto = await sl<PostApiService>().getPostById(postId);
    final res = sl<PostMapper>().convert<PostDto, PostEntity>(dto);
    return res;
  }

  Future<PostEntity> fromLocal(PostLocalData item) async {
    final user = await sl<UserRepository>().getLocalUserById(item.userId);
    final res = PostEntity(
      id: item.id,
      imageUrl: item.imageUrl,
      user: user,
      caption: item.caption,
      interactionList: null,
      createdAt: item.createdAt,
    );
    return res;
  }

  @override
  Future<NewsfeedEntity> getAllPosts({
    required int size,
    DateTime? cursorCreatedAt,
  }) async {
    final localData = await sl<PostLocalService>().loadLocalPosts(
      size,
      cursorCreatedAt,
    );

    if (localData == null) {
      print('PostRepositoryImpl case: no suitable local data');

      AllPostsRes newsfeed = await sl<PostApiService>().loadPosts(
        size,
        cursorCreatedAt,
      );
      final res = sl<NewsfeedMapper>().convert<AllPostsRes, NewsfeedEntity>(
        newsfeed,
      );
      sl<PostLocalService>().writeTotalPosts(res.totalPosts);
      return res;
    } else {
      print('totalPostsCurrent ${localData.totalPostsCurrent}');
      if (localData.totalPostsCurrent == size) {
        print('PostRepositoryImpl case: local data is enough');

        final posts = await Future.wait(
          localData.posts.map((item) async {
            return await fromLocal(item);
          }),
        );
        return NewsfeedEntity(posts: posts, totalPosts: localData.totalPosts);
      } else {
        print('PostRepositoryImpl case: totalPostCurrent < size request');
        int remains = size - localData.totalPostsCurrent;
        AllPostsRes allPostsRes = await sl<PostApiService>().loadPosts(
          remains,
          localData.posts.last.createdAt,
        );
        final newsfeed = sl<NewsfeedMapper>()
            .convert<AllPostsRes, NewsfeedEntity>(allPostsRes);

        final posts = await Future.wait(
          localData.posts.map((item) async {
            return await fromLocal(item);
          }),
        );

        newsfeed.posts.addAll(posts);
        return newsfeed;
      }
    }
  }

  @override
  Future addPost(UploadPost post) async {
    final userDto = sl<AuthLocalService>().getLocalCurrentUser();
    final token = sl<AuthLocalService>().getLocalToken();
    print("UserRepositoryImpl addPost() $token");
    await sl<UserLocalService>().writeUserToLocal(userDto);
    await sl<ImageLocalService>().writeImageToLocal(post.flip, post.imagePath);
    // if (post.flip) {
    //   final imageFile = File(post.imagePath);

    //   final bytes = await imageFile.readAsBytes();
    //   img.Image? image = img.decodeImage(bytes);

    //   image = img.flipHorizontal(image!);
    //   await imageFile.writeAsBytes(img.encodeJpg(image));
    // }
    final postLocal = PostLocalData(
      id: tempIdGen.gen(),
      imageUrl: post.imagePath,
      userId: userDto.id,
      caption: post.caption,
      interactionList: null,
      createdAt: DateTime.now(),
    );
    await sl<PostLocalService>().writePostToLocal(postLocal);
    try {
      sl<PostApiService>().addPost(user: userDto, token: token, post: post);
      print('Add post thành công!');
    } on DioException catch (e) {
      await sl<PostLocalService>().deleteLocalPostById(postLocal.id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future writePostToLocal(PostEntity post) async {
    final postDto = sl<PostMapper>().convert<PostEntity, PostLocalData>(post);
    final userDto = sl<UserMapper>().convert<UserEntity, UserDto>(post.user);
    await sl<UserLocalService>().writeUserToLocal(userDto);
    await sl<PostLocalService>().writePostToLocal(postDto);
  }

  @override
  Future resetTable() async {
    await sl<PostLocalService>().resetTable();
  }
}
