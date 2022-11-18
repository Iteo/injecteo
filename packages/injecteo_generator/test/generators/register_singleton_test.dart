import 'package:injecteo_models/injecteo_models.dart';
import 'package:test/test.dart';

import '../utils/library_generator_utils.dart';

void main() {
  const injectionModuleConfig = InjectionModuleConfig(
    moduleName: 'DemoInjectionModule',
  );

  group(
    'Register Singleton',
    () {
      test(
        "Simple Singleton",
        () {
          expect(
            runBuildRegisterFunction(
              const DependencyConfig(
                dependencyType: DependencyType.singleton,
                type: ImportableType(name: 'Demo'),
                typeImplementation: ImportableType(name: 'Demo'),
                injectionModuleConfig: injectionModuleConfig,
              ),
            ),
            'serviceLocatorHelper.registerSingleton<Demo>(() => Demo());',
          );
        },
      );

      test(
        "Abstract Singleton",
        () {
          expect(
            runBuildRegisterFunction(
              const DependencyConfig(
                dependencyType: DependencyType.singleton,
                type: ImportableType(name: 'AbstractType'),
                typeImplementation: ImportableType(name: 'Demo'),
                injectionModuleConfig: injectionModuleConfig,
              ),
            ),
            'serviceLocatorHelper.registerSingleton<AbstractType>(() => Demo());',
          );
        },
      );

      test(
        "Named Singleton",
        () {
          expect(
            runBuildRegisterFunction(
              const DependencyConfig(
                dependencyType: DependencyType.singleton,
                type: ImportableType(name: 'Demo'),
                typeImplementation: ImportableType(name: 'Demo'),
                instanceName: 'MyDemo',
                injectionModuleConfig: injectionModuleConfig,
              ),
            ),
            "serviceLocatorHelper.registerSingleton<Demo>(() => Demo(), instanceName: 'MyDemo', );",
          );
        },
      );

      test(
        "Async Singleton",
        () {
          expect(
            runBuildRegisterFunction(
              const DependencyConfig(
                dependencyType: DependencyType.singleton,
                type: ImportableType(name: 'Demo'),
                typeImplementation: ImportableType(name: 'Demo'),
                isAsync: true,
                injectionModuleConfig: injectionModuleConfig,
              ),
            ),
            'serviceLocatorHelper.registerSingletonAsync<Demo>(() async  => Demo());',
          );
        },
      );

      test(
        "Singleton with positional dependencies",
        () {
          expect(
            runBuildRegisterFunction(
              const DependencyConfig(
                dependencyType: DependencyType.singleton,
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
            'serviceLocatorHelper.registerSingleton<Demo>(() => Demo(serviceLocator.get<Storage>()));',
          );
        },
      );

      test(
        "Singleton with async positional dependencies",
        () {
          const dep = DependencyConfig(
            dependencyType: DependencyType.singleton,
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
              isAsync: true,
              injectionModuleConfig: injectionModuleConfig,
            ),
          ];
          expect(
            runBuildRegisterFunction(
              dep,
              dependencies: allDeps,
            ),
            'serviceLocatorHelper.registerSingletonAsync<Demo>(() async  => Demo( await serviceLocator.getAsync<Storage>()));',
          );
        },
      );

      test(
        "Singleton with named dependencies",
        () {
          expect(
            runBuildRegisterFunction(
              const DependencyConfig(
                dependencyType: DependencyType.singleton,
                type: ImportableType(name: 'Demo'),
                typeImplementation: ImportableType(name: 'Demo'),
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
            'serviceLocatorHelper.registerSingleton<Demo>(() => Demo(storage: serviceLocator.get<Storage>()));',
          );
        },
      );

      test(
        "Singleton with async named dependencies",
        () {
          const dep = DependencyConfig(
            dependencyType: DependencyType.singleton,
            type: ImportableType(name: 'Demo'),
            typeImplementation: ImportableType(name: 'Demo'),
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
              instanceName: 'storageImpl',
              isAsync: true,
              injectionModuleConfig: injectionModuleConfig,
            ),
          ];
          expect(
            runBuildRegisterFunction(
              dep,
              dependencies: allDeps,
            ),
            "serviceLocatorHelper.registerSingletonAsync<Demo>(() async  => Demo(storage:  await serviceLocator.getAsync<Storage>(instanceName: 'storageImpl')));",
          );
        },
      );

      test(
        "Singleton with async and preResolve named dependencies",
        () {
          const dep = DependencyConfig(
            dependencyType: DependencyType.singleton,
            type: ImportableType(name: 'Demo'),
            typeImplementation: ImportableType(name: 'Demo'),
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
              instanceName: 'storageImpl',
              isAsync: true,
              preResolve: true,
              injectionModuleConfig: injectionModuleConfig,
            ),
          ];
          expect(
            runBuildRegisterFunction(
              dep,
              dependencies: allDeps,
            ),
            "serviceLocatorHelper.registerSingleton<Demo>(() => Demo(storage: serviceLocator.get<Storage>(instanceName: 'storageImpl')));",
          );
        },
      );
    },
  );
}
