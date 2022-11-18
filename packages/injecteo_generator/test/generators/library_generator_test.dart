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
}
