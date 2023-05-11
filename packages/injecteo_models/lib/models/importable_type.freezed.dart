// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'importable_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
    if (_typeArguments is EqualUnmodifiableListView) return _typeArguments;
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
