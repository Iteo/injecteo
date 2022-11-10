import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:injecteo_models/injecteo_models.dart';
import 'package:source_gen/source_gen.dart';

import '../utils/utils.dart';
import 'importable_type_resolver.dart';
import 'type_checker.dart';

class DependencyResolver {
  DependencyResolver(this._typeResolver);

  final ImportableTypeResolver _typeResolver;

  late ImportableType _type;
  late ImportableType _typeImplementation;

  final List<InjectedDependency> _dependencies = [];
  final List<ImportableType> _dependsOn = [];

  DependencyType _dependencyType = DependencyType.factory;
  bool _preResolve = false;
  bool _isAsync = false;

  List<String> _environments = [];
  bool? _signalsReady;

  String? _instanceName;
  String? _constructorName;
  ModuleConfig? _moduleConfig;
  InjectionModuleConfig? _injectionModuleConfig;
  DisposeFunctionConfig? _disposeFunctionConfig;

  DependencyConfig resolve(
    ClassElement classElement,
  ) {
    _type = _typeResolver.resolveType(classElement.thisType);
    return _resolveActualType(classElement);
  }

  /// Dependency with InjectionModule means that it will be registered inside separate class
  /// in order to plug and play modules in main initializer
  ///
  DependencyConfig resolveWithInjectionModuleAnnotation(
    ClassElement classElement,
  ) {
    final firstAnnotation = injectionModuleChecker.firstAnnotationOf(
      classElement,
      throwOnUnresolved: false,
    );

    final annotation = ConstantReader(firstAnnotation);
    final injectionModuleName = annotation.peek('name')?.stringValue;
    if (injectionModuleName == null) {
      throw InvalidGenerationSourceError(
        'Injection module should have a name',
        element: classElement,
      );
    }
    _injectionModuleConfig = InjectionModuleConfig(
      moduleName: injectionModuleName,
    );
    return resolve(classElement);
  }

  /// Dependency which is part of Module needs to have module-specific attributes
  /// Method extracts them and put into [ModuleConfig]
  DependencyConfig resolveAsModuleMember(
    ClassElement moduleClassElement,
    ExecutableElement moduleElement,
  ) {
    final moduleType = _typeResolver.resolveType(moduleClassElement.thisType);
    final initializerName = moduleElement.name;
    final returnType = moduleElement.returnType;

    final moduleElementReturnType = returnType.element;
    if (moduleElementReturnType is! ClassElement) {
      throw InvalidGenerationSourceError(
        '${returnType.getDisplayString(withNullability: false)} is not a class element',
        element: moduleElementReturnType,
      );
    }

    ClassElement c;
    var isAbstract = false;

    var type = returnType;
    if (moduleElement.isAbstract) {
      c = moduleElementReturnType;
      isAbstract = true;
      if (moduleElement.parameters.isNotEmpty) {
        throw InvalidGenerationSourceError(
          'Abstract methods can not have injectable or factory parameters',
          element: moduleElement,
        );
      }
    } else {
      if (returnType.isDartAsyncFuture) {
        final typeArg = returnType as ParameterizedType;
        final element = typeArg.typeArguments.first.element;
        if (element is! ClassElement) {
          throw InvalidGenerationSourceError(
            '$element is not a class element',
            element: returnType.element,
          );
        }
        c = element;
        type = typeArg.typeArguments.first;
      } else {
        c = moduleElementReturnType;
      }
    }
    _moduleConfig = ModuleConfig(
      isAbstract: isAbstract,
      isMethod: moduleElement is MethodElement,
      type: moduleType,
      initializerName: initializerName,
    );
    _type = _typeResolver.resolveType(type);
    return _resolveActualType(c, moduleElement);
  }

  DependencyConfig _resolveActualType(
    ClassElement c, [
    ExecutableElement? moduleElement,
  ]) {
    final annotatedElement = moduleElement ?? c;
    _typeImplementation = _type;

    final firstAnnotation = injectChecker.firstAnnotationOf(
      annotatedElement,
      throwOnUnresolved: false,
    );

    DartType? abstractType;
    ExecutableElement? disposeFuncFromAnnotation;
    List<String>? inlineEnv;

    if (firstAnnotation != null) {
      final annotation = ConstantReader(firstAnnotation);
      if (annotation.instanceOf(lazySingletonChecker)) {
        _dependencyType = DependencyType.lazySingleton;
        disposeFuncFromAnnotation =
            annotation.peek('dispose')?.objectValue.toFunctionValue();
      } else if (annotation.instanceOf(singletonChecker)) {
        _dependencyType = DependencyType.singleton;
        _signalsReady = annotation.peek('signalsReady')?.boolValue;
        disposeFuncFromAnnotation =
            annotation.peek('dispose')?.objectValue.toFunctionValue();
        final dependsOn = annotation
            .peek('dependsOn')
            ?.listValue
            .map((type) => type.toTypeValue())
            .where((v) => v != null)
            .map<ImportableType>(
              (dartType) => _typeResolver.resolveType(dartType!),
            )
            .toList();
        if (dependsOn != null) {
          _dependsOn.addAll(dependsOn);
        }
      }
      abstractType = annotation.peek('as')?.typeValue;
      inlineEnv = annotation
          .peek('env')
          ?.listValue
          .map((e) => e.toStringValue()!)
          .toList();
    }

    if (abstractType != null) {
      final abstractChecker = TypeChecker.fromStatic(abstractType);
      final abstractSubtype = c.allSupertypes
          .firstOrNull((type) => abstractChecker.isExactly(type.element));

      if (abstractSubtype == null) {
        throw InvalidGenerationSourceError(
          '[${c.name}] is not a subtype of [${abstractType.getDisplayString(withNullability: false)}]',
          element: c,
        );
      }
      _type = _typeResolver.resolveType(abstractSubtype);
    }

    _environments = inlineEnv ??
        environemntChecker
            .annotationsOf(annotatedElement)
            .map<String>(
              (e) => e.getField('name')!.toStringValue()!,
            )
            .toList();

    _preResolve = preResolveChecker.hasAnnotationOfExact(annotatedElement);

    final name = namedChecker
        .firstAnnotationOfExact(annotatedElement)
        ?.getField('name')
        ?.toStringValue();
    if (name != null) {
      if (name.isNotEmpty) {
        _instanceName = name;
      } else {
        _instanceName = c.name;
      }
    }

    final disposeMethod = c.methods
        .firstOrNull((m) => disposeMethodChecker.hasAnnotationOfExact(m));
    if (disposeMethod != null) {
      if (_dependencyType == DependencyType.factory) {
        throw InvalidGenerationSourceError(
          'Factory types can not have a dispose method',
          element: c,
        );
      }
      final disposeHasRequiredParameter = disposeMethod.parameters.any(
        (p) => p.isRequiredNamed || p.isRequiredPositional || p.hasRequired,
      );
      if (disposeHasRequiredParameter) {
        throw InvalidGenerationSourceError(
          'Dispose method must not take any required arguments',
          element: disposeMethod,
        );
      }
      _disposeFunctionConfig = DisposeFunctionConfig(
        isInstance: true,
        name: disposeMethod.name,
      );
    } else if (disposeFuncFromAnnotation != null) {
      final params = disposeFuncFromAnnotation.parameters;
      final notMatchingSignature = params.length != 1 ||
          _typeResolver.resolveType(params.first.type) != _type;
      if (notMatchingSignature) {
        throw InvalidGenerationSourceError(
          'Dispose function for $_type must have the same signature as FutureOr Function($_type instance)',
          element: disposeFuncFromAnnotation,
        );
      }
      _disposeFunctionConfig = DisposeFunctionConfig(
        name: disposeFuncFromAnnotation.name,
        importableType: _typeResolver.resolveFunctionType(
          disposeFuncFromAnnotation.type,
          disposeFuncFromAnnotation,
        ),
      );
    }

    late ExecutableElement factoryMethodOrConstructor;
    if (moduleElement != null && !moduleElement.isAbstract) {
      factoryMethodOrConstructor = moduleElement;
    } else {
      final possibleFactories = <ExecutableElement>[
        ...c.methods.where((m) => m.isStatic),
        ...c.constructors,
      ];

      factoryMethodOrConstructor = possibleFactories.firstWhere(
        (m) => factoryMethodChecker.hasAnnotationOfExact(m),
        orElse: () {
          if (c.isAbstract) {
            throw InvalidGenerationSourceError(
              '''[${c.name}] is abstract and it's not allowed to be registered directly! \n'''
              ''' If it has a factory or a create method, annotate it with @factoryMethod''',
              element: c,
            );
          }
          final unnamedConstructor = c.unnamedConstructor;
          if (unnamedConstructor == null) {
            throw InvalidGenerationSourceError(
              '''[${c.name}] do not have factoryMethod nor unnamed constructor. '''
              '''Can't register.''',
              element: c,
            );
          }
          return unnamedConstructor;
        },
      );
    }

    _isAsync = factoryMethodOrConstructor.returnType.isDartAsyncFuture;
    _constructorName = factoryMethodOrConstructor.name;

    for (final param in factoryMethodOrConstructor.parameters) {
      final namedAnnotation = namedChecker.firstAnnotationOf(param);
      final instanceName = namedAnnotation
              ?.getField('type')
              ?.toTypeValue()
              ?.getDisplayString(withNullability: false) ??
          namedAnnotation?.getField('name')?.toStringValue();

      final resolvedType = param.type is FunctionType
          ? _typeResolver.resolveFunctionType(param.type as FunctionType)
          : _typeResolver.resolveType(param.type);

      _dependencies.add(
        InjectedDependency(
          type: resolvedType,
          instanceName: instanceName,
          paramName: param.name,
          isPositional: param.isPositional,
        ),
      );
    }

    return DependencyConfig(
      type: _type,
      typeImplementation: _typeImplementation,
      dependencyType: _dependencyType,
      dependencies: _dependencies,
      dependsOn: _dependsOn,
      environments: _environments,
      signalsReady: _signalsReady,
      preResolve: _preResolve,
      instanceName: _instanceName,
      moduleConfig: _moduleConfig,
      injectionModuleConfig: _injectionModuleConfig,
      constructorName: _constructorName,
      isAsync: _isAsync,
      disposeFunctionConfig: _disposeFunctionConfig,
    );
  }
}
