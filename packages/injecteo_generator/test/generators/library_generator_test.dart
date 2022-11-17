import 'package:injecteo_models/injecteo_models.dart';
import 'package:test/test.dart';

import '../utils/file_utils.dart';
import '../utils/library_generator_utils.dart';

void main() {
  void expectChecksumEquals(String first, String second) {
    expect(generateMd5(first), generateMd5(second));
  }

  group(
    'Generate injecteo library',
    () {
      test(
        'Initializer without dependencies',
        () {
          final code = TestUtils().runLibraryGenerator(
            [],
          );
          expectChecksumEquals(
            code,
            readFile(
              ['test', 'inputs', 'config', 'config_without_dependencies.txt'],
            ),
          );
        },
      );

      test(
        'Initializer with single dependency',
        () {
          final code = TestUtils().runLibraryGenerator(
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
              ['test', 'inputs', 'config', 'config_with_dependency.txt'],
            ),
          );
        },
      );
    },
  );
}
