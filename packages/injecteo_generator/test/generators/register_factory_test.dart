import 'package:injecteo_models/injecteo_models.dart';
import 'package:test/test.dart';

import '../utils/library_generator_utils.dart';

void main() {
  const injectionModuleConfig = InjectionModuleConfig(
    moduleName: 'DemoInjectionModule',
  );

  group(
    'Register Factory',
    () {
      test(
        'Simple Factory',
        () {
          expect(
            runBuildRegisterFunction(
              const DependencyConfig(
                dependencyType: DependencyType.factory,
                type: ImportableType(name: 'Demo'),
                typeImplementation: ImportableType(name: 'Demo'),
                injectionModuleConfig: injectionModuleConfig,
              ),
            ),
            'serviceLocatorHelper.registerFactory<Demo>(() => Demo());',
          );
        },
      );

      test(
        'Abstract factory with different implementation',
        () {
          expect(
            runBuildRegisterFunction(
              const DependencyConfig(
                dependencyType: DependencyType.factory,
                type: ImportableType(name: 'AbstractType'),
                typeImplementation: ImportableType(name: 'Demo'),
                injectionModuleConfig: injectionModuleConfig,
              ),
            ),
            'serviceLocatorHelper.registerFactory<AbstractType>(() => Demo());',
          );
        },
      );

      test(
        'Register Factory for environment',
        () {
          expect(
            runBuildRegisterFunction(
              const DependencyConfig(
                dependencyType: DependencyType.factory,
                type: ImportableType(name: 'Demo'),
                typeImplementation: ImportableType(name: 'Demo'),
                injectionModuleConfig: injectionModuleConfig,
                environments: ['dev'],
              ),
            ),
            'serviceLocatorHelper.registerFactory<Demo>(() => Demo(), registerFor: {_dev}, );',
          );
        },
      );

      test(
        'Factory async',
        () {
          expect(
            runBuildRegisterFunction(
              const DependencyConfig(
                dependencyType: DependencyType.factory,
                type: ImportableType(name: 'Demo'),
                typeImplementation: ImportableType(name: 'Demo'),
                isAsync: true,
                injectionModuleConfig: injectionModuleConfig,
              ),
            ),
            'serviceLocatorHelper.registerFactoryAsync<Demo>(() async  => Demo());',
          );
        },
      );

      test(
        'Factory with positional dependencies',
        () {
          expect(
            runBuildRegisterFunction(
              const DependencyConfig(
                dependencyType: DependencyType.factory,
                type: ImportableType(name: 'Demo'),
                typeImplementation: ImportableType(name: 'Demo'),
                injectionModuleConfig: injectionModuleConfig,
                dependencies: [
                  InjectedDependency(
                    type: ImportableType(name: 'Storage'),
                    paramName: 'storage',
                    isPositional: true,
                  )
                ],
              ),
            ),
            'serviceLocatorHelper.registerFactory<Demo>(() => Demo(serviceLocator.get<Storage>()));',
          );
        },
      );

      test(
        'Factory with async positional dependencies',
        () {
          const dep = DependencyConfig(
            dependencyType: DependencyType.factory,
            type: ImportableType(name: 'Demo'),
            typeImplementation: ImportableType(name: 'Demo'),
            injectionModuleConfig: injectionModuleConfig,
            dependencies: [
              InjectedDependency(
                type: ImportableType(name: 'Storage'),
                paramName: 'storage',
                isPositional: true,
              )
            ],
          );

          final allDeps = [
            dep,
            const DependencyConfig(
              dependencyType: DependencyType.factory,
              type: ImportableType(name: 'Storage'),
              typeImplementation: ImportableType(name: 'Storage'),
              injectionModuleConfig: injectionModuleConfig,
              isAsync: true,
            )
          ];

          expect(
            runBuildRegisterFunction(
              dep,
              dependencies: allDeps,
            ),
            'serviceLocatorHelper.registerFactoryAsync<Demo>(() async  => Demo( await serviceLocator.getAsync<Storage>()));',
          );
        },
      );

      test(
        'Factory with named dependencies',
        () {
          expect(
            runBuildRegisterFunction(
              const DependencyConfig(
                type: ImportableType(name: 'Demo'),
                typeImplementation: ImportableType(name: 'Demo'),
                dependencyType: DependencyType.factory,
                injectionModuleConfig: injectionModuleConfig,
                dependencies: [
                  InjectedDependency(
                    type: ImportableType(name: 'Storage'),
                    paramName: 'storage',
                    isPositional: false,
                    instanceName: 'storageImpl',
                  )
                ],
              ),
            ),
            "serviceLocatorHelper.registerFactory<Demo>(() => Demo(storage: serviceLocator.get<Storage>(instanceName: 'storageImpl')));",
          );
        },
      );

      test(
        'Factory with async named dependencies',
        () {
          const dep = DependencyConfig(
            type: ImportableType(name: 'Demo'),
            typeImplementation: ImportableType(name: 'Demo'),
            dependencyType: DependencyType.factory,
            injectionModuleConfig: injectionModuleConfig,
            dependencies: [
              InjectedDependency(
                type: ImportableType(name: 'Storage'),
                paramName: 'storage',
                isPositional: false,
                instanceName: 'storageImpl',
              )
            ],
          );

          final allDeps = [
            dep,
            const DependencyConfig(
              dependencyType: DependencyType.factory,
              type: ImportableType(name: 'Storage'),
              typeImplementation: ImportableType(name: 'Storage'),
              injectionModuleConfig: injectionModuleConfig,
              instanceName: 'storageImpl',
              isAsync: true,
            ),
          ];
          expect(
            runBuildRegisterFunction(
              dep,
              dependencies: allDeps,
            ),
            "serviceLocatorHelper.registerFactoryAsync<Demo>(() async  => Demo(storage:  await serviceLocator.getAsync<Storage>(instanceName: 'storageImpl')));",
          );
        },
      );

      test(
        'Factory with parametrized type',
        () {
          expect(
            runBuildRegisterFunction(
              const DependencyConfig(
                dependencyType: DependencyType.factory,
                type: ImportableType(
                  name: 'Demo',
                  typeArguments: [
                    ImportableType(name: 'String'),
                  ],
                ),
                typeImplementation: ImportableType(
                  name: 'Demo',
                  typeArguments: [
                    ImportableType(name: 'String'),
                  ],
                ),
                injectionModuleConfig: injectionModuleConfig,
                dependencies: [
                  InjectedDependency(
                    type: ImportableType(name: 'Storage'),
                    paramName: 'storage',
                    isPositional: false,
                  )
                ],
              ),
            ),
            'serviceLocatorHelper.registerFactory<Demo<String>>(() => Demo<String>(storage: serviceLocator.get<Storage>()));',
          );
        },
      );
    },
  );
}
