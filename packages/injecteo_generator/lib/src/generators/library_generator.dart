import 'package:code_builder/code_builder.dart';
import 'package:injecteo_models/injecteo_models.dart';
import 'package:source_gen/source_gen.dart';

import '../utils/dependency_utils.dart';
import '../utils/type_refer.dart';
import '../utils/utils.dart';
import 'references.dart';

class InjectionModuleWithDependencies {
  InjectionModuleWithDependencies({
    required this.injectionModuleConfig,
    required this.dependencyConfigs,
  });

  final InjectionModuleConfig injectionModuleConfig;
  final Set<DependencyConfig> dependencyConfigs;
}

class LibraryGenerator {
  LibraryGenerator({
    required List<DependencyConfig> dependencies,
    required String configFunctionName,
    Uri? targetFile,
  })  : _configFunctionName = configFunctionName,
        _targetFile = targetFile {
    _sortedDependencies = sortDependencies(dependencies);
  }

  late final Set<DependencyConfig> _sortedDependencies;
  final String _configFunctionName;
  final Uri? _targetFile;

  Library generate() {
    /// envs
    ///
    final environments =
        _sortedDependencies.expand((element) => element.environments).toSet();
    final environmentFields = environments.map(
      (env) => Field(
        (b) => b
          ..name = '_$env'
          ..type = refer('String')
          ..assignment = literalString(env).code
          ..modifier = FieldModifier.constant,
      ),
    );

    /// external modules
    /// iterate all dependencies and extract unique external modules to generate their helpers classes
    ///
    final externalModuleConfigs = <ExternalModuleConfig>{};
    for (final dep in _sortedDependencies) {
      if (dep.externalModuleConfig != null) {
        externalModuleConfigs.add(dep.externalModuleConfig!);
      }
    }
    final externalModuleClasses = externalModuleConfigs.map(
      (config) => _buildExternalModuleClass(
        externalModuleConfig: config,
        dependencyConfigs: _sortedDependencies
            .where((e) => e.externalModuleConfig == config)
            .toSet(),
      ),
    );

    /// injection modules
    ///
    final injectionModuleWithDependencies = <InjectionModuleWithDependencies>{}
      ..addAll(
        [
          InjectionModuleWithDependencies(
            injectionModuleConfig: const InjectionModuleConfig(
              moduleName: "RemainingDependenciesInjectionModule",
            ),
            dependencyConfigs: _sortedDependencies
                .where((element) => element.isFromInjectionModule == false)
                .toSet(),
          ),
          ..._sortedDependencies.where((x) => x.isFromInjectionModule).map(
            (dependencyConfig) {
              final injectionModuleConfig =
                  dependencyConfig.injectionModuleConfig!;
              final dependenciesInModule = _sortedDependencies
                  .where(
                    (element) =>
                        element.injectionModuleConfig == injectionModuleConfig,
                  )
                  .toSet();
              return InjectionModuleWithDependencies(
                injectionModuleConfig: injectionModuleConfig,
                dependencyConfigs: dependenciesInModule,
              );
            },
          )
        ],
      );

    final injectionModuleClasses = injectionModuleWithDependencies
        .map(
          (injectionModuleWithDependencies) => _buildInjectionModuleClass(
            injectionModuleWithDependencies,
          ),
        )
        .toList();

    return Library(
      (b) => b
        ..body.addAll(
          [
            ...environmentFields,
            _buildConfigFunction(injectionModuleWithDependencies),
            ...injectionModuleClasses,
            ...externalModuleClasses
          ],
        ),
    );
  }

  Spec _buildConfigFunction(
    Set<InjectionModuleWithDependencies> injectionModulesWithDependencies,
  ) {
    final hasPreResolvedDeps = hasPreResolvedDependencies(_sortedDependencies);
    final intiMethod = Method(
      (b) => b
        ..docs.addAll(
          [
            '// ignore_for_file: unnecessary_lambdas',
            '// ignore_for_file: lines_longer_than_80_chars',
            '/// ',
            '/// configure registration of provided dependencies'
          ],
        )
        ..returns = hasPreResolvedDeps
            ? TypeReference(
                (b) => b
                  ..symbol = 'Future'
                  ..types.add(refer('void')),
              )
            : refer('void')
        ..name = _configFunctionName
        ..modifier = hasPreResolvedDeps ? MethodModifier.async : null
        ..requiredParameters.addAll(
          [
            Parameter(
              (b) => b
                ..name = slInstanceName
                ..type = slTypeReference,
            )
          ],
        )
        ..optionalParameters.addAll(
          [
            Parameter(
              (b) => b
                ..named = true
                ..name = 'environment'
                ..type = TypeReference(
                  (b) => b
                    ..symbol = 'String'
                    ..isNullable = true,
                ),
            ),
            Parameter(
              (b) => b
                ..named = true
                ..name = 'environmentFilter'
                ..type = TypeReference(
                  (b) => b
                    ..symbol = 'EnvironmentFilter'
                    ..url = injecteoImport
                    ..isNullable = true,
                ),
            )
          ],
        )
        ..body = Block(
          (b) => b.statements.addAll(
            injectionModulesWithDependencies.map(
              (c) {
                final moduleContainsPreResolvedDeps =
                    hasPreResolvedDependencies(c.dependencyConfigs);
                final expression = refer(c.injectionModuleConfig.moduleName)
                    .newInstance([])
                    .property(registerDependenciesFuncName)
                    .call(
                      [
                        refer(slInstanceName),
                      ],
                    );
                return moduleContainsPreResolvedDeps
                    ? expression.awaited.statement
                    : expression.statement;
              },
            ),
          ),
        ),
    );

    return intiMethod;
  }

  Class _buildExternalModuleClass({
    required ExternalModuleConfig externalModuleConfig,
    required Set<DependencyConfig> dependencyConfigs,
  }) {
    final abstractDeps =
        dependencyConfigs.where((d) => d.externalModuleConfig!.isAbstract);

    return Class(
      (c) {
        c
          ..name = '_\$${externalModuleConfig.type.name}'
          ..extend = typeRefer(
            externalModuleConfig.type,
            _targetFile,
          );
        if (moduleHasOverrides(abstractDeps)) {
          c.fields.add(
            Field(
              (b) => b
                ..name = slInstanceName
                ..type = slTypeReference
                ..modifier = FieldModifier.final$,
            ),
          );
          c.constructors.add(
            Constructor(
              (b) => b
                ..requiredParameters.add(
                  Parameter(
                    (b) => b
                      ..name = slInstanceName
                      ..toThis = true,
                  ),
                ),
            ),
          );
        }
        c.methods.addAll(
          abstractDeps.map(
            (dep) => Method(
              (b) => b
                ..annotations.add(refer('override'))
                ..name = dep.externalModuleConfig!.initializerName
                ..returns = typeRefer(
                  dep.typeImplementation,
                  _targetFile,
                )
                ..type = dep.externalModuleConfig!.isMethod
                    ? null
                    : MethodType.getter
                ..body = _registerFunctionBody(
                  dependencyConfig: dep,
                  dependencyConfigs: dependencyConfigs,
                  instanceForModule: true,
                ).code,
            ),
          ),
        );
      },
    );
  }

  Class _buildInjectionModuleClass(
    InjectionModuleWithDependencies injectionModuleWithDependencies,
  ) {
    final dependenciesInModule =
        injectionModuleWithDependencies.dependencyConfigs;
    final moduleContainsPreResolvedDeps =
        hasPreResolvedDependencies(dependenciesInModule);

    final c = Class(
      (b) {
        b
          ..name =
              injectionModuleWithDependencies.injectionModuleConfig.moduleName
          ..extend = baseInjectionModuleTypeReference;

        b.methods.addAll(
          [
            Method(
              (b) => b
                ..name = registerDependenciesFuncName
                ..annotations.add(refer('override'))
                ..returns = moduleContainsPreResolvedDeps
                    ? TypeReference(
                        (b) => b
                          ..symbol = 'Future'
                          ..types.add(refer('void')),
                      )
                    : refer('void')
                ..modifier =
                    moduleContainsPreResolvedDeps ? MethodModifier.async : null
                ..requiredParameters.addAll(
                  [
                    Parameter(
                      (b) => b
                        ..name = slInstanceName
                        ..type = slTypeReference,
                    )
                  ],
                )
                ..body = _buildRegisterFunctions(
                  dependencyConfigs: dependenciesInModule,
                ),
            ),
          ],
        );
      },
    );

    return c;
  }

  Block _buildRegisterFunctions({
    required Set<DependencyConfig> dependencyConfigs,
  }) {
    final externalModuleConfigs = <ExternalModuleConfig>{};
    for (final dep in dependencyConfigs) {
      final externalModuleConfig = dep.externalModuleConfig;
      if (externalModuleConfig != null) {
        externalModuleConfigs.add(externalModuleConfig);
      }
    }

    final environmentFilterCode = slHelperTypeReference
        .newInstance(
          [
            refer(slInstanceName),
            // refer('environment'),
            // refer('environmentFilter'),
          ],
        )
        .assignFinal(slHelperInstanceName)
        .statement;

    final externalModuleAssignmentsCode = externalModuleConfigs.map(
      (moduleConfig) {
        return refer('_\$${moduleConfig.type.name}')
            .call(
              [
                if (moduleHasOverrides(
                  dependencyConfigs.where((dependency) =>
                      dependency.externalModuleConfig == moduleConfig),
                ))
                  refer(slInstanceName)
              ],
            )
            .assignFinal(toCamelCase(moduleConfig.type.name))
            .statement;
      },
    );

    final registerFunctionsCode = dependencyConfigs.map(
      (dep) => _buildRegisterFunction(
        dependencyConfig: dep,
        dependencyConfigs: dependencyConfigs,
      ),
    );

    return Block(
      (b) => b.statements.addAll(
        [
          environmentFilterCode,
          ...externalModuleAssignmentsCode,
          ...registerFunctionsCode,
        ],
      ),
    );
  }

  Code _buildRegisterFunction({
    required DependencyConfig dependencyConfig,
    required Set<DependencyConfig> dependencyConfigs,
  }) {
    final asyncOrPreResolve = dependencyConfig.preResolve ||
        hasAsyncDependency(dependencyConfig, dependencyConfigs);

    final registerFuncName = _getRegisterFunctionName(
      dependencyConfig: dependencyConfig,
      isAsync: asyncOrPreResolve,
    );

    final registerExpression =
        slHelperInstanceReference.property(registerFuncName).call(
      [
        Method(
          (b) => b
            ..lambda = true
            ..modifier = asyncOrPreResolve ? MethodModifier.async : null
            ..body = _registerFunctionBody(
              dependencyConfig: dependencyConfig,
              dependencyConfigs: dependencyConfigs,
              instanceForModule: dependencyConfig.isFromExternalModule,
            ).code,
        ).closure
      ],
      {
        if (dependencyConfig.instanceName != null)
          'instanceName': literalString(dependencyConfig.instanceName!),
        if (dependencyConfig.environments.isNotEmpty == true)
          'registerFor': literalSet(
            dependencyConfig.environments.map((e) => refer('_$e')),
          ),
        if (dependencyConfig.preResolve == true)
          'preResolve': literalBool(true),
        if (dependencyConfig.disposeFunctionConfig != null)
          'dispose': _getDisposeFunctionAssignment(
              dependencyConfig.disposeFunctionConfig!),
        if (dependencyConfig.dependsOn.isNotEmpty)
          'dependsOn': literalList(
            dependencyConfig.dependsOn.map(
              (e) => typeRefer(
                e,
                _targetFile,
              ),
            ),
          ),
        if (dependencyConfig.signalsReady != null)
          'signalsReady': literalBool(dependencyConfig.signalsReady!),
      },
      [
        typeRefer(
          dependencyConfig.type,
          _targetFile,
        ),
      ],
    );

    return dependencyConfig.preResolve
        ? registerExpression.awaited.statement
        : registerExpression.statement;
  }

  String _getRegisterFunctionName({
    required DependencyConfig dependencyConfig,
    required bool isAsync,
  }) {
    if (dependencyConfig.dependencyType == DependencyType.factory) {
      return isAsync ? registerFactoryAsyncFuncName : registerFactoryFuncName;
    } else if (dependencyConfig.dependencyType ==
        DependencyType.lazySingleton) {
      return isAsync
          ? registerLazySingletonAsyncFuncName
          : registerLazySingletonFuncName;
    } else if (dependencyConfig.dependencyType == DependencyType.singleton) {
      return isAsync
          ? registerSingletonAsyncFuncName
          : registerSingletonFuncName;
    }

    throw InvalidGenerationSourceError(
      'Injecteo type is not supported. Check if function name responsible for generation ${dependencyConfig.dependencyType} is set. Dependency config: $dependencyConfig',
    );
  }

  Expression _registerFunctionBody({
    required DependencyConfig dependencyConfig,
    required Set<DependencyConfig> dependencyConfigs,
    required bool instanceForModule,
  }) {
    final positionalParams = dependencyConfig.positionalDependencies.map(
      (injectedDependency) => _createGetDependencyExpression(
        injectedDependency: injectedDependency,
        isAsync: isAsyncOrHasAsyncDependency(
          injectedDependency,
          dependencyConfigs,
        ),
      ),
    );
    final namedParams = Map.fromEntries(
      dependencyConfig.namedDependencies.map(
        (injectedDependency) => MapEntry(
          injectedDependency.paramName,
          _createGetDependencyExpression(
            injectedDependency: injectedDependency,
            isAsync: isAsyncOrHasAsyncDependency(
              injectedDependency,
              dependencyConfigs,
            ),
          ),
        ),
      ),
    );

    if (instanceForModule) {
      final externalModuleConfig = dependencyConfig.externalModuleConfig!;
      if (!externalModuleConfig.isMethod) {
        return refer(
          toCamelCase(externalModuleConfig.type.name),
        ).property(externalModuleConfig.initializerName);
      }

      return refer(toCamelCase(externalModuleConfig.type.name))
          .newInstanceNamed(
        externalModuleConfig.initializerName,
        positionalParams,
        namedParams,
      );
    }

    final ref = typeRefer(
      dependencyConfig.typeImplementation,
      _targetFile,
    );
    final isNamedInstance =
        dependencyConfig.constructorName?.isNotEmpty == true;

    if (isNamedInstance) {
      return ref.newInstanceNamed(
        dependencyConfig.constructorName!,
        positionalParams,
        namedParams,
      );
    } else {
      return ref.newInstance(
        positionalParams,
        namedParams,
      );
    }
  }

  Expression _getDisposeFunctionAssignment(
    DisposeFunctionConfig disposeFunctionConfig,
  ) {
    if (disposeFunctionConfig.isInstance) {
      return Method(
        (b) => b
          ..requiredParameters.add(Parameter((b) => b.name = 'i'))
          ..body =
              refer('i').property(disposeFunctionConfig.name).call([]).code,
      ).closure;
    } else {
      return typeRefer(
        disposeFunctionConfig.importableType!,
        _targetFile,
      );
    }
  }

  Expression _createGetDependencyExpression({
    required InjectedDependency injectedDependency,
    required bool isAsync,
  }) {
    final expression =
        refer(isAsync ? getDependencyAsyncMethodName : getDependencyMethodName)
            .call(
      [],
      {
        if (injectedDependency.instanceName != null)
          'instanceName': literalString(injectedDependency.instanceName!),
      },
      [
        typeRefer(
          injectedDependency.type,
          _targetFile,
        ),
      ],
    );
    return isAsync ? expression.awaited : expression;
  }
}
