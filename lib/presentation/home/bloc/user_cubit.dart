import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:locket_clone/data/source/auth_local_service.dart';
import 'package:locket_clone/domain/entities/user_entity.dart';
import 'package:locket_clone/domain/repository/auth_repository.dart';
import 'package:locket_clone/set_up_sl.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserLoading());

  void getCurrentUser() async {
    emit(UserLoading());
    final res = await sl<AuthRepository>().getCurrentUser();
    emit(UserLoadedSuccess(userEntity: res));
  }
}
