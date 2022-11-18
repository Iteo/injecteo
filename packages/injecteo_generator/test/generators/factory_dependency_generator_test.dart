import 'package:test/test.dart';

import '../utils/builder_utils.dart';

Future<void> main() async {
  group(
    'Factory dependency generator',
    () {
      test(
        'Simple factory test',
        () async {
          await checkDependencyGeneratorBuilder(
            'factory/simple_factory',
          );
        },
      );

      test(
        'Abstract factory test',
        () async {
          await checkDependencyGeneratorBuilder(
            'factory/abstract_factory',
          );
        },
      );

      test(
        'Factory with dependency test',
        () async {
          await checkDependencyGeneratorBuilder(
            'factory/factory_with_dependency',
          );
        },
      );

      test(
        'Factory with env',
        () async {
          await checkDependencyGeneratorBuilder(
            'factory/factory_with_env',
          );
        },
      );

      test(
        'Factory with factory method',
        () async {
          await checkDependencyGeneratorBuilder(
            'factory/factory_with_factory_method',
          );
        },
      );

      test(
        'Named factory',
        () async {
          await checkDependencyGeneratorBuilder(
            'factory/named_factory',
          );
        },
      );
    },
  );
}
