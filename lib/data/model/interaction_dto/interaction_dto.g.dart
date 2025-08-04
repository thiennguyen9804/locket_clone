// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interaction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InteractionDtoImpl _$$InteractionDtoImplFromJson(Map<String, dynamic> json) =>
    _$InteractionDtoImpl(
      id: (json['id'] as num).toInt(),
      user: UserDto.fromJson(json['user'] as Map<String, dynamic>),
      postId: (json['postId'] as num).toInt(),
      emoji: json['emoji'] as String,
    );

Map<String, dynamic> _$$InteractionDtoImplToJson(
  _$InteractionDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'user': instance.user,
  'postId': instance.postId,
  'emoji': instance.emoji,
};
