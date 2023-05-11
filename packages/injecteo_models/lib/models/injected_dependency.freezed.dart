// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'injected_dependency.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InjectedDependency _$InjectedDependencyFromJson(Map<String, dynamic> json) {
  return _InjectedDependency.fromJson(json);
}

/// @nodoc
mixin _$InjectedDependency {
  ImportableType get type => throw _privateConstructorUsedError;
  String get paramName => throw _privateConstructorUsedError;
  String? get instanceName => throw _privateConstructorUsedError;
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
  final bool isPositional;

  @override
  String toString() {
    return 'InjectedDependency(type: $type, paramName: $paramName, instanceName: $instanceName, isPositional: $isPositional)';
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
            (identical(other.isPositional, isPositional) ||
                other.isPositional == isPositional));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, paramName, instanceName, isPositional);

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
  bool get isPositional;
  @override
  @JsonKey(ignore: true)
  _$$_InjectedDependencyCopyWith<_$_InjectedDependency> get copyWith =>
      throw _privateConstructorUsedError;
}
