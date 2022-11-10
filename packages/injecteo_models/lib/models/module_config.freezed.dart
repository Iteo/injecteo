// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'module_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ModuleConfig _$ModuleConfigFromJson(Map<String, dynamic> json) {
  return _ModuleConfig.fromJson(json);
}

/// @nodoc
mixin _$ModuleConfig {
  bool get isAbstract => throw _privateConstructorUsedError;
  bool get isMethod => throw _privateConstructorUsedError;
  ImportableType get type => throw _privateConstructorUsedError;
  String get initializerName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModuleConfigCopyWith<ModuleConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModuleConfigCopyWith<$Res> {
  factory $ModuleConfigCopyWith(
          ModuleConfig value, $Res Function(ModuleConfig) then) =
      _$ModuleConfigCopyWithImpl<$Res, ModuleConfig>;
  @useResult
  $Res call(
      {bool isAbstract,
      bool isMethod,
      ImportableType type,
      String initializerName});

  $ImportableTypeCopyWith<$Res> get type;
}

/// @nodoc
class _$ModuleConfigCopyWithImpl<$Res, $Val extends ModuleConfig>
    implements $ModuleConfigCopyWith<$Res> {
  _$ModuleConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAbstract = null,
    Object? isMethod = null,
    Object? type = null,
    Object? initializerName = null,
  }) {
    return _then(_value.copyWith(
      isAbstract: null == isAbstract
          ? _value.isAbstract
          : isAbstract // ignore: cast_nullable_to_non_nullable
              as bool,
      isMethod: null == isMethod
          ? _value.isMethod
          : isMethod // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ImportableType,
      initializerName: null == initializerName
          ? _value.initializerName
          : initializerName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImportableTypeCopyWith<$Res> get type {
    return $ImportableTypeCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ModuleConfigCopyWith<$Res>
    implements $ModuleConfigCopyWith<$Res> {
  factory _$$_ModuleConfigCopyWith(
          _$_ModuleConfig value, $Res Function(_$_ModuleConfig) then) =
      __$$_ModuleConfigCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isAbstract,
      bool isMethod,
      ImportableType type,
      String initializerName});

  @override
  $ImportableTypeCopyWith<$Res> get type;
}

/// @nodoc
class __$$_ModuleConfigCopyWithImpl<$Res>
    extends _$ModuleConfigCopyWithImpl<$Res, _$_ModuleConfig>
    implements _$$_ModuleConfigCopyWith<$Res> {
  __$$_ModuleConfigCopyWithImpl(
      _$_ModuleConfig _value, $Res Function(_$_ModuleConfig) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAbstract = null,
    Object? isMethod = null,
    Object? type = null,
    Object? initializerName = null,
  }) {
    return _then(_$_ModuleConfig(
      isAbstract: null == isAbstract
          ? _value.isAbstract
          : isAbstract // ignore: cast_nullable_to_non_nullable
              as bool,
      isMethod: null == isMethod
          ? _value.isMethod
          : isMethod // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ImportableType,
      initializerName: null == initializerName
          ? _value.initializerName
          : initializerName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ModuleConfig implements _ModuleConfig {
  const _$_ModuleConfig(
      {required this.isAbstract,
      required this.isMethod,
      required this.type,
      required this.initializerName});

  factory _$_ModuleConfig.fromJson(Map<String, dynamic> json) =>
      _$$_ModuleConfigFromJson(json);

  @override
  final bool isAbstract;
  @override
  final bool isMethod;
  @override
  final ImportableType type;
  @override
  final String initializerName;

  @override
  String toString() {
    return 'ModuleConfig(isAbstract: $isAbstract, isMethod: $isMethod, type: $type, initializerName: $initializerName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ModuleConfig &&
            (identical(other.isAbstract, isAbstract) ||
                other.isAbstract == isAbstract) &&
            (identical(other.isMethod, isMethod) ||
                other.isMethod == isMethod) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.initializerName, initializerName) ||
                other.initializerName == initializerName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isAbstract, isMethod, type, initializerName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ModuleConfigCopyWith<_$_ModuleConfig> get copyWith =>
      __$$_ModuleConfigCopyWithImpl<_$_ModuleConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ModuleConfigToJson(
      this,
    );
  }
}

abstract class _ModuleConfig implements ModuleConfig {
  const factory _ModuleConfig(
      {required final bool isAbstract,
      required final bool isMethod,
      required final ImportableType type,
      required final String initializerName}) = _$_ModuleConfig;

  factory _ModuleConfig.fromJson(Map<String, dynamic> json) =
      _$_ModuleConfig.fromJson;

  @override
  bool get isAbstract;
  @override
  bool get isMethod;
  @override
  ImportableType get type;
  @override
  String get initializerName;
  @override
  @JsonKey(ignore: true)
  _$$_ModuleConfigCopyWith<_$_ModuleConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
