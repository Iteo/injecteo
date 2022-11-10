import 'package:code_builder/code_builder.dart';
import 'package:injecteo_models/injecteo_models.dart';
import 'package:source_gen/source_gen.dart';

import '../utils/dependency_utils.dart';
import '../utils/type_refer.dart';
import '../utils/utils.dart';
import 'references.dart';

class LibraryGenerator {
  LibraryGenerator({
    required List<DependencyConfig> dependencies,
    required String initializerName,
    Uri? targetFile,
  })  : _initializerName = initializerName,
        _targetFile = targetFile {
    _sortedDependencies = sortDependencies(dependencies);
  }

  late final Set<DependencyConfig> _sortedDependencies;
  final String _initializerName;
  final Uri? _targetFile;

  Library generate() {
    final environments =
        _sortedDependencies.expand((element) => element.environments).toSet();

    final injectionModuleConfigs = _sortedDependencies
        .where((element) => element.isFromInjectionModule)
        .map((e) => e.injectionModuleConfig!)
        .toSet();

    final moduleConfigs = _getModuleConfigs(_sortedDependencies);

    final environmentFields = environments.map(
      (env) => Field(
        (b) => b
          ..name = '_$env'
          ..type = refer('String')
          ..assignment = literalString(env).code
          ..modifier = FieldModifier.constant,
      ),
    );

    final injectionModuleClasses = injectionModuleConfigs.map(
      (injectionModuleConfig) => _buildInjectionModuleClass(
        injectionModuleConfig: injectionModuleConfig,
        injectionModuleDependencies: _sortedDependencies
            .where((e) => e.injectionModuleConfig == injectionModuleConfig)
            .toSet(),
        isAsync: true,
      ),
    );

    final moduleClasses = moduleConfigs.map(
      (moduleConfig) => _buildModuleClass(
        module: moduleConfig,
        moduleDependencies:
            _sortedDependencies.where((e) => e.moduleConfig == moduleConfig),
      ),
    );

    final initializer = _buildInitializer(moduleConfigs: moduleConfigs);

    return Library(
      (b) => b
        ..body.addAll(
          [
            ...environmentFields,
            initializer,
            ...injectionModuleClasses,
            ...moduleClasses
          ],
        ),
    );
  }

  Set<ModuleConfig> _getModuleConfigs(Set<DependencyConfig> dependencyConfigs) {
    return dependencyConfigs
        .where((element) => element.isFromModule)
        .map((x) => x.moduleConfig!)
        .toSet();
  }

  Spec _buildInitializer({
    required Iterable<ModuleConfig> moduleConfigs,
  }) {
    final hasPreResolvedDeps = hasPreResolvedDependencies(_sortedDependencies);

    final intiMethod = Method(
      (b) => b
        ..docs.addAll(
          [
            '// ignore_for_file: unnecessary_lambdas',
            '// ignore_for_file: lines_longer_than_80_chars',
            '/// ',
            '/// initializes the registration of provided dependencies'
          ],
        )
        ..returns = hasPreResolvedDeps
            ? TypeReference(
                (b) => b
                  ..symbol = 'Future'
                  ..types.add(slTypeReference),
              )
            : slTypeReference
        ..name = _initializerName
        ..modifier = hasPreResolvedDeps ? MethodModifier.async : null
        ..requiredParameters.addAll([
          Parameter(
            (b) => b
              ..name = slInstanceName
              ..type = slTypeReference,
          )
        ])
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
        //TODO: iterate over modules, register them. Generate missing dependencies (without module)
        // ..body = _buildRegisterFunctions(),
        ..body = Code(''),
    );

    return intiMethod;
  }

  Class _buildModuleClass({
    required ModuleConfig module,
    required Iterable<DependencyConfig> moduleDependencies,
  }) {
    final abstractDeps =
        moduleDependencies.where((d) => d.moduleConfig!.isAbstract);

    return Class(
      (c) {
        c
          ..name = '_\$${module.type.name}'
          ..extend = typeRefer(
            module.type,
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
                ..name = dep.moduleConfig!.initializerName
                ..returns = typeRefer(
                  dep.typeImplementation,
                  _targetFile,
                )
                ..type = dep.moduleConfig!.isMethod ? null : MethodType.getter
                ..body = _buildInstance(
                  dependency: dep,
                  isAsync: false,
                  instanceForModule: true,
                ).code,
            ),
          ),
        );
      },
    );
  }

  Class _buildInjectionModuleClass({
    required InjectionModuleConfig injectionModuleConfig,
    required Set<DependencyConfig> injectionModuleDependencies,
    required bool isAsync,
  }) {
    final c = Class(
      (b) {
        b
          ..name = '_\$${injectionModuleConfig.moduleName}'
          ..extend = baseInjectionModuleTypeReference;

        b.methods.addAll(
          [
            Method(
              (b) => b
                ..name = registerDependenciesFuncName
                ..annotations.add(refer('override'))
                ..returns = isAsync
                    ? TypeReference(
                        (b) => b
                          ..symbol = 'Future'
                          ..types.add(refer('void')),
                      )
                    : refer('void')
                ..modifier = isAsync ? MethodModifier.async : null
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
                ..body = _buildRegisterFunctions(
                  dependencyConfigs: injectionModuleDependencies,
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
    final moduleConfigs = _getModuleConfigs(dependencyConfigs);

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

    final moduleAssignmentsCode = moduleConfigs.map(
      (moduleConfig) {
        final moduleCode = refer('_\$${moduleConfig.type.name}')
            .call(
              [
                if (moduleHasOverrides(
                  dependencyConfigs.where(
                      (dependency) => dependency.moduleConfig == moduleConfig),
                ))
                  refer(slInstanceName)
              ],
            )
            .assignFinal(toCamelCase(moduleConfig.type.name))
            .statement;
        return moduleCode;
      },
    );

    final registerFunctionsCode = dependencyConfigs.map(
      (dep) => _buildRegisterFunction(
        dependency: dep,
        isAsync: hasAsyncDependency(dep, dependencyConfigs),
      ),
    );

    return Block(
      (b) => b.statements.addAll(
        [
          environmentFilterCode,
          ...moduleAssignmentsCode,
          ...registerFunctionsCode,
        ],
      ),
    );
  }

  Code _buildRegisterFunction({
    required DependencyConfig dependency,
    required bool isAsync,
  }) {
    final registerFuncName = _getRegisterFunctionName(
      dependency: dependency,
      hasAsyncDependencies: isAsync,
    );

    final body = _buildInstance(
      dependency: dependency,
      isAsync: isAsync,
      instanceForModule: dependency.isFromModule,
    ).code;

    final registerExpression =
        slHelperInstanceReference.property(registerFuncName).call(
      [
        Method(
          (b) => b
            ..lambda = true
            ..modifier = isAsync ? MethodModifier.async : null
            ..body = body,
        ).closure
      ],
      {
        if (dependency.instanceName != null)
          'instanceName': literalString(dependency.instanceName!),
        if (dependency.environments.isNotEmpty == true)
          'registerFor': literalSet(
            dependency.environments.map((e) => refer('_$e')),
          ),
        if (dependency.preResolve == true) 'preResolve': literalBool(true),
        if (dependency.disposeFunctionConfig != null)
          'dispose':
              _getDisposeFunctionAssignment(dependency.disposeFunctionConfig!),
        if (dependency.dependsOn.isNotEmpty)
          'dependsOn': literalList(
            dependency.dependsOn.map(
              (e) => typeRefer(
                e,
                _targetFile,
              ),
            ),
          ),
        if (dependency.signalsReady != null)
          'signalsReady': literalBool(dependency.signalsReady!),
      },
      [
        typeRefer(dependency.type, _targetFile),
      ],
    );

    return dependency.preResolve
        ? registerExpression.awaited.statement
        : registerExpression.statement;
  }

  String _getRegisterFunctionName({
    required DependencyConfig dependency,
    required bool hasAsyncDependencies,
  }) {
    final isOrHasAsyncDep = dependency.isAsync || hasAsyncDependencies;

    if (dependency.dependencyType == DependencyType.factory) {
      return isOrHasAsyncDep
          ? registerFactoryAsyncFuncName
          : registerFactoryFuncName;
    } else if (dependency.dependencyType == DependencyType.lazySingleton) {
      return isOrHasAsyncDep
          ? registerLazySingletonAsyncFuncName
          : registerLazySingletonFuncName;
    } else if (dependency.dependencyType == DependencyType.singleton) {
      if (isOrHasAsyncDep) {
        return registerSingletonAsyncFuncName;
      } else {
        return registerSingletonFuncName;
      }
    }

    throw InvalidGenerationSourceError(
      'Injecteo type is not supported. Check if function name responsible for generation ${dependency.dependencyType} is set',
    );
  }

  Expression _buildInstance({
    required DependencyConfig dependency,
    required bool isAsync,
    required bool instanceForModule,
  }) {
    final positionalParams = dependency.positionalDependencies.map(
      (injectedDependency) => _buildParamAssignment(
        injectedDependency: injectedDependency,
        isAsync: isAsync,
      ),
    );

    final namedParams = Map.fromEntries(
      dependency.namedDependencies.map(
        (injectedDependency) => MapEntry(
          injectedDependency.paramName,
          _buildParamAssignment(
            injectedDependency: injectedDependency,
            isAsync: isAsync,
          ),
        ),
      ),
    );

    if (instanceForModule) {
      final module = dependency.moduleConfig!;
      if (!module.isMethod) {
        return refer(
          toCamelCase(module.type.name),
        ).property(module.initializerName);
      }

      return refer(toCamelCase(module.type.name)).newInstanceNamed(
        module.initializerName,
        positionalParams,
        namedParams,
      );
    }

    final ref = typeRefer(
      dependency.typeImplementation,
      _targetFile,
    );

    final isNamedInstance = dependency.constructorName?.isNotEmpty == true;
    if (isNamedInstance) {
      return ref.newInstanceNamed(
        dependency.constructorName!,
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

  Expression _buildParamAssignment({
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

bool moduleHasOverrides(Iterable<DependencyConfig> deps) {
  return deps.where((d) => d.moduleConfig?.isAbstract == true).any(
        (d) => d.dependencies.isNotEmpty == true,
      );
}
