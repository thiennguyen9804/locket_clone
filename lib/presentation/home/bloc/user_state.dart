part of 'user_cubit.dart';

@immutable
sealed class UserState {}


final class UserLoading extends UserState {}

final class UserLoadedSuccess extends UserState {
  final UserEntity userEntity;

  UserLoadedSuccess({required this.userEntity});
}

final class UserLoadedFail extends UserState {
  final String errorMsg;

  UserLoadedFail({required this.errorMsg});
}