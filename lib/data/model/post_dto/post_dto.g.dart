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
      createdAt: DateTime.parse(json['createdAt'] as String),
      interactionList:
          (json['interactionList'] as List<dynamic>)
              .map((e) => InteractionDto.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$PostDtoImplToJson(_$PostDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'user': instance.user,
      'caption': instance.caption,
      'createdAt': instance.createdAt.toIso8601String(),
      'interactionList': instance.interactionList,
    };
