import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:locket_clone/domain/repository/auth_repository.dart';
import 'package:locket_clone/domain/usecases/login_user_use_case.dart';
import 'package:meta/meta.dart';

import '../../../set_up_sl.dart';

part 'keep_logged_in_state.dart';

class KeepLoggedInCubit extends Cubit<KeepLoggedInState> {
  KeepLoggedInCubit() : super(KeepLoggedInInitial());

  void execute() async {
    try {
      emit(KeepLoggedInInitial());
      await sl<LoginUserUseCase>().call();
      emit(KeepLoggedInSuccess());
    } on DioException catch (e) {
      emit(KeepLoggedInFail(msg: e.toString()));
    } catch (e) {
      print(e.toString());
      emit(KeepLoggedInFail(msg: e.toString()));
    }
  }
}
