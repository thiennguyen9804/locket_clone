// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MessageDto _$MessageDtoFromJson(Map<String, dynamic> json) {
  return _MessageDto.fromJson(json);
}

/// @nodoc
mixin _$MessageDto {
  String get text => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  UserDto get sender => throw _privateConstructorUsedError;
  UserDto get receiver => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this MessageDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageDtoCopyWith<MessageDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageDtoCopyWith<$Res> {
  factory $MessageDtoCopyWith(
    MessageDto value,
    $Res Function(MessageDto) then,
  ) = _$MessageDtoCopyWithImpl<$Res, MessageDto>;
  @useResult
  $Res call({
    String text,
    String? imageUrl,
    UserDto sender,
    UserDto receiver,
    DateTime createdAt,
  });

  $UserDtoCopyWith<$Res> get sender;
  $UserDtoCopyWith<$Res> get receiver;
}

/// @nodoc
class _$MessageDtoCopyWithImpl<$Res, $Val extends MessageDto>
    implements $MessageDtoCopyWith<$Res> {
  _$MessageDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? imageUrl = freezed,
    Object? sender = null,
    Object? receiver = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            text:
                null == text
                    ? _value.text
                    : text // ignore: cast_nullable_to_non_nullable
                        as String,
            imageUrl:
                freezed == imageUrl
                    ? _value.imageUrl
                    : imageUrl // ignore: cast_nullable_to_non_nullable
                        as String?,
            sender:
                null == sender
                    ? _value.sender
                    : sender // ignore: cast_nullable_to_non_nullable
                        as UserDto,
            receiver:
                null == receiver
                    ? _value.receiver
                    : receiver // ignore: cast_nullable_to_non_nullable
                        as UserDto,
            createdAt:
                null == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
          )
          as $Val,
    );
  }

  /// Create a copy of MessageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<$Res> get sender {
    return $UserDtoCopyWith<$Res>(_value.sender, (value) {
      return _then(_value.copyWith(sender: value) as $Val);
    });
  }

  /// Create a copy of MessageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<$Res> get receiver {
    return $UserDtoCopyWith<$Res>(_value.receiver, (value) {
      return _then(_value.copyWith(receiver: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MessageDtoImplCopyWith<$Res>
    implements $MessageDtoCopyWith<$Res> {
  factory _$$MessageDtoImplCopyWith(
    _$MessageDtoImpl value,
    $Res Function(_$MessageDtoImpl) then,
  ) = __$$MessageDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String text,
    String? imageUrl,
    UserDto sender,
    UserDto receiver,
    DateTime createdAt,
  });

  @override
  $UserDtoCopyWith<$Res> get sender;
  @override
  $UserDtoCopyWith<$Res> get receiver;
}

/// @nodoc
class __$$MessageDtoImplCopyWithImpl<$Res>
    extends _$MessageDtoCopyWithImpl<$Res, _$MessageDtoImpl>
    implements _$$MessageDtoImplCopyWith<$Res> {
  __$$MessageDtoImplCopyWithImpl(
    _$MessageDtoImpl _value,
    $Res Function(_$MessageDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MessageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? imageUrl = freezed,
    Object? sender = null,
    Object? receiver = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$MessageDtoImpl(
        text:
            null == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                    as String,
        imageUrl:
            freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                    as String?,
        sender:
            null == sender
                ? _value.sender
                : sender // ignore: cast_nullable_to_non_nullable
                    as UserDto,
        receiver:
            null == receiver
                ? _value.receiver
                : receiver // ignore: cast_nullable_to_non_nullable
                    as UserDto,
        createdAt:
            null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageDtoImpl implements _MessageDto {
  const _$MessageDtoImpl({
    required this.text,
    this.imageUrl,
    required this.sender,
    required this.receiver,
    required this.createdAt,
  });

  factory _$MessageDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageDtoImplFromJson(json);

  @override
  final String text;
  @override
  final String? imageUrl;
  @override
  final UserDto sender;
  @override
  final UserDto receiver;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'MessageDto(text: $text, imageUrl: $imageUrl, sender: $sender, receiver: $receiver, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageDtoImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.receiver, receiver) ||
                other.receiver == receiver) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, text, imageUrl, sender, receiver, createdAt);

  /// Create a copy of MessageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageDtoImplCopyWith<_$MessageDtoImpl> get copyWith =>
      __$$MessageDtoImplCopyWithImpl<_$MessageDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageDtoImplToJson(this);
  }
}

abstract class _MessageDto implements MessageDto {
  const factory _MessageDto({
    required final String text,
    final String? imageUrl,
    required final UserDto sender,
    required final UserDto receiver,
    required final DateTime createdAt,
  }) = _$MessageDtoImpl;

  factory _MessageDto.fromJson(Map<String, dynamic> json) =
      _$MessageDtoImpl.fromJson;

  @override
  String get text;
  @override
  String? get imageUrl;
  @override
  UserDto get sender;
  @override
  UserDto get receiver;
  @override
  DateTime get createdAt;

  /// Create a copy of MessageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageDtoImplCopyWith<_$MessageDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
