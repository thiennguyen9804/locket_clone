// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoMapprGenerator
// **************************************************************************

// ignore_for_file: type=lint, unnecessary_cast, unused_local_variable

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart' as _i1;

import '../../../data/model/post_dto/post_dto.dart' as _i2;
import '../../../data/model/post_local_data.dart' as _i4;
import '../../../data/model/user_dto/user_dto.dart' as _i5;
import '../../../domain/entities/post_entity.dart' as _i3;
import '../../../domain/entities/user_entity.dart' as _i6;
import 'post_mapper.dart' as _i7;

/// {@template package:locket_clone/core/mapper/post_mapper/post_mapper.dart}
/// Available mappings:
/// - `PostDto` → `PostEntity`.
/// - `PostEntity` → `PostDto`.
/// - `PostEntity` → `PostLocalData`.
/// - `UserDto` → `UserEntity`.
/// - `UserEntity` → `UserDto`.
/// {@endtemplate}
class $PostMapper implements _i1.AutoMapprInterface {
  const $PostMapper();

  Type _typeOf<T>() => T;

  List<_i1.AutoMapprInterface> get _delegates => const [];

  /// {@macro AutoMapprInterface:canConvert}
  /// {@macro package:locket_clone/core/mapper/post_mapper/post_mapper.dart}
  @override
  bool canConvert<SOURCE, TARGET>({bool recursive = true}) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.PostDto>() ||
            sourceTypeOf == _typeOf<_i2.PostDto?>()) &&
        (targetTypeOf == _typeOf<_i3.PostEntity>() ||
            targetTypeOf == _typeOf<_i3.PostEntity?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i3.PostEntity>() ||
            sourceTypeOf == _typeOf<_i3.PostEntity?>()) &&
        (targetTypeOf == _typeOf<_i2.PostDto>() ||
            targetTypeOf == _typeOf<_i2.PostDto?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i3.PostEntity>() ||
            sourceTypeOf == _typeOf<_i3.PostEntity?>()) &&
        (targetTypeOf == _typeOf<_i4.PostLocalData>() ||
            targetTypeOf == _typeOf<_i4.PostLocalData?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i5.UserDto>() ||
            sourceTypeOf == _typeOf<_i5.UserDto?>()) &&
        (targetTypeOf == _typeOf<_i6.UserEntity>() ||
            targetTypeOf == _typeOf<_i6.UserEntity?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i6.UserEntity>() ||
            sourceTypeOf == _typeOf<_i6.UserEntity?>()) &&
        (targetTypeOf == _typeOf<_i5.UserDto>() ||
            targetTypeOf == _typeOf<_i5.UserDto?>())) {
      return true;
    }
    if (recursive) {
      for (final mappr in _delegates) {
        if (mappr.canConvert<SOURCE, TARGET>()) {
          return true;
        }
      }
    }
    return false;
  }

  /// {@macro AutoMapprInterface:convert}
  /// {@macro package:locket_clone/core/mapper/post_mapper/post_mapper.dart}
  @override
  TARGET convert<SOURCE, TARGET>(SOURCE? model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return _convert(model)!;
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convert(model)!;
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:tryConvert}
  /// {@macro package:locket_clone/core/mapper/post_mapper/post_mapper.dart}
  @override
  TARGET? tryConvert<SOURCE, TARGET>(
    SOURCE? model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
    onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return _safeConvert(model, onMappingError: onMappingError);
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvert(model, onMappingError: onMappingError);
      }
    }

    return null;
  }

  /// {@macro AutoMapprInterface:convertIterable}
  /// {@macro package:locket_clone/core/mapper/post_mapper/post_mapper.dart}
  @override
  Iterable<TARGET> convertIterable<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return model.map<TARGET>((item) => _convert(item)!);
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertIterable(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into Iterable.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:locket_clone/core/mapper/post_mapper/post_mapper.dart}
  @override
  Iterable<TARGET?> tryConvertIterable<SOURCE, TARGET>(
    Iterable<SOURCE?> model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
    onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return model.map<TARGET?>(
        (item) => _safeConvert(item, onMappingError: onMappingError),
      );
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertIterable(model, onMappingError: onMappingError);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:convertList}
  /// {@macro package:locket_clone/core/mapper/post_mapper/post_mapper.dart}
  @override
  List<TARGET> convertList<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return convertIterable<SOURCE, TARGET>(model).toList();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertList(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into List.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:locket_clone/core/mapper/post_mapper/post_mapper.dart}
  @override
  List<TARGET?> tryConvertList<SOURCE, TARGET>(
    Iterable<SOURCE?> model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
    onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return tryConvertIterable<SOURCE, TARGET>(
        model,
        onMappingError: onMappingError,
      ).toList();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertList(model, onMappingError: onMappingError);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:convertSet}
  /// {@macro package:locket_clone/core/mapper/post_mapper/post_mapper.dart}
  @override
  Set<TARGET> convertSet<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return convertIterable<SOURCE, TARGET>(model).toSet();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertSet(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into Set.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:locket_clone/core/mapper/post_mapper/post_mapper.dart}
  @override
  Set<TARGET?> tryConvertSet<SOURCE, TARGET>(
    Iterable<SOURCE?> model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
    onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return tryConvertIterable<SOURCE, TARGET>(
        model,
        onMappingError: onMappingError,
      ).toSet();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertSet(model, onMappingError: onMappingError);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  TARGET? _convert<SOURCE, TARGET>(
    SOURCE? model, {
    bool canReturnNull = false,
  }) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.PostDto>() ||
            sourceTypeOf == _typeOf<_i2.PostDto?>()) &&
        (targetTypeOf == _typeOf<_i3.PostEntity>() ||
            targetTypeOf == _typeOf<_i3.PostEntity?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$PostDto_To__i3$PostEntity((model as _i2.PostDto?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i3.PostEntity>() ||
            sourceTypeOf == _typeOf<_i3.PostEntity?>()) &&
        (targetTypeOf == _typeOf<_i2.PostDto>() ||
            targetTypeOf == _typeOf<_i2.PostDto?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i3$PostEntity_To__i2$PostDto((model as _i3.PostEntity?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i3.PostEntity>() ||
            sourceTypeOf == _typeOf<_i3.PostEntity?>()) &&
        (targetTypeOf == _typeOf<_i4.PostLocalData>() ||
            targetTypeOf == _typeOf<_i4.PostLocalData?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i3$PostEntity_To__i4$PostLocalData(
            (model as _i3.PostEntity?),
          )
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i5.UserDto>() ||
            sourceTypeOf == _typeOf<_i5.UserDto?>()) &&
        (targetTypeOf == _typeOf<_i6.UserEntity>() ||
            targetTypeOf == _typeOf<_i6.UserEntity?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i5$UserDto_To__i6$UserEntity((model as _i5.UserDto?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i6.UserEntity>() ||
            sourceTypeOf == _typeOf<_i6.UserEntity?>()) &&
        (targetTypeOf == _typeOf<_i5.UserDto>() ||
            targetTypeOf == _typeOf<_i5.UserDto?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i6$UserEntity_To__i5$UserDto((model as _i6.UserEntity?))
          as TARGET);
    }
    throw Exception('No ${model.runtimeType} -> $targetTypeOf mapping.');
  }

  TARGET? _safeConvert<SOURCE, TARGET>(
    SOURCE? model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
    onMappingError,
  }) {
    if (!useSafeMapping<SOURCE, TARGET>()) {
      return _convert(model, canReturnNull: true);
    }
    try {
      return _convert(model, canReturnNull: true);
    } catch (e, s) {
      onMappingError?.call(e, s, model);
      return null;
    }
  }

  /// {@macro AutoMapprInterface:useSafeMapping}
  /// {@macro package:locket_clone/core/mapper/post_mapper/post_mapper.dart}
  @override
  bool useSafeMapping<SOURCE, TARGET>() {
    return false;
  }

  _i3.PostEntity _map__i2$PostDto_To__i3$PostEntity(_i2.PostDto? input) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping PostDto → PostEntity failed because PostDto was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<PostDto, PostEntity> to handle null values during mapping.',
      );
    }
    return _i3.PostEntity(
      id: model.id,
      imageUrl: model.imageUrl,
      user: _map__i5$UserDto_To__i6$UserEntity(model.user),
      caption: model.caption,
      interactionList: model.interactionList,
      createdAt: model.createdAt,
    );
  }

  _i2.PostDto _map__i3$PostEntity_To__i2$PostDto(_i3.PostEntity? input) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping PostEntity → PostDto failed because PostEntity was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<PostEntity, PostDto> to handle null values during mapping.',
      );
    }
    return _i2.PostDto(
      id: model.id,
      imageUrl: model.imageUrl,
      user: _map__i6$UserEntity_To__i5$UserDto(model.user),
      caption: model.caption,
      interactionList: model.interactionList,
      createdAt: model.createdAt,
    );
  }

  _i4.PostLocalData _map__i3$PostEntity_To__i4$PostLocalData(
    _i3.PostEntity? input,
  ) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping PostEntity → PostLocalData failed because PostEntity was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<PostEntity, PostLocalData> to handle null values during mapping.',
      );
    }
    return _i4.PostLocalData(
      id: model.id,
      imageUrl: model.imageUrl,
      userId: _i7.PostMapper.userDtoToInt(model),
      caption: model.caption,
      interactionList: model.interactionList,
      createdAt: model.createdAt,
    );
  }

  _i6.UserEntity _map__i5$UserDto_To__i6$UserEntity(_i5.UserDto? input) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping UserDto → UserEntity failed because UserDto was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<UserDto, UserEntity> to handle null values during mapping.',
      );
    }
    return _i6.UserEntity(
      id: model.id,
      name: model.name,
      avatarUrl: model.avatarUrl,
      email: model.email,
      phoneNumber: model.phoneNumber,
    );
  }

  _i5.UserDto _map__i6$UserEntity_To__i5$UserDto(_i6.UserEntity? input) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping UserEntity → UserDto failed because UserEntity was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<UserEntity, UserDto> to handle null values during mapping.',
      );
    }
    return _i5.UserDto(
      id: model.id,
      name: model.name,
      avatarUrl: model.avatarUrl,
      email: model.email,
      phoneNumber: model.phoneNumber,
    );
  }
}
