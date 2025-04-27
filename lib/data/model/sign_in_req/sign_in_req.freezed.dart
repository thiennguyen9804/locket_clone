// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_req.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SignInReq _$SignInReqFromJson(Map<String, dynamic> json) {
  return _SignInReq.fromJson(json);
}

/// @nodoc
mixin _$SignInReq {
  String get loginInfo => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Serializes this SignInReq to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignInReq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignInReqCopyWith<SignInReq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInReqCopyWith<$Res> {
  factory $SignInReqCopyWith(SignInReq value, $Res Function(SignInReq) then) =
      _$SignInReqCopyWithImpl<$Res, SignInReq>;
  @useResult
  $Res call({String loginInfo, String password});
}

/// @nodoc
class _$SignInReqCopyWithImpl<$Res, $Val extends SignInReq>
    implements $SignInReqCopyWith<$Res> {
  _$SignInReqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignInReq
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? loginInfo = null, Object? password = null}) {
    return _then(
      _value.copyWith(
            loginInfo:
                null == loginInfo
                    ? _value.loginInfo
                    : loginInfo // ignore: cast_nullable_to_non_nullable
                        as String,
            password:
                null == password
                    ? _value.password
                    : password // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SignInReqImplCopyWith<$Res>
    implements $SignInReqCopyWith<$Res> {
  factory _$$SignInReqImplCopyWith(
    _$SignInReqImpl value,
    $Res Function(_$SignInReqImpl) then,
  ) = __$$SignInReqImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String loginInfo, String password});
}

/// @nodoc
class __$$SignInReqImplCopyWithImpl<$Res>
    extends _$SignInReqCopyWithImpl<$Res, _$SignInReqImpl>
    implements _$$SignInReqImplCopyWith<$Res> {
  __$$SignInReqImplCopyWithImpl(
    _$SignInReqImpl _value,
    $Res Function(_$SignInReqImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SignInReq
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? loginInfo = null, Object? password = null}) {
    return _then(
      _$SignInReqImpl(
        loginInfo:
            null == loginInfo
                ? _value.loginInfo
                : loginInfo // ignore: cast_nullable_to_non_nullable
                    as String,
        password:
            null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SignInReqImpl implements _SignInReq {
  const _$SignInReqImpl({required this.loginInfo, required this.password});

  factory _$SignInReqImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignInReqImplFromJson(json);

  @override
  final String loginInfo;
  @override
  final String password;

  @override
  String toString() {
    return 'SignInReq(loginInfo: $loginInfo, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInReqImpl &&
            (identical(other.loginInfo, loginInfo) ||
                other.loginInfo == loginInfo) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, loginInfo, password);

  /// Create a copy of SignInReq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInReqImplCopyWith<_$SignInReqImpl> get copyWith =>
      __$$SignInReqImplCopyWithImpl<_$SignInReqImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignInReqImplToJson(this);
  }
}

abstract class _SignInReq implements SignInReq {
  const factory _SignInReq({
    required final String loginInfo,
    required final String password,
  }) = _$SignInReqImpl;

  factory _SignInReq.fromJson(Map<String, dynamic> json) =
      _$SignInReqImpl.fromJson;

  @override
  String get loginInfo;
  @override
  String get password;

  /// Create a copy of SignInReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInReqImplCopyWith<_$SignInReqImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
