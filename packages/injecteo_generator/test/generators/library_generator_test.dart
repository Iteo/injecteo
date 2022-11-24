import 'package:injecteo_models/injecteo_models.dart';
import 'package:test/test.dart';

import '../utils/builder_utils.dart';
import '../utils/expect_checksum_equals.dart';
import '../utils/file_utils.dart';
import '../utils/library_generator_utils.dart';

part '../utils/external_module_variables.dart';
part 'external_module_basic_tests_runner.dart';
part 'external_module_from_example_tests_runner.dart';
part 'external_module_io_tests_runner.dart';
part 'injection_module_io_tests_runner.dart';
part 'injection_module_tests_runner.dart';

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

  runExternalModulesBasicTests();
  runExternalModulesTestsFromExample();
  runExternalModulesIoTests();
  runInjectionModulesTests();
  runInjectionModuleIoTests();
}
