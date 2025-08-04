// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoMapprGenerator
// **************************************************************************

// ignore_for_file: type=lint, unnecessary_cast, unused_local_variable

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart' as _i1;

import '../../../data/model/interaction_dto/interaction_dto.dart' as _i2;
import '../../../data/model/user_dto/user_dto.dart' as _i4;
import '../../../domain/entities/interaction_entity.dart' as _i3;
import '../../../domain/entities/user_entity.dart' as _i5;

/// {@template package:locket_clone/core/mapper/interaction_mapper/interaction_mapper.dart}
/// Available mappings:
/// - `InteractionDto` → `InteractionEntity`.
/// - `InteractionEntity` → `InteractionDto`.
/// - `UserDto` → `UserEntity`.
/// - `UserEntity` → `UserDto`.
/// {@endtemplate}
class $InteractionMapper implements _i1.AutoMapprInterface {
  const $InteractionMapper();

  Type _typeOf<T>() => T;

  List<_i1.AutoMapprInterface> get _delegates => const [];

  /// {@macro AutoMapprInterface:canConvert}
  /// {@macro package:locket_clone/core/mapper/interaction_mapper/interaction_mapper.dart}
  @override
  bool canConvert<SOURCE, TARGET>({bool recursive = true}) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.InteractionDto>() ||
            sourceTypeOf == _typeOf<_i2.InteractionDto?>()) &&
        (targetTypeOf == _typeOf<_i3.InteractionEntity>() ||
            targetTypeOf == _typeOf<_i3.InteractionEntity?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i3.InteractionEntity>() ||
            sourceTypeOf == _typeOf<_i3.InteractionEntity?>()) &&
        (targetTypeOf == _typeOf<_i2.InteractionDto>() ||
            targetTypeOf == _typeOf<_i2.InteractionDto?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i4.UserDto>() ||
            sourceTypeOf == _typeOf<_i4.UserDto?>()) &&
        (targetTypeOf == _typeOf<_i5.UserEntity>() ||
            targetTypeOf == _typeOf<_i5.UserEntity?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i5.UserEntity>() ||
            sourceTypeOf == _typeOf<_i5.UserEntity?>()) &&
        (targetTypeOf == _typeOf<_i4.UserDto>() ||
            targetTypeOf == _typeOf<_i4.UserDto?>())) {
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
  /// {@macro package:locket_clone/core/mapper/interaction_mapper/interaction_mapper.dart}
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
  /// {@macro package:locket_clone/core/mapper/interaction_mapper/interaction_mapper.dart}
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
  /// {@macro package:locket_clone/core/mapper/interaction_mapper/interaction_mapper.dart}
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
  /// {@macro package:locket_clone/core/mapper/interaction_mapper/interaction_mapper.dart}
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
  /// {@macro package:locket_clone/core/mapper/interaction_mapper/interaction_mapper.dart}
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
  /// {@macro package:locket_clone/core/mapper/interaction_mapper/interaction_mapper.dart}
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
  /// {@macro package:locket_clone/core/mapper/interaction_mapper/interaction_mapper.dart}
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
  /// {@macro package:locket_clone/core/mapper/interaction_mapper/interaction_mapper.dart}
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
    if ((sourceTypeOf == _typeOf<_i2.InteractionDto>() ||
            sourceTypeOf == _typeOf<_i2.InteractionDto?>()) &&
        (targetTypeOf == _typeOf<_i3.InteractionEntity>() ||
            targetTypeOf == _typeOf<_i3.InteractionEntity?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$InteractionDto_To__i3$InteractionEntity(
            (model as _i2.InteractionDto?),
          )
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i3.InteractionEntity>() ||
            sourceTypeOf == _typeOf<_i3.InteractionEntity?>()) &&
        (targetTypeOf == _typeOf<_i2.InteractionDto>() ||
            targetTypeOf == _typeOf<_i2.InteractionDto?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i3$InteractionEntity_To__i2$InteractionDto(
            (model as _i3.InteractionEntity?),
          )
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i4.UserDto>() ||
            sourceTypeOf == _typeOf<_i4.UserDto?>()) &&
        (targetTypeOf == _typeOf<_i5.UserEntity>() ||
            targetTypeOf == _typeOf<_i5.UserEntity?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i4$UserDto_To__i5$UserEntity((model as _i4.UserDto?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i5.UserEntity>() ||
            sourceTypeOf == _typeOf<_i5.UserEntity?>()) &&
        (targetTypeOf == _typeOf<_i4.UserDto>() ||
            targetTypeOf == _typeOf<_i4.UserDto?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i5$UserEntity_To__i4$UserDto((model as _i5.UserEntity?))
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
  /// {@macro package:locket_clone/core/mapper/interaction_mapper/interaction_mapper.dart}
  @override
  bool useSafeMapping<SOURCE, TARGET>() {
    return false;
  }

  _i3.InteractionEntity _map__i2$InteractionDto_To__i3$InteractionEntity(
    _i2.InteractionDto? input,
  ) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping InteractionDto → InteractionEntity failed because InteractionDto was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<InteractionDto, InteractionEntity> to handle null values during mapping.',
      );
    }
    return _i3.InteractionEntity(
      id: model.id,
      user: _map__i4$UserDto_To__i5$UserEntity(model.user),
      postId: model.postId,
      emoji: model.emoji,
    );
  }

  _i2.InteractionDto _map__i3$InteractionEntity_To__i2$InteractionDto(
    _i3.InteractionEntity? input,
  ) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping InteractionEntity → InteractionDto failed because InteractionEntity was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<InteractionEntity, InteractionDto> to handle null values during mapping.',
      );
    }
    return _i2.InteractionDto(
      id: model.id,
      user: _map__i5$UserEntity_To__i4$UserDto(model.user),
      postId: model.postId,
      emoji: model.emoji,
    );
  }

  _i5.UserEntity _map__i4$UserDto_To__i5$UserEntity(_i4.UserDto? input) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping UserDto → UserEntity failed because UserDto was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<UserDto, UserEntity> to handle null values during mapping.',
      );
    }
    return _i5.UserEntity(
      id: model.id,
      name: model.name,
      avatarUrl: model.avatarUrl,
      email: model.email,
      phoneNumber: model.phoneNumber,
    );
  }

  _i4.UserDto _map__i5$UserEntity_To__i4$UserDto(_i5.UserEntity? input) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping UserEntity → UserDto failed because UserEntity was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<UserEntity, UserDto> to handle null values during mapping.',
      );
    }
    return _i4.UserDto(
      id: model.id,
      name: model.name,
      avatarUrl: model.avatarUrl,
      email: model.email,
      phoneNumber: model.phoneNumber,
    );
  }
}
