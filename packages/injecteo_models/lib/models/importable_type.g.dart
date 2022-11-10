// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'importable_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ImportableType _$$_ImportableTypeFromJson(Map<String, dynamic> json) =>
    _$_ImportableType(
      name: json['name'] as String,
      import: json['import'] as String?,
      isNullable: json['isNullable'] as bool? ?? false,
      typeArguments: (json['typeArguments'] as List<dynamic>?)
              ?.map((e) => ImportableType.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ImportableTypeToJson(_$_ImportableType instance) =>
    <String, dynamic>{
      'name': instance.name,
      'import': instance.import,
      'isNullable': instance.isNullable,
      'typeArguments': instance.typeArguments,
    };
