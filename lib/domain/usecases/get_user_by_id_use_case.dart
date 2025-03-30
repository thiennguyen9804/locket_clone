import 'package:dartz/dartz.dart';
import 'package:locket_clone/domain/entities/user_entity.dart';
import 'package:locket_clone/domain/repository/auth_repository.dart';
import 'package:locket_clone/domain/repository/post_repository.dart';

import '../../core/usecases/usecase.dart';
import '../../set_up_sl.dart';
import '../entities/post_entity.dart';

class GetUserByIdUseCase implements UseCase<UserEntity, String> {
  @override
  Future<UserEntity> call({String? param}) async {
    return sl<AuthRepository>().getUserById(param!);
  }
}
