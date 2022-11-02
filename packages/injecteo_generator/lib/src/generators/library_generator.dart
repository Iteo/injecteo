import 'package:code_builder/code_builder.dart';
import 'package:injecteo_generator/src/model/models.dart';
import 'package:injecteo_generator/src/utils/builder_utils.dart';
import 'package:injecteo_generator/src/utils/utils.dart';
import 'package:source_gen/source_gen.dart';

const _injecteoImport = 'package:injecteo/injecteo.dart';

const _slTypeReference = Reference('ServiceLocator', _injecteoImport);
const _slInstanceName = 'serviceLocator';

const _slHelperTypeReference =
    Reference('ServiceLocatorHelper', _injecteoImport);
const _slHelperInstanceName = 'serviceLocatorHelper';
const _slHelperInstanceReference = Reference(_slHelperInstanceName);

const _registerFactoryFuncName = 'registerFactory';
const _registerFactoryAsyncFuncName = 'registerFactoryAsync';

const _registerSingletonFuncName = 'registerSingleton';
const _registerSingletonAsyncFuncName = 'registerSingletonAsync';

const _registerLazySingletonFuncName = 'registerLazySingleton';
const _registerLazySingletonAsyncFuncName = 'registerLazySingletonAsync';

class LibraryGenerator {
  LibraryGenerator({
    required List<DependencyConfig> dependencies,
    required String initializerName,
    Uri? targetFile,
  })  : _initializerName = initializerName,
        _targetFile = targetFile {
    _dependencies = sortDependencies(dependencies);
  }

  late final Set<DependencyConfig> _dependencies;
  final String _initializerName;
  final Uri? _targetFile;

  Library generate() {
    final environments = <String>{};
    final moduleConfigs = <ModuleConfig>{};

    for (final dep in _dependencies) {
      environments.addAll(dep.environments);
      if (dep.moduleConfig != null) {
        moduleConfigs.add(dep.moduleConfig!);
      }
    }

    // if true use an awaited initializer
    final hasPreResolvedDeps = hasPreResolvedDependencies(_dependencies);

    final ignoreForFileComments = [
      '// ignore_for_file: unnecessary_lambdas',
      '// ignore_for_file: lines_longer_than_80_chars'
    ];

    final serviceLocatorInstanceReference = refer(_slInstanceName);

    final intiMethod = Method(
      (b) => b
        ..docs.addAll(
          [
            ...ignoreForFileComments,
            '/// initializes the registration of provided dependencies'
          ],
        )
        ..returns = hasPreResolvedDeps
            ? TypeReference(
                (b) => b
                  ..symbol = 'Future'
                  ..types.add(_slTypeReference),
              )
            : _slTypeReference
        ..name = _initializerName
        ..modifier = hasPreResolvedDeps ? MethodModifier.async : null
        ..requiredParameters.addAll([
          Parameter(
            (b) => b
              ..name = _slInstanceName
              ..type = _slTypeReference,
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
                    ..url = _injecteoImport
                    ..isNullable = true,
                ),
            )
          ],
        )
        ..body = Block(
          (b) => b.statements.addAll(
            [
              _slHelperTypeReference
                  .newInstance(
                    [
                      serviceLocatorInstanceReference,
                      refer('environment'),
                      refer('environmentFilter'),
                    ],
                  )
                  .assignFinal(_slHelperInstanceName)
                  .statement,
              ...moduleConfigs.map(
                (moduleConfig) => refer('_\$${moduleConfig.type.name}')
                    .call(
                      [
                        if (moduleHasOverrides(
                          _dependencies
                              .where((e) => e.moduleConfig == moduleConfig),
                        ))
                          serviceLocatorInstanceReference
                      ],
                    )
                    .assignFinal(toCamelCase(moduleConfig.type.name))
                    .statement,
              ),
              ..._dependencies.map(
                (dep) {
                  return buildRegisterFunction(dep);
                },
              ),
              serviceLocatorInstanceReference.returned.statement,
            ],
          ),
        ),
    );

    return Library(
      (b) => b
        ..body.addAll(
          [
            ...environments.map(
              (env) => Field(
                (b) => b
                  ..name = '_$env'
                  ..type = refer('String')
                  ..assignment = literalString(env).code
                  ..modifier = FieldModifier.constant,
              ),
            ),
            intiMethod,
            ...moduleConfigs.map(
              (moduleConfig) => _buildModule(
                moduleConfig,
                _dependencies.where((e) => e.moduleConfig == moduleConfig),
              ),
            )
          ],
        ),
    );
  }

  Class _buildModule(
    ModuleConfig module,
    Iterable<DependencyConfig> deps,
  ) {
    final abstractDeps = deps.where((d) => d.moduleConfig!.isAbstract);

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
                ..name = _slInstanceName
                ..type = _slTypeReference
                ..modifier = FieldModifier.final$,
            ),
          );
          c.constructors.add(
            Constructor(
              (b) => b
                ..requiredParameters.add(
                  Parameter(
                    (b) => b
                      ..name = _slInstanceName
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
                  dep,
                  getAsyncMethodName: '$_slInstanceName.getAsync',
                  getMethodName: '$_slInstanceName.get',
                ).code,
            ),
          ),
        );
      },
    );
  }

  Code buildRegisterFunction(DependencyConfig dep) {
    final Map<String, Reference> factoryParams = {};
    final hasAsyncDep = hasAsyncDependency(dep, _dependencies);
    final registerFuncName = _getRegisterFunction(dep);

    final instanceBuilder =
        dep.isFromModule ? _buildInstanceForModule(dep) : _buildInstance(dep);

    final registerExpression =
        _slHelperInstanceReference.property(registerFuncName).call(
      [
        Method(
          (b) => b
            ..lambda = true
            ..modifier = hasAsyncDep ? MethodModifier.async : null
            ..requiredParameters.addAll(
              factoryParams.keys.map(
                (name) => Parameter((b) => b.name = name),
              ),
            )
            ..body = instanceBuilder.code,
        ).closure
      ],
      {
        if (dep.instanceName != null)
          'instanceName': literalString(dep.instanceName!),
        if (dep.environments.isNotEmpty == true)
          'registerFor': literalSet(
            dep.environments.map((e) => refer('_$e')),
          ),
        if (dep.preResolve == true) 'preResolve': literalBool(true),
        if (dep.disposeFunctionConfig != null)
          'dispose': _getDisposeFunctionAssignment(dep.disposeFunctionConfig!),
        if (dep.dependsOn.isNotEmpty)
          'dependsOn': literalList(
            dep.dependsOn.map(
              (e) => typeRefer(
                e,
                _targetFile,
              ),
            ),
          ),
        if (dep.signalsReady != null)
          'signalsReady': literalBool(dep.signalsReady!),
      },
      [
        typeRefer(dep.type, _targetFile),
        ...factoryParams.values.map((p) => p.type)
      ],
    );

    return dep.preResolve
        ? registerExpression.awaited.statement
        : registerExpression.statement;
  }

  String _getRegisterFunction(DependencyConfig dep) {
    final hasAsyncDep = hasAsyncDependency(dep, _dependencies);
    final isOrHasAsyncDep = dep.isAsync || hasAsyncDep;

    if (dep.dependencyType == DependencyType.factory) {
      return isOrHasAsyncDep
          ? _registerFactoryAsyncFuncName
          : _registerFactoryFuncName;
    } else if (dep.dependencyType == DependencyType.lazySingleton) {
      return isOrHasAsyncDep
          ? _registerLazySingletonAsyncFuncName
          : _registerLazySingletonFuncName;
    } else if (dep.dependencyType == DependencyType.singleton) {
      if (isOrHasAsyncDep) {
        return _registerSingletonAsyncFuncName;
      } else {
        return _registerSingletonFuncName;
      }
    }

    throw InvalidGenerationSourceError(
        'Injecteo type is not supported. Check if function name responsible for generation ${dep.dependencyType} is set');
  }

  Expression _buildInstance(
    DependencyConfig dep, {
    String? getAsyncMethodName,
    String? getMethodName,
  }) {
    final positionalParams = dep.positionalDependencies.map(
      (dependency) => _buildParamAssignment(
        dependency,
        getAsyncReferName: getAsyncMethodName,
        getReferName: getMethodName,
      ),
    );

    final namedParams = Map.fromEntries(
      dep.namedDependencies.map(
        (dependecy) => MapEntry(
          dependecy.paramName,
          _buildParamAssignment(
            dependecy,
            getAsyncReferName: getAsyncMethodName,
            getReferName: getMethodName,
          ),
        ),
      ),
    );

    final ref = typeRefer(
      dep.typeImplementation,
      _targetFile,
    );

    if (dep.constructorName?.isNotEmpty == true) {
      return ref.newInstanceNamed(
        dep.constructorName!,
        positionalParams,
        namedParams,
      );
    } else {
      return ref.newInstance(positionalParams, namedParams);
    }
  }

  Expression _buildInstanceForModule(DependencyConfig dep) {
    final module = dep.moduleConfig!;
    if (!module.isMethod) {
      return refer(
        toCamelCase(module.type.name),
      ).property(module.initializerName);
    }

    return refer(toCamelCase(module.type.name)).newInstanceNamed(
      module.initializerName,
      dep.positionalDependencies.map(
        (dependecy) => _buildParamAssignment(dependecy),
      ),
      Map.fromEntries(
        dep.namedDependencies.map(
          (dependecy) => MapEntry(
            dependecy.paramName,
            _buildParamAssignment(dependecy),
          ),
        ),
      ),
    );
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

  Expression _buildParamAssignment(
    InjectedDependency dependency, {
    String? getAsyncReferName,
    String? getReferName,
  }) {
    getAsyncReferName ??= '$_slInstanceName.getAsync';
    getReferName ??= '$_slInstanceName.get';
    final isAsync = isAsyncOrHasAsyncDependency(dependency, _dependencies);
    final expression = refer(isAsync ? getAsyncReferName : getReferName).call(
      [],
      {
        if (dependency.instanceName != null)
          'instanceName': literalString(dependency.instanceName!),
      },
      [
        typeRefer(
          dependency.type,
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
