import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:locket_clone/domain/entities/user_entity.dart';

import '../user_dto/user_dto.dart';

part 'sign_in_res.freezed.dart';
part 'sign_in_res.g.dart';

@freezed
class SignInRes with _$SignInRes {
  const factory SignInRes({
    required String token,
    required UserDto user,
  }) = _SignInRes;

  factory SignInRes.fromJson(Map<String, dynamic> json) =>
      _$SignInResFromJson(json);
}

