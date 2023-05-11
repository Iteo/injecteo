// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dispose_function_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DisposeFunctionConfig _$DisposeFunctionConfigFromJson(
    Map<String, dynamic> json) {
  return _DisposeFunctionConfig.fromJson(json);
}

/// @nodoc
mixin _$DisposeFunctionConfig {
  String get name => throw _privateConstructorUsedError;
  bool get isInstance => throw _privateConstructorUsedError;
  ImportableType? get importableType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DisposeFunctionConfigCopyWith<DisposeFunctionConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisposeFunctionConfigCopyWith<$Res> {
  factory $DisposeFunctionConfigCopyWith(DisposeFunctionConfig value,
          $Res Function(DisposeFunctionConfig) then) =
      _$DisposeFunctionConfigCopyWithImpl<$Res, DisposeFunctionConfig>;
  @useResult
  $Res call({String name, bool isInstance, ImportableType? importableType});

  $ImportableTypeCopyWith<$Res>? get importableType;
}

/// @nodoc
class _$DisposeFunctionConfigCopyWithImpl<$Res,
        $Val extends DisposeFunctionConfig>
    implements $DisposeFunctionConfigCopyWith<$Res> {
  _$DisposeFunctionConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? isInstance = null,
    Object? importableType = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isInstance: null == isInstance
          ? _value.isInstance
          : isInstance // ignore: cast_nullable_to_non_nullable
              as bool,
      importableType: freezed == importableType
          ? _value.importableType
          : importableType // ignore: cast_nullable_to_non_nullable
              as ImportableType?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImportableTypeCopyWith<$Res>? get importableType {
    if (_value.importableType == null) {
      return null;
    }

    return $ImportableTypeCopyWith<$Res>(_value.importableType!, (value) {
      return _then(_value.copyWith(importableType: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DisposeFunctionConfigCopyWith<$Res>
    implements $DisposeFunctionConfigCopyWith<$Res> {
  factory _$$_DisposeFunctionConfigCopyWith(_$_DisposeFunctionConfig value,
          $Res Function(_$_DisposeFunctionConfig) then) =
      __$$_DisposeFunctionConfigCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, bool isInstance, ImportableType? importableType});

  @override
  $ImportableTypeCopyWith<$Res>? get importableType;
}

/// @nodoc
class __$$_DisposeFunctionConfigCopyWithImpl<$Res>
    extends _$DisposeFunctionConfigCopyWithImpl<$Res, _$_DisposeFunctionConfig>
    implements _$$_DisposeFunctionConfigCopyWith<$Res> {
  __$$_DisposeFunctionConfigCopyWithImpl(_$_DisposeFunctionConfig _value,
      $Res Function(_$_DisposeFunctionConfig) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? isInstance = null,
    Object? importableType = freezed,
  }) {
    return _then(_$_DisposeFunctionConfig(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isInstance: null == isInstance
          ? _value.isInstance
          : isInstance // ignore: cast_nullable_to_non_nullable
              as bool,
      importableType: freezed == importableType
          ? _value.importableType
          : importableType // ignore: cast_nullable_to_non_nullable
              as ImportableType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DisposeFunctionConfig implements _DisposeFunctionConfig {
  const _$_DisposeFunctionConfig(
      {required this.name, this.isInstance = false, this.importableType});

  factory _$_DisposeFunctionConfig.fromJson(Map<String, dynamic> json) =>
      _$$_DisposeFunctionConfigFromJson(json);

  @override
  final String name;
  @override
  @JsonKey()
  final bool isInstance;
  @override
  final ImportableType? importableType;

  @override
  String toString() {
    return 'DisposeFunctionConfig(name: $name, isInstance: $isInstance, importableType: $importableType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DisposeFunctionConfig &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isInstance, isInstance) ||
                other.isInstance == isInstance) &&
            (identical(other.importableType, importableType) ||
                other.importableType == importableType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, isInstance, importableType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DisposeFunctionConfigCopyWith<_$_DisposeFunctionConfig> get copyWith =>
      __$$_DisposeFunctionConfigCopyWithImpl<_$_DisposeFunctionConfig>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DisposeFunctionConfigToJson(
      this,
    );
  }
}

abstract class _DisposeFunctionConfig implements DisposeFunctionConfig {
  const factory _DisposeFunctionConfig(
      {required final String name,
      final bool isInstance,
      final ImportableType? importableType}) = _$_DisposeFunctionConfig;

  factory _DisposeFunctionConfig.fromJson(Map<String, dynamic> json) =
      _$_DisposeFunctionConfig.fromJson;

  @override
  String get name;
  @override
  bool get isInstance;
  @override
  ImportableType? get importableType;
  @override
  @JsonKey(ignore: true)
  _$$_DisposeFunctionConfigCopyWith<_$_DisposeFunctionConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
