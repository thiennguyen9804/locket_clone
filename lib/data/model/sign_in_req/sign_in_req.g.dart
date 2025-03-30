// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignInReqImpl _$$SignInReqImplFromJson(Map<String, dynamic> json) =>
    _$SignInReqImpl(
      loginInfo: json['loginInfo'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$SignInReqImplToJson(_$SignInReqImpl instance) =>
    <String, dynamic>{
      'loginInfo': instance.loginInfo,
      'password': instance.password,
    };
