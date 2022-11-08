import 'package:freezed_annotation/freezed_annotation.dart';

import 'importable_type.dart';

part 'dispose_function_config.freezed.dart';
part 'dispose_function_config.g.dart';

@freezed
class DisposeFunctionConfig with _$DisposeFunctionConfig {
  const factory DisposeFunctionConfig({
    required String name,
    @Default(false) bool isInstance,
    ImportableType? importableType,
  }) = _DisposeFunctionConfig;

  factory DisposeFunctionConfig.fromJson(Map<String, Object?> json) =>
      _$DisposeFunctionConfigFromJson(json);
}
