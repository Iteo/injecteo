part of 'library_generator_test.dart';

void runExternalModulesBasicTests() {
  group('Basic generate external modules test', () {
    test(
      'Should generate demo external module',
      () {
        final allDependencies = [
          _baseDependency,
          _singletonDependency,
          _factoryDependency
        ];

        final result = runBuildExternalModuleClass(
          allDependencies.first.externalModuleConfig,
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
          singletonDependency.externalModuleConfig,
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
          _singletonDependency.externalModuleConfig,
          dependencies: dependencies,
        );

        expectChecksumEquals(result, _expectedEmptyDemoExternalModule);
      },
    );
  });
}
