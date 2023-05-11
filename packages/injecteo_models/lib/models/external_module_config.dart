import 'importable_type.dart';

class ExternalModuleConfig {
  const ExternalModuleConfig({
    required this.isAbstract,
    required this.isMethod,
    required this.type,
    required this.initializerName,
  });

  factory ExternalModuleConfig.fromJson(Map<String, dynamic> json) {
    return ExternalModuleConfig(
      isAbstract: json['isAbstract'] as bool,
      isMethod: json['isMethod'] as bool,
      type: ImportableType.fromJson(json['type'] as Map<String, dynamic>),
      initializerName: json['initializerName'] as String,
    );
  }

  final bool isAbstract;
  final bool isMethod;
  final ImportableType type;
  final String initializerName;

  ExternalModuleConfig copyWith({
    bool? isAbstract,
    bool? isModuleMethod,
    ImportableType? module,
    String? initializerName,
  }) {
    if ((isAbstract == null || identical(isAbstract, this.isAbstract)) &&
        (isModuleMethod == null || identical(isModuleMethod, isMethod)) &&
        (module == null || identical(module, type)) &&
        (initializerName == null ||
            identical(initializerName, this.initializerName))) {
      return this;
    }

    return ExternalModuleConfig(
      isAbstract: isAbstract ?? this.isAbstract,
      isMethod: isModuleMethod ?? isMethod,
      type: module ?? type,
      initializerName: initializerName ?? this.initializerName,
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'isAbstract': isAbstract,
      'isMethod': isMethod,
      'type': type,
      'initializerName': initializerName,
    } as Map<String, dynamic>;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExternalModuleConfig &&
          runtimeType == other.runtimeType &&
          type == other.type);

  @override
  int get hashCode => type.hashCode;

  @override
  String toString() {
    return 'ModuleConfig{isAbstract: $isAbstract, isModuleMethod: $isMethod, module: $type, initializerName: $initializerName}';
  }
}
