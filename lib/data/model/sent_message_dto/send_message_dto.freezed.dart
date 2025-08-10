// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_message_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SendMessageDto _$SendMessageDtoFromJson(Map<String, dynamic> json) {
  return _SendMessageDto.fromJson(json);
}

/// @nodoc
mixin _$SendMessageDto {
  String get text => throw _privateConstructorUsedError;
  int get receiverId => throw _privateConstructorUsedError;
  int? get postId => throw _privateConstructorUsedError;

  /// Serializes this SendMessageDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SendMessageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendMessageDtoCopyWith<SendMessageDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendMessageDtoCopyWith<$Res> {
  factory $SendMessageDtoCopyWith(
    SendMessageDto value,
    $Res Function(SendMessageDto) then,
  ) = _$SendMessageDtoCopyWithImpl<$Res, SendMessageDto>;
  @useResult
  $Res call({String text, int receiverId, int? postId});
}

/// @nodoc
class _$SendMessageDtoCopyWithImpl<$Res, $Val extends SendMessageDto>
    implements $SendMessageDtoCopyWith<$Res> {
  _$SendMessageDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendMessageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? receiverId = null,
    Object? postId = freezed,
  }) {
    return _then(
      _value.copyWith(
            text:
                null == text
                    ? _value.text
                    : text // ignore: cast_nullable_to_non_nullable
                        as String,
            receiverId:
                null == receiverId
                    ? _value.receiverId
                    : receiverId // ignore: cast_nullable_to_non_nullable
                        as int,
            postId:
                freezed == postId
                    ? _value.postId
                    : postId // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SendMessageDtoImplCopyWith<$Res>
    implements $SendMessageDtoCopyWith<$Res> {
  factory _$$SendMessageDtoImplCopyWith(
    _$SendMessageDtoImpl value,
    $Res Function(_$SendMessageDtoImpl) then,
  ) = __$$SendMessageDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, int receiverId, int? postId});
}

/// @nodoc
class __$$SendMessageDtoImplCopyWithImpl<$Res>
    extends _$SendMessageDtoCopyWithImpl<$Res, _$SendMessageDtoImpl>
    implements _$$SendMessageDtoImplCopyWith<$Res> {
  __$$SendMessageDtoImplCopyWithImpl(
    _$SendMessageDtoImpl _value,
    $Res Function(_$SendMessageDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SendMessageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? receiverId = null,
    Object? postId = freezed,
  }) {
    return _then(
      _$SendMessageDtoImpl(
        text:
            null == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                    as String,
        receiverId:
            null == receiverId
                ? _value.receiverId
                : receiverId // ignore: cast_nullable_to_non_nullable
                    as int,
        postId:
            freezed == postId
                ? _value.postId
                : postId // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SendMessageDtoImpl implements _SendMessageDto {
  const _$SendMessageDtoImpl({
    required this.text,
    required this.receiverId,
    this.postId,
  });

  factory _$SendMessageDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendMessageDtoImplFromJson(json);

  @override
  final String text;
  @override
  final int receiverId;
  @override
  final int? postId;

  @override
  String toString() {
    return 'SendMessageDto(text: $text, receiverId: $receiverId, postId: $postId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendMessageDtoImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.postId, postId) || other.postId == postId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text, receiverId, postId);

  /// Create a copy of SendMessageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendMessageDtoImplCopyWith<_$SendMessageDtoImpl> get copyWith =>
      __$$SendMessageDtoImplCopyWithImpl<_$SendMessageDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SendMessageDtoImplToJson(this);
  }
}

abstract class _SendMessageDto implements SendMessageDto {
  const factory _SendMessageDto({
    required final String text,
    required final int receiverId,
    final int? postId,
  }) = _$SendMessageDtoImpl;

  factory _SendMessageDto.fromJson(Map<String, dynamic> json) =
      _$SendMessageDtoImpl.fromJson;

  @override
  String get text;
  @override
  int get receiverId;
  @override
  int? get postId;

  /// Create a copy of SendMessageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendMessageDtoImplCopyWith<_$SendMessageDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
