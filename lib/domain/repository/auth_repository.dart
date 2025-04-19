import 'package:dartz/dartz.dart';
import 'package:locket_clone/data/model/sign_in_req/sign_in_req.dart';

import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<String, UserEntity>> signIn(SignInReq req);
  Future<UserEntity> getCurrentUser();
  Future<UserEntity> loginCurrentUser();
}
