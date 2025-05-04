import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:locket_clone/core/usecases/usecase.dart';
import 'package:locket_clone/domain/entities/user_entity.dart';

import '../../set_up_sl.dart';
import '../repository/auth_repository.dart';

class GetCurrentUserUseCase implements UseCase<UserEntity, dynamic> {
  UserEntity? user;
  @override
  Future<UserEntity> call({param}) async {
    if(user == null) {
      user = await sl<AuthRepository>().getCurrentUser();
      return user!;
    } else {
      return user!;
    }
  }
}
