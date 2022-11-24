part of 'library_generator_test.dart';

void runExternalModulesIoTests() {
  group('I/O checkDependencyGeneratorBuilder for external modules tests', () {
    test('Simple module', () async {
      await checkDependencyGeneratorBuilder(
        'external_module/simple_module',
      );
    });

    test('Async module', () async {
      await checkDependencyGeneratorBuilder(
        'external_module/async_external_module',
      );
    });

    test('Named module', () async {
      await checkDependencyGeneratorBuilder(
        'external_module/named_module',
      );
    });

    test('Network module', () async {
      await checkDependencyGeneratorBuilder(
        'external_module/network_module',
      );
    });
  });
}
