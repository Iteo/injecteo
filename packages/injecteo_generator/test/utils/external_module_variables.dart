part of '../generators/library_generator_test.dart';

const _injectionModuleConfig = InjectionModuleConfig(
  moduleName: 'DemoExternalModuleConfig',
);

const _importableType = ImportableType(
  name: 'DemoExternalModule',
);

const _externalModuleConfig = ExternalModuleConfig(
  isAbstract: true,
  isMethod: false,
  initializerName: 'DemoInitializer',
  type: _importableType,
);

const _baseDependency = DependencyConfig(
  type: _importableType,
  typeImplementation: _importableType,
  injectionModuleConfig: _injectionModuleConfig,
  externalModuleConfig: _externalModuleConfig,
);

const _singletonDependency = DependencyConfig(
  isAsync: false,
  dependencyType: DependencyType.singleton,
  type: ImportableType(name: 'Demo'),
  typeImplementation: ImportableType(name: 'Demo'),
  injectionModuleConfig: _injectionModuleConfig,
  externalModuleConfig: _externalModuleConfig,
  dependencies: [
    InjectedDependency(
      type: ImportableType(name: 'Storage'),
      paramName: 'storage',
      isPositional: true,
    )
  ],
);

const _factoryDependency = DependencyConfig(
  isAsync: true,
  dependencyType: DependencyType.factory,
  type: ImportableType(name: 'Storage'),
  typeImplementation: ImportableType(name: 'Storage'),
  injectionModuleConfig: _injectionModuleConfig,
  externalModuleConfig: _externalModuleConfig,
);

const _expectedEmptyDemoExternalModule =
    'class _\$DemoExternalModule extends DemoExternalModule { }\n';
