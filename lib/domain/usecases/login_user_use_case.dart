import 'package:dartz/dartz.dart';
import 'package:locket_clone/core/usecases/usecase.dart';
import 'package:locket_clone/domain/repository/auth_repository.dart';

import '../../set_up_sl.dart';
import '../entities/user_entity.dart';

class LoginUserUseCase implements UseCase<UserEntity, dynamic> {
  @override
  Future<UserEntity> call({param}) async {
    return sl<AuthRepository>().loginCurrentUser();
  }
}
