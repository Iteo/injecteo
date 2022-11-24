part of 'library_generator_test.dart';

void runInjectionModulesTests() {
  group('Injection Modules tests', () {
    const injectionModuleConfig = InjectionModuleConfig(
      moduleName: 'MyInjectionModule',
    );

    test(
      'Should generate injection module without dependencies',
      () {
        final result = runBuildInjectionModuleClass(
          injectionModuleConfig,
          dependencies: [],
        );
        final expected = readFile(
          [
            'test',
            'outputs',
            'config',
            'injection_module_without_dependencies.txt',
          ],
        );

        expectChecksumEquals(result, expected);
      },
    );

    test(
      'Should generate injection module with dependencies',
      () {
        final result = runBuildInjectionModuleClass(
          injectionModuleConfig,
          dependencies: [
            _singletonDependency,
            _inputDependency,
          ],
        );
        final expected = readFile(
          [
            'test',
            'outputs',
            'config',
            'injection_module_with_dependencies.txt',
          ],
        );

        expect(result, expected);
      },
    );

    test('Should generate injection module from example', () {
      final result = runBuildInjectionModuleClass(
        injectionModuleConfig,
        dependencies: [
          _inputDependency.copyWith(
            type: _injectionType,
            typeImplementation: _injectionTypeImplementation,
            injectionModuleConfig: injectionModuleConfig,
          ),
        ],
      );
      final expected = readFile(
        [
          'test',
          'outputs',
          'config',
          'injection_module_from_example_with_dependencies.txt',
        ],
      );

      expect(result, expected);
    });
  });
}
