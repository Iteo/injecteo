import 'package:test/test.dart';

import '../utils/builder_utils.dart';

Future<void> main() async {
  group(
    'Singleton dependency generator',
    () {
      test(
        'Simple singleton test',
        () async {
          await checkDependencyGeneratorBuilder(
            'singleton/simple_singleton',
          );
        },
      );

      test(
        'Singleton with dispose method test',
        () async {
          await checkDependencyGeneratorBuilder(
            'singleton/singleton_with_dispose_method',
          );
        },
      );

      test(
        'Singleton with external dispose method test',
        () async {
          await checkDependencyGeneratorBuilder(
            'singleton/singleton_with_external_dispose_method',
          );
        },
      );

      test(
        'Abstract singleton',
        () async {
          await checkDependencyGeneratorBuilder(
            'singleton/abstract_singleton',
          );
        },
      );

      test(
        'Singleton with environment',
        () async {
          await checkDependencyGeneratorBuilder(
            'singleton/singleton_with_env',
          );
        },
      );

      test(
        'Named singleton',
        () async {
          await checkDependencyGeneratorBuilder(
            'singleton/named_singleton',
          );
        },
      );
    },
  );
}
