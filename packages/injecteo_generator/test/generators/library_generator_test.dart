import 'package:injecteo_models/injecteo_models.dart';
import 'package:test/test.dart';

import '../utils/expect_checksum_equals.dart';
import '../utils/file_utils.dart';
import '../utils/library_generator_utils.dart';

part '../utils/external_module_variables.dart';

void main() {
  group(
    'Generate injecteo library',
    () {
      test(
        'Initializer without dependencies',
        () {
          final code = runLibraryGenerator(
            [],
          );
          expectChecksumEquals(
            code,
            readFile(
              ['test', 'outputs', 'config', 'config_without_dependencies.txt'],
            ),
          );
        },
      );

      test(
        'Initializer with single dependency',
        () {
          final code = runLibraryGenerator(
            [
              const DependencyConfig(
                dependencyType: DependencyType.singleton,
                type: ImportableType(
                  name: 'DemoSingleton',
                ),
                typeImplementation: ImportableType(
                  name: 'DemoSingleton',
                ),
                injectionModuleConfig: InjectionModuleConfig(
                  moduleName: 'DemoInjectionModule',
                ),
              )
            ],
          );
          expectChecksumEquals(
            code,
            readFile(
              ['test', 'outputs', 'config', 'config_with_dependency.txt'],
            ),
          );
        },
      );
    },
  );

  group(
    'Generate external modules',
    () {
      test(
        'Should generate demo external module',
        () {
          final allDependencies = [
            _baseDependency,
            _singletonDependency,
            _factoryDependency
          ];

          final result = runBuildExternalModuleClass(
            allDependencies.first,
            dependencies: allDependencies,
          );
          final expected = readFile(
            [
              'test',
              'outputs',
              'config',
              'demo_external_module.txt',
            ],
          );

          expectChecksumEquals(result, expected);
        },
      );

      test(
        'Should generate empty demo external module without deps',
        () {
          final externalModuleConfig = _externalModuleConfig.copyWith(
            isModuleMethod: true,
            isAbstract: false,
          );
          final singletonDependency = _singletonDependency.copyWith(
            externalModuleConfig: externalModuleConfig,
          );

          final result = runBuildExternalModuleClass(
            singletonDependency,
            dependencies: [],
          );

          expectChecksumEquals(result, _expectedEmptyDemoExternalModule);
        },
      );

      test(
        'Should generate empty demo external module with only non-abstract deps',
        () {
          final externalModuleConfig = _externalModuleConfig.copyWith(
            isAbstract: false,
          );
          final baseDependency = _baseDependency.copyWith(
            externalModuleConfig: externalModuleConfig,
          );
          final factoryDependency = _factoryDependency.copyWith(
            externalModuleConfig: externalModuleConfig,
          );
          final dependencies = [
            baseDependency,
            factoryDependency,
          ];

          final result = runBuildExternalModuleClass(
            _singletonDependency,
            dependencies: dependencies,
          );

          expectChecksumEquals(result, _expectedEmptyDemoExternalModule);
        },
      );
    },
  );
}
