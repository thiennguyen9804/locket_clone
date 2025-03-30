part of 'keep_logged_in_cubit.dart';

@immutable
sealed class KeepLoggedInState {}

final class KeepLoggedInInitial extends KeepLoggedInState {}

final class KeepLoggedInFail extends KeepLoggedInState {
  final String msg;

  KeepLoggedInFail({required this.msg});
}

final class KeepLoggedInSuccess extends KeepLoggedInState {}
