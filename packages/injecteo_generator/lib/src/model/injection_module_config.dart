import 'package:freezed_annotation/freezed_annotation.dart';

import 'importable_type.dart';

part 'injection_module_config.freezed.dart';
part 'injection_module_config.g.dart';

@freezed
class InjectionModuleConfig with _$InjectionModuleConfig {
  const factory InjectionModuleConfig({
    required ImportableType type,
    required String moduleName,
  }) = _InjectionModuleConfig;

  factory InjectionModuleConfig.fromJson(Map<String, Object?> json) =>
      _$InjectionModuleConfigFromJson(json);
}
