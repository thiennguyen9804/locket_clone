import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_req.g.dart';
part 'sign_in_req.freezed.dart';

@freezed
class SignInReq with _$SignInReq {
  const factory SignInReq({
    required String loginInfo,
    required String password,
  }) = _SignInReq;

  factory SignInReq.fromJson(Map<String, Object?> json) =>
      _$SignInReqFromJson(json);
}
