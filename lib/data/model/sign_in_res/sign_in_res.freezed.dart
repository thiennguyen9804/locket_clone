// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SignInRes _$SignInResFromJson(Map<String, dynamic> json) {
  return _SignInRes.fromJson(json);
}

/// @nodoc
mixin _$SignInRes {
  String get token => throw _privateConstructorUsedError;
  UserDto get user => throw _privateConstructorUsedError;

  /// Serializes this SignInRes to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignInRes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignInResCopyWith<SignInRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInResCopyWith<$Res> {
  factory $SignInResCopyWith(SignInRes value, $Res Function(SignInRes) then) =
      _$SignInResCopyWithImpl<$Res, SignInRes>;
  @useResult
  $Res call({String token, UserDto user});

  $UserDtoCopyWith<$Res> get user;
}

/// @nodoc
class _$SignInResCopyWithImpl<$Res, $Val extends SignInRes>
    implements $SignInResCopyWith<$Res> {
  _$SignInResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignInRes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? token = null, Object? user = null}) {
    return _then(
      _value.copyWith(
            token:
                null == token
                    ? _value.token
                    : token // ignore: cast_nullable_to_non_nullable
                        as String,
            user:
                null == user
                    ? _value.user
                    : user // ignore: cast_nullable_to_non_nullable
                        as UserDto,
          )
          as $Val,
    );
  }

  /// Create a copy of SignInRes
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
abstract class _$$SignInResImplCopyWith<$Res>
    implements $SignInResCopyWith<$Res> {
  factory _$$SignInResImplCopyWith(
    _$SignInResImpl value,
    $Res Function(_$SignInResImpl) then,
  ) = __$$SignInResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, UserDto user});

  @override
  $UserDtoCopyWith<$Res> get user;
}

/// @nodoc
class __$$SignInResImplCopyWithImpl<$Res>
    extends _$SignInResCopyWithImpl<$Res, _$SignInResImpl>
    implements _$$SignInResImplCopyWith<$Res> {
  __$$SignInResImplCopyWithImpl(
    _$SignInResImpl _value,
    $Res Function(_$SignInResImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SignInRes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? token = null, Object? user = null}) {
    return _then(
      _$SignInResImpl(
        token:
            null == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                    as String,
        user:
            null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                    as UserDto,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SignInResImpl implements _SignInRes {
  const _$SignInResImpl({required this.token, required this.user});

  factory _$SignInResImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignInResImplFromJson(json);

  @override
  final String token;
  @override
  final UserDto user;

  @override
  String toString() {
    return 'SignInRes(token: $token, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInResImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, user);

  /// Create a copy of SignInRes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInResImplCopyWith<_$SignInResImpl> get copyWith =>
      __$$SignInResImplCopyWithImpl<_$SignInResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignInResImplToJson(this);
  }
}

abstract class _SignInRes implements SignInRes {
  const factory _SignInRes({
    required final String token,
    required final UserDto user,
  }) = _$SignInResImpl;

  factory _SignInRes.fromJson(Map<String, dynamic> json) =
      _$SignInResImpl.fromJson;

  @override
  String get token;
  @override
  UserDto get user;

  /// Create a copy of SignInRes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInResImplCopyWith<_$SignInResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
