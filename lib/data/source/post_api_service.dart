import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:locket_clone/core/constant/network_constant.dart';
import 'package:locket_clone/core/network/dio_client.dart';
import 'package:locket_clone/data/model/all_posts_res.dart';
import 'package:locket_clone/data/model/post_dto/post_dto.dart';
import 'package:locket_clone/data/model/user_dto/user_dto.dart';
import 'package:locket_clone/data/source/auth_local_service.dart';
import 'package:locket_clone/presentation/data/upload_post.dart';
import 'package:locket_clone/set_up_sl.dart';

abstract class PostApiService {
  Future<PostDto> getPostById(String postId);

  Future<AllPostsRes> loadPosts(int size, int page);
  Future addPost({
    required UserDto user,
    required String token,
    required UploadPost post,
  });
}

class PostApiServiceImpl implements PostApiService {
  @override
  Future<PostDto> getPostById(String postId) async {
    throw UnimplementedError();
  }

  @override
  Future<AllPostsRes> loadPosts(int size, int page) async {
    try {
      final token = sl<AuthLocalService>().getLocalToken();
      final response = await sl<DioClient>().get(
        NetworkConstant.getAllPostsUrl(size, page),
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      final List list = response.data['content'];
      final totalPosts = response.data['totalElements'];
      final List<PostDto> res = [];
      for (var item in list) {
        res.add(PostDto.fromJson(item));
      }
      print('total posts: $res');
      return AllPostsRes(posts: res, totalPosts: totalPosts);
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    throw Exception();
  }

  @override
  Future addPost({
    required UserDto user,
    required String token,
    required UploadPost post,
  }) async {
    final file = await MultipartFile.fromFile(post.imagePath);

    print('UserApiServiceImpl addPost() ${file.length}');
    final formData = FormData.fromMap({
      // 'caption': post.caption,
      'file': file,
    });
    await sl<DioClient>().post(
      NetworkConstant.POSTS,
      queryParameters: {'caption': post.caption},
      data: formData,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'multipart/form-data',
        },
      ),
    );
  }
}
