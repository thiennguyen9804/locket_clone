import 'package:dartz/dartz.dart';
import 'package:locket_clone/data/model/sign_in_req/sign_in_req.dart';
import 'package:locket_clone/data/model/user_dto/user_dto.dart';
import 'package:locket_clone/data/source/auth_api_service.dart';
import 'package:locket_clone/domain/entities/user_entity.dart';

import '../../core/mapper/user_mapper/user_mapper.dart';
import '../../domain/repository/auth_repository.dart';
import '../../set_up_sl.dart';
import '../model/sign_in_res/sign_in_res.dart';
import '../source/auth_local_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<String, UserEntity>> signIn(SignInReq req) async {
    final res = await sl<AuthApiService>().signIn(req);
    return res.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        final signInRes = data;
        final user = signInRes.user;
        final userEntity = sl<UserMappr>().convert<UserDto, UserEntity>(user);
        sl<AuthLocalService>().writeToDb(signInRes);
        return Right(userEntity);
      },
    );
  }

  @override
  Future<UserEntity> getCurrentUser() async {
    final res = sl<AuthLocalService>().getLocalCurrentUser();
    final UserEntity userEntity = sl<UserMappr>().convert(res);
    return userEntity;
  }


  @override
  Future<UserEntity> loginCurrentUser() async {
    try {
      final userLocal = sl<AuthLocalService>().getLocalCurrentUser();
      
      final token = sl<AuthLocalService>().getLocalToken();
      print("local token: $token");
      final userApi = await sl<AuthApiService>().getCurrentUser(token);
      if (userLocal != userApi) {
        sl<AuthLocalService>()
            .writeToDb(SignInRes(token: token, user: userApi));
        return sl<UserMappr>().convert<UserDto, UserEntity>(userApi);
      } else {
        return sl<UserMappr>().convert<UserDto, UserEntity>(userLocal);
      }
    } catch (e) {
      rethrow;
    }
  }
}
