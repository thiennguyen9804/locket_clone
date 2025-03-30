import 'package:dartz/dartz.dart';
import 'package:locket_clone/core/usecases/usecase.dart';
import 'package:locket_clone/data/model/sign_in_req/sign_in_req.dart';

import '../../set_up_sl.dart';
import '../repository/auth_repository.dart';


class SignInUseCase implements UseCase<Either, SignInReq> {
  @override
  Future<Either> call({SignInReq? param}) async {
    return sl<AuthRepository>().signIn(param!);
  }

}