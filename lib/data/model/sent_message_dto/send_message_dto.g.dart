// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SendMessageDtoImpl _$$SendMessageDtoImplFromJson(Map<String, dynamic> json) =>
    _$SendMessageDtoImpl(
      text: json['text'] as String,
      receiverId: (json['receiverId'] as num).toInt(),
      post:
          json['post'] == null
              ? null
              : PostDto.fromJson(json['post'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SendMessageDtoImplToJson(
  _$SendMessageDtoImpl instance,
) => <String, dynamic>{
  'text': instance.text,
  'receiverId': instance.receiverId,
  'post': instance.post,
};
