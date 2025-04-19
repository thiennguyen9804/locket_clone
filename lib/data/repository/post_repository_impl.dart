import 'package:dartz/dartz.dart';
import 'package:locket_clone/core/mapper/newsfeed_mapper/newsfeed_mapper.dart';
import 'package:locket_clone/core/mapper/post_mapper/post_mapper.dart';
import 'package:locket_clone/data/model/all_posts_res.dart';
import 'package:locket_clone/data/model/post_dto/post_dto.dart';
import 'package:locket_clone/data/source/auth_local_service.dart';
import 'package:locket_clone/data/source/post_api_service.dart';
import 'package:locket_clone/data/source/user_api_service.dart';
import 'package:locket_clone/domain/entities/newsfeed_entity.dart';
import 'package:locket_clone/domain/entities/post_entity.dart';
import 'package:locket_clone/presentation/data/upload_post.dart';

import '../../domain/repository/post_repository.dart';
import '../../set_up_sl.dart';

class PostRepositoryImpl implements PostRepository {
  @override
  Future<PostEntity> getPostById(String postId) async {
    final dto = await sl<PostApiService>().getPostById(postId);
    final res = sl<PostMappr>().convert<PostDto, PostEntity>(dto);
    return res;
  }

  @override
  Future<NewsfeedEntity> getAllPosts(
      {required int size, required int page}) async {
    AllPostsRes newsfeed = await sl<PostApiService>().loadPosts(size, page);
    final res =
        sl<NewsfeedMappr>().convert<AllPostsRes, NewsfeedEntity>(newsfeed);
    return res;
  }

  @override
  Future addPost(UploadPost post) async {
    @override
    final user = sl<AuthLocalService>().getLocalCurrentUser();
    final token = sl<AuthLocalService>().getLocalToken();
    print("UserRepositoryImpl addPost() $token");
    await sl<PostApiService>().addPost(user: user, token: token, post: post,);
  }
}
