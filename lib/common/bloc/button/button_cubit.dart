import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import '../../../core/usecases/usecase.dart';

part 'button_state.dart';

class ButtonCubit extends Cubit<ButtonState> {
  ButtonCubit() : super(ButtonInitial());

  void execute({dynamic params, required UseCase usecase}) async {
    emit(ButtonLoadingState());
    try {
      Either result = await usecase.call(param: params);
      result.fold(
        (error) {
          emit(
            ButtonFailureState(errorMessage: error),
          );
        },
        (data) {
          emit(ButtonSuccessState());
        },
      );
    } catch (e) {
      emit(ButtonFailureState(errorMessage: e.toString()));
    }
  }
}
