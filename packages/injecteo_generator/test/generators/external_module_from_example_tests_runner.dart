part of 'library_generator_test.dart';

void runExternalModulesTestsFromExample() {
  group('Code generation tests - AbstractSimpleModule', () {
    const externalModuleConfig = ExternalModuleConfig(
      isAbstract: true,
      isMethod: false,
      initializerName: 'dependency',
      type: ImportableType(
        name: 'AbstractSimpleModule',
        import: 'package:example/external_module/simple_module.dart',
        isNullable: false,
        typeArguments: [],
      ),
    );

    test(
      'Should generate correct code for AbstractSimpleModule without dependencies',
      () {
        final result = runBuildExternalModuleClass(
          externalModuleConfig,
          dependencies: [],
        );
        const expected = 'class _\$AbstractSimpleModule '
            'extends AbstractSimpleModule { }\n';

        expectChecksumEquals(result, expected);
      },
    );

    test(
      'Should generate correct code for AbstractSimpleModule with dependencies',
      () {
        final result = runBuildExternalModuleClass(
          externalModuleConfig,
          dependencies: [
            _inputDependency.copyWith(
              externalModuleConfig: externalModuleConfig,
            ),
          ],
        );
        final expected = readFile(
          [
            'test',
            'outputs',
            'config',
            'abstract_simple_module_with_dependencies.txt',
          ],
        );

        expectChecksumEquals(result, expected);
      },
    );

    test(
      'Should generate different code for AbstractSimpleModule due to additional random deps passed to runBuildExternalModuleClass method',
      () {
        final result = runBuildExternalModuleClass(
          externalModuleConfig,
          dependencies: [
            _inputDependency.copyWith(
              externalModuleConfig: externalModuleConfig,
            ),
            _factoryDependency,
            _singletonDependency,
          ],
        );
        final expected = readFile(
          [
            'test',
            'outputs',
            'config',
            'abstract_simple_module_with_dependencies.txt',
          ],
        );

        expectChecksumNotEquals(result, expected);
      },
    );
  });

  group('Code generation tests - NetworkModule', () {
    const externalModuleConfig = ExternalModuleConfig(
      isAbstract: false,
      isMethod: true,
      type: ImportableType(
        name: 'NetworkExternalModule',
        import: 'package:example/external_module/network_module.dart',
        isNullable: false,
        typeArguments: [],
      ),
      initializerName: 'getApiService',
    );

    final apiServiceDependency = _inputDependency.copyWith(
      externalModuleConfig: externalModuleConfig,
      constructorName: 'getApiService',
      type: const ImportableType(
        name: 'ApiService',
        import: 'package:example/external_module/network_module.dart',
        isNullable: false,
        typeArguments: [],
      ),
      typeImplementation: const ImportableType(
        name: 'ApiService',
        import: 'package:example/external_module/network_module.dart',
        isNullable: false,
        typeArguments: [],
      ),
    );

    test(
      'Should generate correct code for NetworkExternalModule without dependencies',
      () {
        final result = runBuildExternalModuleClass(
          externalModuleConfig,
          dependencies: [],
        );
        const expected =
            'class _\$NetworkExternalModule extends NetworkExternalModule { }\n';

        expectChecksumEquals(result, expected);
      },
    );

    test(
      'Should generate correct code for NetworkExternalModule (non-abstract) with ApiService dependency',
      () {
        final result = runBuildExternalModuleClass(
          externalModuleConfig,
          dependencies: [
            apiServiceDependency,
          ],
        );
        const expected =
            'class _\$NetworkExternalModule extends NetworkExternalModule { }\n';

        expectChecksumEquals(result, expected);
      },
    );

    test(
      'Should generate correct code for NetworkExternalModule (abstract) with ApiService dependency',
      () {
        final result = runBuildExternalModuleClass(
          externalModuleConfig,
          dependencies: [
            apiServiceDependency.copyWith(
              externalModuleConfig: externalModuleConfig.copyWith(
                isAbstract: true,
              ),
            ),
          ],
        );
        final expected = readFile(
          [
            'test',
            'outputs',
            'config',
            'network_external_module_with_dependencies.txt',
          ],
        );

        expectChecksumEquals(result, expected);
      },
    );
  });

  group('Code generation tests - NamedModule', () {
    const externalModuleConfig = ExternalModuleConfig(
      isAbstract: true,
      isMethod: false,
      type: ImportableType(
        name: 'NamedModule',
        import: 'package:example/external_module/named_module.dart',
        typeArguments: [],
        isNullable: false,
      ),
      initializerName: 'dependency',
    );

    test(
      'Should generate correct code for NamedModule with dependencies',
      () {
        final result = runBuildExternalModuleClass(
          externalModuleConfig,
          dependencies: [
            _inputDependency.copyWith(
              typeImplementation: const ImportableType(
                name: 'FakeModuleDependency',
                isNullable: false,
                typeArguments: [],
                import:
                    'package:example/external_module/named_module_fake.dart',
              ),
              externalModuleConfig: externalModuleConfig,
              signalsReady: true,
              dependsOn: const [
                ImportableType(
                  name: 'NetworkExternalModule',
                  import: 'package:example/external_module/network_module.dart',
                  isNullable: false,
                  typeArguments: [],
                ),
              ],
              dependencies: const [
                InjectedDependency(
                  type: ImportableType(
                    name: 'ModuleDependency',
                    import:
                        'package:example/external_module/simple_module.dart',
                    isNullable: false,
                    typeArguments: [],
                  ),
                  paramName: 'storage',
                  isPositional: true,
                ),
              ],
            ),
          ],
        );
        final expected = readFile(
          [
            'test',
            'outputs',
            'config',
            'named_module_with_dependency.txt',
          ],
        );

        expectChecksumEquals(result, expected);
      },
    );
  });
}
