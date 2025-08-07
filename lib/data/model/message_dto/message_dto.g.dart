// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageDtoImpl _$$MessageDtoImplFromJson(Map<String, dynamic> json) =>
    _$MessageDtoImpl(
      text: json['text'] as String,
      imageUrl: json['imageUrl'] as String?,
      sender: UserDto.fromJson(json['sender'] as Map<String, dynamic>),
      receiver: UserDto.fromJson(json['receiver'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$MessageDtoImplToJson(_$MessageDtoImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'imageUrl': instance.imageUrl,
      'sender': instance.sender,
      'receiver': instance.receiver,
      'createdAt': instance.createdAt.toIso8601String(),
    };
