part of 'button_cubit.dart';

@immutable
sealed class ButtonState {}

final class ButtonInitial extends ButtonState {}

final class ButtonInitialState extends ButtonState {}

final class ButtonLoadingState extends ButtonState {}

final class ButtonSuccessState extends ButtonState {}

final class ButtonFailureState extends ButtonState {
  final String errorMessage;

  ButtonFailureState({required this.errorMessage});

}

