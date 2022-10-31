import 'package:code_builder/code_builder.dart';
import 'package:injecteo_generator/src/model/models.dart';
import 'package:injecteo_generator/src/utils/builder_utils.dart';
import 'package:injecteo_generator/src/utils/utils.dart';

const _injecteoImport = 'package:injecteo/injecteo.dart';
const _getItRefer = Reference('GetIt', 'package:get_it/get_it.dart');
const _ghRefer = Reference('gh');

class LibraryGenerator {
  LibraryGenerator({
    required List<DependencyConfig> dependencies,
    required String initializerName,
    Uri? targetFile,
  })  : _initializerName = initializerName,
        _targetFile = targetFile {
    _dependencies = sortDependencies(dependencies);
  }
  late Set<DependencyConfig> _dependencies;
  final String _initializerName;
  final Uri? _targetFile;

  Library generate() {
    // if true use an awaited initializer
    final hasPreResolvedDeps = hasPreResolvedDependencies(_dependencies);

    // all environment keys used
    final environments = <String>{};
    // all register modules
    final modules = <ModuleConfig>{};
    for (final dep in _dependencies) {
      environments.addAll(dep.environments);
      if (dep.moduleConfig != null) {
        modules.add(dep.moduleConfig!);
      }
    }

    final ignoreForFileComments = [
      '// ignore_for_file: unnecessary_lambdas',
      '// ignore_for_file: lines_longer_than_80_chars'
    ];
    final getInstanceRefer = refer('get');
    final intiMethod = Method(
      (b) => b
        ..docs.addAll([
          ...ignoreForFileComments,
          '/// initializes the registration of provided dependencies inside of [GetIt]'
        ])
        ..returns = hasPreResolvedDeps
            ? TypeReference(
                (b) => b
                  ..symbol = 'Future'
                  ..types.add(_getItRefer),
              )
            : _getItRefer
        ..name = _initializerName
        ..modifier = hasPreResolvedDeps ? MethodModifier.async : null
        ..requiredParameters.addAll([
          Parameter(
            (b) => b
              ..name = 'get'
              ..type = _getItRefer,
          )
        ])
        ..optionalParameters.addAll([
          Parameter(
            (b) => b
              ..named = true
              ..name = 'environment'
              ..type = nullableRefer(
                'String',
                nullable: true,
              ),
          ),
          Parameter(
            (b) => b
              ..named = true
              ..name = 'environmentFilter'
              ..type = nullableRefer(
                'EnvironmentFilter',
                url: _injecteoImport,
                nullable: true,
              ),
          )
        ])
        ..body = Block(
          (b) => b.statements.addAll([
            refer('GetItHelper', _injecteoImport)
                .newInstance(
                  [
                    getInstanceRefer,
                    refer('environment'),
                    refer('environmentFilter'),
                  ],
                )
                .assignFinal('gh')
                .statement,
            ...modules.map(
              (module) => refer('_\$${module.type.name}')
                  .call([
                    if (moduleHasOverrides(
                      _dependencies.where((e) => e.moduleConfig == module),
                    ))
                      getInstanceRefer
                  ])
                  .assignFinal(toCamelCase(module.type.name))
                  .statement,
            ),
            ..._dependencies.map((dep) {
              if (dep.dependencyType == DependencyType.singleton) {
                return buildSingletonRegisterFun(dep);
              } else {
                return buildLazyRegisterFun(dep);
              }
            }),
            getInstanceRefer.returned.statement,
          ]),
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
            // build modules
            ...modules.map(
              (module) => _buildModule(
                module,
                _dependencies.where((e) => e.moduleConfig == module),
              ),
            )
          ],
        ),
    );
  }

  Class _buildModule(ModuleConfig module, Iterable<DependencyConfig> deps) {
    final abstractDeps = deps.where((d) => d.moduleConfig!.isAbstract);
    return Class((c) {
      c
        ..name = '_\$${module.type.name}'
        ..extend = typeRefer(module.type, _targetFile);
      // check weather we should have a getIt field inside of our module
      if (moduleHasOverrides(abstractDeps)) {
        c.fields.add(
          Field(
            (b) => b
              ..name = '_getIt'
              ..type = _getItRefer
              ..modifier = FieldModifier.final$,
          ),
        );
        c.constructors.add(
          Constructor(
            (b) => b
              ..requiredParameters.add(
                Parameter(
                  (b) => b
                    ..name = '_getIt'
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
              ..returns = typeRefer(dep.typeImplementation, _targetFile)
              ..type = dep.moduleConfig!.isMethod ? null : MethodType.getter
              ..body = _buildInstance(
                dep,
                getAsyncMethodName: '_getIt.getAsync',
                getMethodName: '_getIt',
              ).code,
          ),
        ),
      );
    });
  }

  Code buildLazyRegisterFun(DependencyConfig dep) {
    String funcReferName = "";
    final Map<String, Reference> factoryParams = {};
    final hasAsyncDep = hasAsyncDependency(dep, _dependencies);
    final isOrHasAsyncDep = dep.isAsync || hasAsyncDep;

    if (dep.dependencyType == DependencyType.factory) {
      final hasFactoryParams = dep.dependencies.any((d) => d.isFactoryParam);
      if (hasFactoryParams) {
        funcReferName = isOrHasAsyncDep ? 'factoryParamAsync' : 'factoryParam';
        factoryParams.addAll(_resolveFactoryParams(dep));
      } else {
        funcReferName = isOrHasAsyncDep ? 'factoryAsync' : 'factory';
      }
    } else if (dep.dependencyType == DependencyType.lazySingleton) {
      funcReferName = isOrHasAsyncDep ? 'lazySingletonAsync' : 'lazySingleton';
    }
    throwIf(funcReferName.isEmpty, 'Injectable type is not supported');

    final registerExpression = _ghRefer.property(funcReferName).call([
      Method(
        (b) => b
          ..lambda = true
          ..modifier = hasAsyncDep ? MethodModifier.async : null
          ..requiredParameters.addAll(
            factoryParams.keys.map(
              (name) => Parameter((b) => b.name = name),
            ),
          )
          ..body = dep.isFromModule
              ? _buildInstanceForModule(dep).code
              : _buildInstance(dep).code,
      ).closure
    ], {
      if (dep.instanceName != null)
        'instanceName': literalString(dep.instanceName!),
      if (dep.environments.isNotEmpty == true)
        'registerFor': literalSet(
          dep.environments.map((e) => refer('_$e')),
        ),
      if (dep.preResolve == true) 'preResolve': literalBool(true),
      if (dep.disposeFunctionConfig != null)
        'dispose': _getDisposeFunctionAssignment(dep.disposeFunctionConfig!)
    }, [
      typeRefer(dep.type, _targetFile),
      ...factoryParams.values.map((p) => p.type)
    ]);
    return dep.preResolve
        ? registerExpression.awaited.statement
        : registerExpression.statement;
  }

  Map<String, Reference> _resolveFactoryParams(DependencyConfig dep) {
    final params = <String, Reference>{};
    dep.dependencies.where((d) => d.isFactoryParam).forEach((d) {
      params[d.paramName] = typeRefer(d.type, _targetFile);
    });
    if (params.length < 2) {
      params['_'] = refer('dynamic');
    }
    return params;
  }

  Code buildSingletonRegisterFun(DependencyConfig dep) {
    String funcReferName;
    var asFactory = true;
    final hasAsyncDep = hasAsyncDependency(dep, _dependencies);
    if (dep.isAsync || hasAsyncDep) {
      funcReferName = 'singletonAsync';
    } else if (dep.dependsOn.isNotEmpty) {
      funcReferName = 'singletonWithDependencies';
    } else {
      asFactory = false;
      funcReferName = 'singleton';
    }

    final instanceBuilder =
        dep.isFromModule ? _buildInstanceForModule(dep) : _buildInstance(dep);
    final registerExpression = _ghRefer.property(funcReferName).call([
      if (asFactory)
        Method(
          (b) => b
            ..lambda = true
            ..modifier = hasAsyncDep ? MethodModifier.async : null
            ..body = instanceBuilder.code,
        ).closure
      else
        instanceBuilder
    ], {
      if (dep.instanceName != null)
        'instanceName': literalString(dep.instanceName!),
      if (dep.dependsOn.isNotEmpty)
        'dependsOn': literalList(
          dep.dependsOn.map(
            (e) => typeRefer(e, _targetFile),
          ),
        ),
      if (dep.environments.isNotEmpty)
        'registerFor': literalSet(
          dep.environments.map((e) => refer('_$e')),
        ),
      if (dep.signalsReady != null)
        'signalsReady': literalBool(dep.signalsReady!),
      if (dep.preResolve == true) 'preResolve': literalBool(true),
      if (dep.disposeFunctionConfig != null)
        'dispose': _getDisposeFunctionAssignment(dep.disposeFunctionConfig!)
    }, [
      typeRefer(dep.type, _targetFile)
    ]);

    return dep.preResolve
        ? registerExpression.awaited.statement
        : registerExpression.statement;
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

    final ref = typeRefer(dep.typeImplementation, _targetFile);
    if (dep.constructorName?.isNotEmpty == true) {
      return ref
          .newInstanceNamed(
            dep.constructorName!,
            positionalParams,
            namedParams,
          )
          .expression;
    } else {
      return ref.newInstance(positionalParams, namedParams).expression;
    }
  }

  Expression _buildInstanceForModule(DependencyConfig dep) {
    final module = dep.moduleConfig!;
    if (!module.isMethod) {
      return refer(
        toCamelCase(module.type.name),
      ).property(module.initializerName).expression;
    }

    return refer(toCamelCase(module.type.name))
        .newInstanceNamed(
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
        )
        .expression;
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
      return typeRefer(disposeFunctionConfig.importableType!, _targetFile);
    }
  }

  Expression _buildParamAssignment(
    InjectedDependency dependency, {
    String? getAsyncReferName,
    String? getReferName,
  }) {
    if (dependency.isFactoryParam) {
      return refer(dependency.paramName);
    }
    getAsyncReferName ??= 'get.getAsync';
    getReferName ??= 'get';
    final isAsync = isAsyncOrHasAsyncDependency(dependency, _dependencies);
    final expression =
        refer(isAsync ? getAsyncReferName : getReferName).call([], {
      if (dependency.instanceName != null)
        'instanceName': literalString(dependency.instanceName!),
    }, [
      typeRefer(dependency.type, _targetFile, false),
    ]);
    return isAsync ? expression.awaited : expression;
  }
}

bool moduleHasOverrides(Iterable<DependencyConfig> deps) {
  return deps.where((d) => d.moduleConfig?.isAbstract == true).any(
        (d) => d.dependencies.isNotEmpty == true,
      );
}
