// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DependencyConfig _$DependencyConfigFromJson(Map<String, dynamic> json) {
  return _DependencyConfig.fromJson(json);
}

/// @nodoc
mixin _$DependencyConfig {
  ImportableType get type => throw _privateConstructorUsedError;
  ImportableType get typeImplementation => throw _privateConstructorUsedError;
  DependencyType get dependencyType => throw _privateConstructorUsedError;
  List<InjectedDependency> get dependencies =>
      throw _privateConstructorUsedError;
  List<String> get environments => throw _privateConstructorUsedError;
  List<ImportableType> get dependsOn => throw _privateConstructorUsedError;
  String? get instanceName => throw _privateConstructorUsedError;
  bool? get signalsReady => throw _privateConstructorUsedError;
  String? get constructorName => throw _privateConstructorUsedError;
  bool get isAsync => throw _privateConstructorUsedError;
  bool get preResolve => throw _privateConstructorUsedError;
  ModuleConfig? get moduleConfig => throw _privateConstructorUsedError;
  DisposeFunctionConfig? get disposeFunctionConfig =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DependencyConfigCopyWith<DependencyConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DependencyConfigCopyWith<$Res> {
  factory $DependencyConfigCopyWith(
          DependencyConfig value, $Res Function(DependencyConfig) then) =
      _$DependencyConfigCopyWithImpl<$Res, DependencyConfig>;
  @useResult
  $Res call(
      {ImportableType type,
      ImportableType typeImplementation,
      DependencyType dependencyType,
      List<InjectedDependency> dependencies,
      List<String> environments,
      List<ImportableType> dependsOn,
      String? instanceName,
      bool? signalsReady,
      String? constructorName,
      bool isAsync,
      bool preResolve,
      ModuleConfig? moduleConfig,
      DisposeFunctionConfig? disposeFunctionConfig});

  $ImportableTypeCopyWith<$Res> get type;
  $ImportableTypeCopyWith<$Res> get typeImplementation;
  $ModuleConfigCopyWith<$Res>? get moduleConfig;
  $DisposeFunctionConfigCopyWith<$Res>? get disposeFunctionConfig;
}

/// @nodoc
class _$DependencyConfigCopyWithImpl<$Res, $Val extends DependencyConfig>
    implements $DependencyConfigCopyWith<$Res> {
  _$DependencyConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? typeImplementation = null,
    Object? dependencyType = null,
    Object? dependencies = null,
    Object? environments = null,
    Object? dependsOn = null,
    Object? instanceName = freezed,
    Object? signalsReady = freezed,
    Object? constructorName = freezed,
    Object? isAsync = null,
    Object? preResolve = null,
    Object? moduleConfig = freezed,
    Object? disposeFunctionConfig = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ImportableType,
      typeImplementation: null == typeImplementation
          ? _value.typeImplementation
          : typeImplementation // ignore: cast_nullable_to_non_nullable
              as ImportableType,
      dependencyType: null == dependencyType
          ? _value.dependencyType
          : dependencyType // ignore: cast_nullable_to_non_nullable
              as DependencyType,
      dependencies: null == dependencies
          ? _value.dependencies
          : dependencies // ignore: cast_nullable_to_non_nullable
              as List<InjectedDependency>,
      environments: null == environments
          ? _value.environments
          : environments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dependsOn: null == dependsOn
          ? _value.dependsOn
          : dependsOn // ignore: cast_nullable_to_non_nullable
              as List<ImportableType>,
      instanceName: freezed == instanceName
          ? _value.instanceName
          : instanceName // ignore: cast_nullable_to_non_nullable
              as String?,
      signalsReady: freezed == signalsReady
          ? _value.signalsReady
          : signalsReady // ignore: cast_nullable_to_non_nullable
              as bool?,
      constructorName: freezed == constructorName
          ? _value.constructorName
          : constructorName // ignore: cast_nullable_to_non_nullable
              as String?,
      isAsync: null == isAsync
          ? _value.isAsync
          : isAsync // ignore: cast_nullable_to_non_nullable
              as bool,
      preResolve: null == preResolve
          ? _value.preResolve
          : preResolve // ignore: cast_nullable_to_non_nullable
              as bool,
      moduleConfig: freezed == moduleConfig
          ? _value.moduleConfig
          : moduleConfig // ignore: cast_nullable_to_non_nullable
              as ModuleConfig?,
      disposeFunctionConfig: freezed == disposeFunctionConfig
          ? _value.disposeFunctionConfig
          : disposeFunctionConfig // ignore: cast_nullable_to_non_nullable
              as DisposeFunctionConfig?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImportableTypeCopyWith<$Res> get type {
    return $ImportableTypeCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ImportableTypeCopyWith<$Res> get typeImplementation {
    return $ImportableTypeCopyWith<$Res>(_value.typeImplementation, (value) {
      return _then(_value.copyWith(typeImplementation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ModuleConfigCopyWith<$Res>? get moduleConfig {
    if (_value.moduleConfig == null) {
      return null;
    }

    return $ModuleConfigCopyWith<$Res>(_value.moduleConfig!, (value) {
      return _then(_value.copyWith(moduleConfig: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DisposeFunctionConfigCopyWith<$Res>? get disposeFunctionConfig {
    if (_value.disposeFunctionConfig == null) {
      return null;
    }

    return $DisposeFunctionConfigCopyWith<$Res>(_value.disposeFunctionConfig!,
        (value) {
      return _then(_value.copyWith(disposeFunctionConfig: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DependencyConfigCopyWith<$Res>
    implements $DependencyConfigCopyWith<$Res> {
  factory _$$_DependencyConfigCopyWith(
          _$_DependencyConfig value, $Res Function(_$_DependencyConfig) then) =
      __$$_DependencyConfigCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ImportableType type,
      ImportableType typeImplementation,
      DependencyType dependencyType,
      List<InjectedDependency> dependencies,
      List<String> environments,
      List<ImportableType> dependsOn,
      String? instanceName,
      bool? signalsReady,
      String? constructorName,
      bool isAsync,
      bool preResolve,
      ModuleConfig? moduleConfig,
      DisposeFunctionConfig? disposeFunctionConfig});

  @override
  $ImportableTypeCopyWith<$Res> get type;
  @override
  $ImportableTypeCopyWith<$Res> get typeImplementation;
  @override
  $ModuleConfigCopyWith<$Res>? get moduleConfig;
  @override
  $DisposeFunctionConfigCopyWith<$Res>? get disposeFunctionConfig;
}

/// @nodoc
class __$$_DependencyConfigCopyWithImpl<$Res>
    extends _$DependencyConfigCopyWithImpl<$Res, _$_DependencyConfig>
    implements _$$_DependencyConfigCopyWith<$Res> {
  __$$_DependencyConfigCopyWithImpl(
      _$_DependencyConfig _value, $Res Function(_$_DependencyConfig) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? typeImplementation = null,
    Object? dependencyType = null,
    Object? dependencies = null,
    Object? environments = null,
    Object? dependsOn = null,
    Object? instanceName = freezed,
    Object? signalsReady = freezed,
    Object? constructorName = freezed,
    Object? isAsync = null,
    Object? preResolve = null,
    Object? moduleConfig = freezed,
    Object? disposeFunctionConfig = freezed,
  }) {
    return _then(_$_DependencyConfig(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ImportableType,
      typeImplementation: null == typeImplementation
          ? _value.typeImplementation
          : typeImplementation // ignore: cast_nullable_to_non_nullable
              as ImportableType,
      dependencyType: null == dependencyType
          ? _value.dependencyType
          : dependencyType // ignore: cast_nullable_to_non_nullable
              as DependencyType,
      dependencies: null == dependencies
          ? _value._dependencies
          : dependencies // ignore: cast_nullable_to_non_nullable
              as List<InjectedDependency>,
      environments: null == environments
          ? _value._environments
          : environments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dependsOn: null == dependsOn
          ? _value._dependsOn
          : dependsOn // ignore: cast_nullable_to_non_nullable
              as List<ImportableType>,
      instanceName: freezed == instanceName
          ? _value.instanceName
          : instanceName // ignore: cast_nullable_to_non_nullable
              as String?,
      signalsReady: freezed == signalsReady
          ? _value.signalsReady
          : signalsReady // ignore: cast_nullable_to_non_nullable
              as bool?,
      constructorName: freezed == constructorName
          ? _value.constructorName
          : constructorName // ignore: cast_nullable_to_non_nullable
              as String?,
      isAsync: null == isAsync
          ? _value.isAsync
          : isAsync // ignore: cast_nullable_to_non_nullable
              as bool,
      preResolve: null == preResolve
          ? _value.preResolve
          : preResolve // ignore: cast_nullable_to_non_nullable
              as bool,
      moduleConfig: freezed == moduleConfig
          ? _value.moduleConfig
          : moduleConfig // ignore: cast_nullable_to_non_nullable
              as ModuleConfig?,
      disposeFunctionConfig: freezed == disposeFunctionConfig
          ? _value.disposeFunctionConfig
          : disposeFunctionConfig // ignore: cast_nullable_to_non_nullable
              as DisposeFunctionConfig?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DependencyConfig extends _DependencyConfig {
  const _$_DependencyConfig(
      {required this.type,
      required this.typeImplementation,
      this.dependencyType = DependencyType.factory,
      final List<InjectedDependency> dependencies = const [],
      final List<String> environments = const [],
      final List<ImportableType> dependsOn = const [],
      this.instanceName,
      this.signalsReady,
      this.constructorName,
      this.isAsync = false,
      this.preResolve = false,
      this.moduleConfig,
      this.disposeFunctionConfig})
      : _dependencies = dependencies,
        _environments = environments,
        _dependsOn = dependsOn,
        super._();

  factory _$_DependencyConfig.fromJson(Map<String, dynamic> json) =>
      _$$_DependencyConfigFromJson(json);

  @override
  final ImportableType type;
  @override
  final ImportableType typeImplementation;
  @override
  @JsonKey()
  final DependencyType dependencyType;
  final List<InjectedDependency> _dependencies;
  @override
  @JsonKey()
  List<InjectedDependency> get dependencies {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dependencies);
  }

  final List<String> _environments;
  @override
  @JsonKey()
  List<String> get environments {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_environments);
  }

  final List<ImportableType> _dependsOn;
  @override
  @JsonKey()
  List<ImportableType> get dependsOn {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dependsOn);
  }

  @override
  final String? instanceName;
  @override
  final bool? signalsReady;
  @override
  final String? constructorName;
  @override
  @JsonKey()
  final bool isAsync;
  @override
  @JsonKey()
  final bool preResolve;
  @override
  final ModuleConfig? moduleConfig;
  @override
  final DisposeFunctionConfig? disposeFunctionConfig;

  @override
  String toString() {
    return 'DependencyConfig(type: $type, typeImplementation: $typeImplementation, dependencyType: $dependencyType, dependencies: $dependencies, environments: $environments, dependsOn: $dependsOn, instanceName: $instanceName, signalsReady: $signalsReady, constructorName: $constructorName, isAsync: $isAsync, preResolve: $preResolve, moduleConfig: $moduleConfig, disposeFunctionConfig: $disposeFunctionConfig)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DependencyConfig &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.typeImplementation, typeImplementation) ||
                other.typeImplementation == typeImplementation) &&
            (identical(other.dependencyType, dependencyType) ||
                other.dependencyType == dependencyType) &&
            const DeepCollectionEquality()
                .equals(other._dependencies, _dependencies) &&
            const DeepCollectionEquality()
                .equals(other._environments, _environments) &&
            const DeepCollectionEquality()
                .equals(other._dependsOn, _dependsOn) &&
            (identical(other.instanceName, instanceName) ||
                other.instanceName == instanceName) &&
            (identical(other.signalsReady, signalsReady) ||
                other.signalsReady == signalsReady) &&
            (identical(other.constructorName, constructorName) ||
                other.constructorName == constructorName) &&
            (identical(other.isAsync, isAsync) || other.isAsync == isAsync) &&
            (identical(other.preResolve, preResolve) ||
                other.preResolve == preResolve) &&
            (identical(other.moduleConfig, moduleConfig) ||
                other.moduleConfig == moduleConfig) &&
            (identical(other.disposeFunctionConfig, disposeFunctionConfig) ||
                other.disposeFunctionConfig == disposeFunctionConfig));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      typeImplementation,
      dependencyType,
      const DeepCollectionEquality().hash(_dependencies),
      const DeepCollectionEquality().hash(_environments),
      const DeepCollectionEquality().hash(_dependsOn),
      instanceName,
      signalsReady,
      constructorName,
      isAsync,
      preResolve,
      moduleConfig,
      disposeFunctionConfig);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DependencyConfigCopyWith<_$_DependencyConfig> get copyWith =>
      __$$_DependencyConfigCopyWithImpl<_$_DependencyConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DependencyConfigToJson(
      this,
    );
  }
}

abstract class _DependencyConfig extends DependencyConfig {
  const factory _DependencyConfig(
          {required final ImportableType type,
          required final ImportableType typeImplementation,
          final DependencyType dependencyType,
          final List<InjectedDependency> dependencies,
          final List<String> environments,
          final List<ImportableType> dependsOn,
          final String? instanceName,
          final bool? signalsReady,
          final String? constructorName,
          final bool isAsync,
          final bool preResolve,
          final ModuleConfig? moduleConfig,
          final DisposeFunctionConfig? disposeFunctionConfig}) =
      _$_DependencyConfig;
  const _DependencyConfig._() : super._();

  factory _DependencyConfig.fromJson(Map<String, dynamic> json) =
      _$_DependencyConfig.fromJson;

  @override
  ImportableType get type;
  @override
  ImportableType get typeImplementation;
  @override
  DependencyType get dependencyType;
  @override
  List<InjectedDependency> get dependencies;
  @override
  List<String> get environments;
  @override
  List<ImportableType> get dependsOn;
  @override
  String? get instanceName;
  @override
  bool? get signalsReady;
  @override
  String? get constructorName;
  @override
  bool get isAsync;
  @override
  bool get preResolve;
  @override
  ModuleConfig? get moduleConfig;
  @override
  DisposeFunctionConfig? get disposeFunctionConfig;
  @override
  @JsonKey(ignore: true)
  _$$_DependencyConfigCopyWith<_$_DependencyConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

ImportableType _$ImportableTypeFromJson(Map<String, dynamic> json) {
  return _ImportableType.fromJson(json);
}

/// @nodoc
mixin _$ImportableType {
  String get name => throw _privateConstructorUsedError;
  String? get import => throw _privateConstructorUsedError;
  bool get isNullable => throw _privateConstructorUsedError;
  List<ImportableType> get typeArguments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImportableTypeCopyWith<ImportableType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImportableTypeCopyWith<$Res> {
  factory $ImportableTypeCopyWith(
          ImportableType value, $Res Function(ImportableType) then) =
      _$ImportableTypeCopyWithImpl<$Res, ImportableType>;
  @useResult
  $Res call(
      {String name,
      String? import,
      bool isNullable,
      List<ImportableType> typeArguments});
}

/// @nodoc
class _$ImportableTypeCopyWithImpl<$Res, $Val extends ImportableType>
    implements $ImportableTypeCopyWith<$Res> {
  _$ImportableTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? import = freezed,
    Object? isNullable = null,
    Object? typeArguments = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      import: freezed == import
          ? _value.import
          : import // ignore: cast_nullable_to_non_nullable
              as String?,
      isNullable: null == isNullable
          ? _value.isNullable
          : isNullable // ignore: cast_nullable_to_non_nullable
              as bool,
      typeArguments: null == typeArguments
          ? _value.typeArguments
          : typeArguments // ignore: cast_nullable_to_non_nullable
              as List<ImportableType>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ImportableTypeCopyWith<$Res>
    implements $ImportableTypeCopyWith<$Res> {
  factory _$$_ImportableTypeCopyWith(
          _$_ImportableType value, $Res Function(_$_ImportableType) then) =
      __$$_ImportableTypeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String? import,
      bool isNullable,
      List<ImportableType> typeArguments});
}

/// @nodoc
class __$$_ImportableTypeCopyWithImpl<$Res>
    extends _$ImportableTypeCopyWithImpl<$Res, _$_ImportableType>
    implements _$$_ImportableTypeCopyWith<$Res> {
  __$$_ImportableTypeCopyWithImpl(
      _$_ImportableType _value, $Res Function(_$_ImportableType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? import = freezed,
    Object? isNullable = null,
    Object? typeArguments = null,
  }) {
    return _then(_$_ImportableType(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      import: freezed == import
          ? _value.import
          : import // ignore: cast_nullable_to_non_nullable
              as String?,
      isNullable: null == isNullable
          ? _value.isNullable
          : isNullable // ignore: cast_nullable_to_non_nullable
              as bool,
      typeArguments: null == typeArguments
          ? _value._typeArguments
          : typeArguments // ignore: cast_nullable_to_non_nullable
              as List<ImportableType>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImportableType extends _ImportableType {
  const _$_ImportableType(
      {required this.name,
      this.import,
      this.isNullable = false,
      final List<ImportableType> typeArguments = const []})
      : _typeArguments = typeArguments,
        super._();

  factory _$_ImportableType.fromJson(Map<String, dynamic> json) =>
      _$$_ImportableTypeFromJson(json);

  @override
  final String name;
  @override
  final String? import;
  @override
  @JsonKey()
  final bool isNullable;
  final List<ImportableType> _typeArguments;
  @override
  @JsonKey()
  List<ImportableType> get typeArguments {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_typeArguments);
  }

  @override
  String toString() {
    return 'ImportableType(name: $name, import: $import, isNullable: $isNullable, typeArguments: $typeArguments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImportableType &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.import, import) || other.import == import) &&
            (identical(other.isNullable, isNullable) ||
                other.isNullable == isNullable) &&
            const DeepCollectionEquality()
                .equals(other._typeArguments, _typeArguments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, import, isNullable,
      const DeepCollectionEquality().hash(_typeArguments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImportableTypeCopyWith<_$_ImportableType> get copyWith =>
      __$$_ImportableTypeCopyWithImpl<_$_ImportableType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImportableTypeToJson(
      this,
    );
  }
}

abstract class _ImportableType extends ImportableType {
  const factory _ImportableType(
      {required final String name,
      final String? import,
      final bool isNullable,
      final List<ImportableType> typeArguments}) = _$_ImportableType;
  const _ImportableType._() : super._();

  factory _ImportableType.fromJson(Map<String, dynamic> json) =
      _$_ImportableType.fromJson;

  @override
  String get name;
  @override
  String? get import;
  @override
  bool get isNullable;
  @override
  List<ImportableType> get typeArguments;
  @override
  @JsonKey(ignore: true)
  _$$_ImportableTypeCopyWith<_$_ImportableType> get copyWith =>
      throw _privateConstructorUsedError;
}

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

InjectedDependency _$InjectedDependencyFromJson(Map<String, dynamic> json) {
  return _InjectedDependency.fromJson(json);
}

/// @nodoc
mixin _$InjectedDependency {
  ImportableType get type => throw _privateConstructorUsedError;
  String get paramName => throw _privateConstructorUsedError;
  String? get instanceName => throw _privateConstructorUsedError;
  bool get isFactoryParam => throw _privateConstructorUsedError;
  bool get isPositional => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InjectedDependencyCopyWith<InjectedDependency> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InjectedDependencyCopyWith<$Res> {
  factory $InjectedDependencyCopyWith(
          InjectedDependency value, $Res Function(InjectedDependency) then) =
      _$InjectedDependencyCopyWithImpl<$Res, InjectedDependency>;
  @useResult
  $Res call(
      {ImportableType type,
      String paramName,
      String? instanceName,
      bool isFactoryParam,
      bool isPositional});

  $ImportableTypeCopyWith<$Res> get type;
}

/// @nodoc
class _$InjectedDependencyCopyWithImpl<$Res, $Val extends InjectedDependency>
    implements $InjectedDependencyCopyWith<$Res> {
  _$InjectedDependencyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? paramName = null,
    Object? instanceName = freezed,
    Object? isFactoryParam = null,
    Object? isPositional = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ImportableType,
      paramName: null == paramName
          ? _value.paramName
          : paramName // ignore: cast_nullable_to_non_nullable
              as String,
      instanceName: freezed == instanceName
          ? _value.instanceName
          : instanceName // ignore: cast_nullable_to_non_nullable
              as String?,
      isFactoryParam: null == isFactoryParam
          ? _value.isFactoryParam
          : isFactoryParam // ignore: cast_nullable_to_non_nullable
              as bool,
      isPositional: null == isPositional
          ? _value.isPositional
          : isPositional // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$_InjectedDependencyCopyWith<$Res>
    implements $InjectedDependencyCopyWith<$Res> {
  factory _$$_InjectedDependencyCopyWith(_$_InjectedDependency value,
          $Res Function(_$_InjectedDependency) then) =
      __$$_InjectedDependencyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ImportableType type,
      String paramName,
      String? instanceName,
      bool isFactoryParam,
      bool isPositional});

  @override
  $ImportableTypeCopyWith<$Res> get type;
}

/// @nodoc
class __$$_InjectedDependencyCopyWithImpl<$Res>
    extends _$InjectedDependencyCopyWithImpl<$Res, _$_InjectedDependency>
    implements _$$_InjectedDependencyCopyWith<$Res> {
  __$$_InjectedDependencyCopyWithImpl(
      _$_InjectedDependency _value, $Res Function(_$_InjectedDependency) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? paramName = null,
    Object? instanceName = freezed,
    Object? isFactoryParam = null,
    Object? isPositional = null,
  }) {
    return _then(_$_InjectedDependency(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ImportableType,
      paramName: null == paramName
          ? _value.paramName
          : paramName // ignore: cast_nullable_to_non_nullable
              as String,
      instanceName: freezed == instanceName
          ? _value.instanceName
          : instanceName // ignore: cast_nullable_to_non_nullable
              as String?,
      isFactoryParam: null == isFactoryParam
          ? _value.isFactoryParam
          : isFactoryParam // ignore: cast_nullable_to_non_nullable
              as bool,
      isPositional: null == isPositional
          ? _value.isPositional
          : isPositional // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InjectedDependency extends _InjectedDependency {
  const _$_InjectedDependency(
      {required this.type,
      required this.paramName,
      this.instanceName,
      this.isFactoryParam = false,
      this.isPositional = true})
      : super._();

  factory _$_InjectedDependency.fromJson(Map<String, dynamic> json) =>
      _$$_InjectedDependencyFromJson(json);

  @override
  final ImportableType type;
  @override
  final String paramName;
  @override
  final String? instanceName;
  @override
  @JsonKey()
  final bool isFactoryParam;
  @override
  @JsonKey()
  final bool isPositional;

  @override
  String toString() {
    return 'InjectedDependency(type: $type, paramName: $paramName, instanceName: $instanceName, isFactoryParam: $isFactoryParam, isPositional: $isPositional)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InjectedDependency &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.paramName, paramName) ||
                other.paramName == paramName) &&
            (identical(other.instanceName, instanceName) ||
                other.instanceName == instanceName) &&
            (identical(other.isFactoryParam, isFactoryParam) ||
                other.isFactoryParam == isFactoryParam) &&
            (identical(other.isPositional, isPositional) ||
                other.isPositional == isPositional));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, paramName, instanceName, isFactoryParam, isPositional);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InjectedDependencyCopyWith<_$_InjectedDependency> get copyWith =>
      __$$_InjectedDependencyCopyWithImpl<_$_InjectedDependency>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InjectedDependencyToJson(
      this,
    );
  }
}

abstract class _InjectedDependency extends InjectedDependency {
  const factory _InjectedDependency(
      {required final ImportableType type,
      required final String paramName,
      final String? instanceName,
      final bool isFactoryParam,
      final bool isPositional}) = _$_InjectedDependency;
  const _InjectedDependency._() : super._();

  factory _InjectedDependency.fromJson(Map<String, dynamic> json) =
      _$_InjectedDependency.fromJson;

  @override
  ImportableType get type;
  @override
  String get paramName;
  @override
  String? get instanceName;
  @override
  bool get isFactoryParam;
  @override
  bool get isPositional;
  @override
  @JsonKey(ignore: true)
  _$$_InjectedDependencyCopyWith<_$_InjectedDependency> get copyWith =>
      throw _privateConstructorUsedError;
}

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
