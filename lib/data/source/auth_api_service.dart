import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:locket_clone/core/network/dio_client.dart';
import 'package:locket_clone/data/model/sign_in_res/sign_in_res.dart';

import '../../core/constant/network_constant.dart';
import '../../set_up_sl.dart';
import '../model/sign_in_req/sign_in_req.dart';
import '../model/user_dto/user_dto.dart';

abstract class AuthApiService {
  Future<Either<String, SignInRes>> signIn(SignInReq req);

  Future<UserDto> getCurrentUser(String token);

// Future<Either<String, SignInRes>> getUserById(String id);
}

class AuthApiServiceImpl implements AuthApiService {
  @override
  Future<Either<String, SignInRes>> signIn(SignInReq req) async {
    if (kDebugMode) {
      print('signIn req: $req');
    }
    try {
      final res = await sl<DioClient>()
          .post(NetworkConstant.SIGN_IN, data: req.toJson());

      final signInRes = SignInRes.fromJson(res.data);

      return Right(signInRes);
    } on DioException catch (e) {
      if (kDebugMode) {
        print('signIn exception: ${e.response?.data}');
      }
      final msg = e.response?.data;
      return Left(msg);
    } catch (e) {
      return Left('Something went wrong with login');
    }
  }

  @override
  Future<UserDto> getCurrentUser(String token) async {
    try {
      final res = await sl<DioClient>().get(
        NetworkConstant.USER,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      UserDto userDto = UserDto.fromJson(res.data);
      print("AuthApiServiceImpl getCurrentUser userDto: $userDto");
      return userDto;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }
}
