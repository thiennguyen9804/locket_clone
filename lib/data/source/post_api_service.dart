import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:locket_clone/core/constant/network_constant.dart';
import 'package:locket_clone/core/network/dio_client.dart';
import 'package:locket_clone/data/model/all_posts_res.dart';
import 'package:locket_clone/data/model/post_dto/post_dto.dart';
import 'package:locket_clone/data/source/auth_local_service.dart';
import 'package:locket_clone/set_up_sl.dart';

abstract class PostApiService {
  Future<PostDto> getPostById(String postId);

  Future<AllPostsRes> loadPosts(int size, int page);
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
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
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
}
