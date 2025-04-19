import 'package:dio/dio.dart';
import 'package:locket_clone/core/constant/network_constant.dart';
import 'package:locket_clone/core/network/dio_client.dart';
import 'package:locket_clone/data/model/user_dto/user_dto.dart';
import 'package:locket_clone/presentation/data/upload_post.dart';
import 'package:locket_clone/set_up_sl.dart';

abstract class UserApiService {
  Future addPost({
    required UserDto user,
    required String token,
    required UploadPost post,
  });
}

class UserApiServiceImpl implements UserApiService {
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

    // await sl<DioClient>().post(
    //   NetworkConstant.POSTS,
    //   data: formData,
    //   options: Options(
    //     headers: {
    //       'Authorization': 'Bearer $token',
    //     },
    //   ),
    // );
  }
}
