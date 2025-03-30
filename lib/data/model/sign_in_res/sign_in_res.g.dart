// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignInResImpl _$$SignInResImplFromJson(Map<String, dynamic> json) =>
    _$SignInResImpl(
      token: json['token'] as String,
      user: UserDto.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SignInResImplToJson(_$SignInResImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
    };
