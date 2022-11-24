part of 'library_generator_test.dart';

void runInjectionModuleIoTests() {
  group('I/O checkDependencyGeneratorBuilder for injection modules tests', () {
    test('Simple module', () async {
      await checkDependencyGeneratorBuilder(
        'injection_module/simple_module',
      );
    });
  });
}
