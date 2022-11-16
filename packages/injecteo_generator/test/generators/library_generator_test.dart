import 'dart:io' as io;

import 'package:injecteo_models/injecteo_models.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';

import '../utils/checksum.dart';
import '../utils/library_generator_utils.dart';

void main() {
  String readFile(String fileNameAndExtension) {
    final path = p.join('test', 'inputs', fileNameAndExtension);
    final file = io.File(path);
    return file.readAsStringSync();
  }

  void checkGeneratedCode(String code, String fileNameAndExtension) {
    final codeChecksum = generateMd5(code);

    final fileContent = readFile(fileNameAndExtension);
    final fileChecksum = generateMd5(fileContent);
    expect(codeChecksum, fileChecksum);
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
          checkGeneratedCode(code, "config_without_dependencies.txt");
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
          checkGeneratedCode(code, "config_with_dependency.txt");
        },
      );
    },
  );
}
