import 'package:freezed_annotation/freezed_annotation.dart';

part 'importable_type.freezed.dart';
part 'importable_type.g.dart';

@freezed
class ImportableType with _$ImportableType {
  const factory ImportableType({
    required String name,
    String? import,
    @Default(false) bool isNullable,
    @Default([]) List<ImportableType> typeArguments,
  }) = _ImportableType;

  const ImportableType._();

  factory ImportableType.fromJson(Map<String, Object?> json) =>
      _$ImportableTypeFromJson(json);
}
