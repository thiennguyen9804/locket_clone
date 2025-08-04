// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'interaction_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

InteractionDto _$InteractionDtoFromJson(Map<String, dynamic> json) {
  return _InteractionDto.fromJson(json);
}

/// @nodoc
mixin _$InteractionDto {
  int get id => throw _privateConstructorUsedError;
  UserDto get user => throw _privateConstructorUsedError;
  int get postId => throw _privateConstructorUsedError;
  String get emoji => throw _privateConstructorUsedError;

  /// Serializes this InteractionDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InteractionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InteractionDtoCopyWith<InteractionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InteractionDtoCopyWith<$Res> {
  factory $InteractionDtoCopyWith(
    InteractionDto value,
    $Res Function(InteractionDto) then,
  ) = _$InteractionDtoCopyWithImpl<$Res, InteractionDto>;
  @useResult
  $Res call({int id, UserDto user, int postId, String emoji});

  $UserDtoCopyWith<$Res> get user;
}

/// @nodoc
class _$InteractionDtoCopyWithImpl<$Res, $Val extends InteractionDto>
    implements $InteractionDtoCopyWith<$Res> {
  _$InteractionDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InteractionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? postId = null,
    Object? emoji = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int,
            user:
                null == user
                    ? _value.user
                    : user // ignore: cast_nullable_to_non_nullable
                        as UserDto,
            postId:
                null == postId
                    ? _value.postId
                    : postId // ignore: cast_nullable_to_non_nullable
                        as int,
            emoji:
                null == emoji
                    ? _value.emoji
                    : emoji // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }

  /// Create a copy of InteractionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<$Res> get user {
    return $UserDtoCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InteractionDtoImplCopyWith<$Res>
    implements $InteractionDtoCopyWith<$Res> {
  factory _$$InteractionDtoImplCopyWith(
    _$InteractionDtoImpl value,
    $Res Function(_$InteractionDtoImpl) then,
  ) = __$$InteractionDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, UserDto user, int postId, String emoji});

  @override
  $UserDtoCopyWith<$Res> get user;
}

/// @nodoc
class __$$InteractionDtoImplCopyWithImpl<$Res>
    extends _$InteractionDtoCopyWithImpl<$Res, _$InteractionDtoImpl>
    implements _$$InteractionDtoImplCopyWith<$Res> {
  __$$InteractionDtoImplCopyWithImpl(
    _$InteractionDtoImpl _value,
    $Res Function(_$InteractionDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InteractionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? postId = null,
    Object? emoji = null,
  }) {
    return _then(
      _$InteractionDtoImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
        user:
            null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                    as UserDto,
        postId:
            null == postId
                ? _value.postId
                : postId // ignore: cast_nullable_to_non_nullable
                    as int,
        emoji:
            null == emoji
                ? _value.emoji
                : emoji // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InteractionDtoImpl implements _InteractionDto {
  const _$InteractionDtoImpl({
    required this.id,
    required this.user,
    required this.postId,
    required this.emoji,
  });

  factory _$InteractionDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$InteractionDtoImplFromJson(json);

  @override
  final int id;
  @override
  final UserDto user;
  @override
  final int postId;
  @override
  final String emoji;

  @override
  String toString() {
    return 'InteractionDto(id: $id, user: $user, postId: $postId, emoji: $emoji)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InteractionDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.emoji, emoji) || other.emoji == emoji));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, user, postId, emoji);

  /// Create a copy of InteractionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InteractionDtoImplCopyWith<_$InteractionDtoImpl> get copyWith =>
      __$$InteractionDtoImplCopyWithImpl<_$InteractionDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$InteractionDtoImplToJson(this);
  }
}

abstract class _InteractionDto implements InteractionDto {
  const factory _InteractionDto({
    required final int id,
    required final UserDto user,
    required final int postId,
    required final String emoji,
  }) = _$InteractionDtoImpl;

  factory _InteractionDto.fromJson(Map<String, dynamic> json) =
      _$InteractionDtoImpl.fromJson;

  @override
  int get id;
  @override
  UserDto get user;
  @override
  int get postId;
  @override
  String get emoji;

  /// Create a copy of InteractionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InteractionDtoImplCopyWith<_$InteractionDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
