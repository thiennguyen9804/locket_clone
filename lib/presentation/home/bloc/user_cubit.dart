import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:locket_clone/domain/entities/user_entity.dart';
import 'package:locket_clone/domain/usecases/get_current_user_use_case.dart';
import 'package:locket_clone/set_up_sl.dart';
import 'package:meta/meta.dart';

import '../../../core/usecases/usecase.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserLoading());

  void getCurrentUser(UseCase usecase) async {
    emit(UserLoading());
    final res = await sl<GetCurrentUserUseCase>().call();
    await Future.delayed(Duration(seconds: 3));
    emit(UserLoadedSuccess(userEntity: res));
  }
}
