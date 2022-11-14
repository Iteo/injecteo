// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'dependency_config.dart';

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
  ExternalModuleConfig? get externalModuleConfig =>
      throw _privateConstructorUsedError;
  InjectionModuleConfig? get injectionModuleConfig =>
      throw _privateConstructorUsedError;
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
      ExternalModuleConfig? externalModuleConfig,
      InjectionModuleConfig? injectionModuleConfig,
      DisposeFunctionConfig? disposeFunctionConfig});

  $ImportableTypeCopyWith<$Res> get type;
  $ImportableTypeCopyWith<$Res> get typeImplementation;
  $InjectionModuleConfigCopyWith<$Res>? get injectionModuleConfig;
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
    Object? externalModuleConfig = freezed,
    Object? injectionModuleConfig = freezed,
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
      externalModuleConfig: freezed == externalModuleConfig
          ? _value.externalModuleConfig
          : externalModuleConfig // ignore: cast_nullable_to_non_nullable
              as ExternalModuleConfig?,
      injectionModuleConfig: freezed == injectionModuleConfig
          ? _value.injectionModuleConfig
          : injectionModuleConfig // ignore: cast_nullable_to_non_nullable
              as InjectionModuleConfig?,
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
  $InjectionModuleConfigCopyWith<$Res>? get injectionModuleConfig {
    if (_value.injectionModuleConfig == null) {
      return null;
    }

    return $InjectionModuleConfigCopyWith<$Res>(_value.injectionModuleConfig!,
        (value) {
      return _then(_value.copyWith(injectionModuleConfig: value) as $Val);
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
      ExternalModuleConfig? externalModuleConfig,
      InjectionModuleConfig? injectionModuleConfig,
      DisposeFunctionConfig? disposeFunctionConfig});

  @override
  $ImportableTypeCopyWith<$Res> get type;
  @override
  $ImportableTypeCopyWith<$Res> get typeImplementation;
  @override
  $InjectionModuleConfigCopyWith<$Res>? get injectionModuleConfig;
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
    Object? externalModuleConfig = freezed,
    Object? injectionModuleConfig = freezed,
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
      externalModuleConfig: freezed == externalModuleConfig
          ? _value.externalModuleConfig
          : externalModuleConfig // ignore: cast_nullable_to_non_nullable
              as ExternalModuleConfig?,
      injectionModuleConfig: freezed == injectionModuleConfig
          ? _value.injectionModuleConfig
          : injectionModuleConfig // ignore: cast_nullable_to_non_nullable
              as InjectionModuleConfig?,
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
      this.externalModuleConfig,
      this.injectionModuleConfig,
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
  final ExternalModuleConfig? externalModuleConfig;
  @override
  final InjectionModuleConfig? injectionModuleConfig;
  @override
  final DisposeFunctionConfig? disposeFunctionConfig;

  @override
  String toString() {
    return 'DependencyConfig(type: $type, typeImplementation: $typeImplementation, dependencyType: $dependencyType, dependencies: $dependencies, environments: $environments, dependsOn: $dependsOn, instanceName: $instanceName, signalsReady: $signalsReady, constructorName: $constructorName, isAsync: $isAsync, preResolve: $preResolve, externalModuleConfig: $externalModuleConfig, injectionModuleConfig: $injectionModuleConfig, disposeFunctionConfig: $disposeFunctionConfig)';
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
            (identical(other.externalModuleConfig, externalModuleConfig) ||
                other.externalModuleConfig == externalModuleConfig) &&
            (identical(other.injectionModuleConfig, injectionModuleConfig) ||
                other.injectionModuleConfig == injectionModuleConfig) &&
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
      externalModuleConfig,
      injectionModuleConfig,
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
          final ExternalModuleConfig? externalModuleConfig,
          final InjectionModuleConfig? injectionModuleConfig,
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
  ExternalModuleConfig? get externalModuleConfig;
  @override
  InjectionModuleConfig? get injectionModuleConfig;
  @override
  DisposeFunctionConfig? get disposeFunctionConfig;
  @override
  @JsonKey(ignore: true)
  _$$_DependencyConfigCopyWith<_$_DependencyConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
