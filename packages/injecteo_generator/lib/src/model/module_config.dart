import 'package:freezed_annotation/freezed_annotation.dart';

import 'importable_type.dart';

part 'module_config.freezed.dart';
part 'module_config.g.dart';

@freezed
class ModuleConfig with _$ModuleConfig {
  const factory ModuleConfig({
    required bool isAbstract,
    required bool isMethod,
    required ImportableType type,
    required String initializerName,
  }) = _ModuleConfig;

  factory ModuleConfig.fromJson(Map<String, Object?> json) =>
      _$ModuleConfigFromJson(json);
}
