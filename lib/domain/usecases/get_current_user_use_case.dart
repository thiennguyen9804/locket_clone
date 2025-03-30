import 'package:dartz/dartz.dart';
import 'package:locket_clone/core/usecases/usecase.dart';
import 'package:locket_clone/domain/entities/user_entity.dart';

import '../../set_up_sl.dart';
import '../repository/auth_repository.dart';

class GetCurrentUserUseCase implements UseCase<UserEntity, dynamic> {
  @override
  Future<UserEntity> call({param}) {
    return sl<AuthRepository>().getCurrentUser();
  }
}
