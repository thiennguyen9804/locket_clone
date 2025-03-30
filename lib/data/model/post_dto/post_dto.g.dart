// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostDtoImpl _$$PostDtoImplFromJson(Map<String, dynamic> json) =>
    _$PostDtoImpl(
      id: (json['id'] as num).toInt(),
      imageUrl: json['imageUrl'] as String,
      user: UserDto.fromJson(json['user'] as Map<String, dynamic>),
      caption: json['caption'] as String,
      interactionList: json['interactionList'],
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$PostDtoImplToJson(_$PostDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'user': instance.user,
      'caption': instance.caption,
      'interactionList': instance.interactionList,
      'createdAt': instance.createdAt.toIso8601String(),
    };
