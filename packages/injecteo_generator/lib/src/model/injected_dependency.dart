import 'package:freezed_annotation/freezed_annotation.dart';

import 'importable_type.dart';

part 'injected_dependency.freezed.dart';
part 'injected_dependency.g.dart';

@freezed
class InjectedDependency with _$InjectedDependency {
  const factory InjectedDependency({
    required ImportableType type,
    required String paramName,
    String? instanceName,
    @Default(true) bool isPositional,
  }) = _InjectedDependency;

  const InjectedDependency._();

  factory InjectedDependency.fromJson(Map<String, Object?> json) =>
      _$InjectedDependencyFromJson(json);
}
