import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:injecteo_generator/src/model/dependency_config.dart';
import 'package:injecteo_generator/src/model/dependency_type.dart';
import 'package:injecteo_generator/src/model/dispose_function_config.dart';
import 'package:injecteo_generator/src/model/importable_type.dart';
import 'package:injecteo_generator/src/model/injected_dependency.dart';
import 'package:injecteo_generator/src/model/module_config.dart';
import 'package:injecteo_generator/src/resolvers/importable_type_resolver.dart';
import 'package:injecteo_generator/src/resolvers/type_checker.dart';
import 'package:injecteo_generator/src/utils/utils.dart';
import 'package:source_gen/source_gen.dart';

class DependencyResolver {
  DependencyResolver(this._typeResolver);

  final ImportableTypeResolver _typeResolver;

  late ImportableType _type;
  late ImportableType _typeImpl;

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
  DisposeFunctionConfig? _disposeFunctionConfig;

  DependencyConfig resolve(
    ClassElement element,
  ) {
    _type = _typeResolver.resolveType(element.thisType);
    return _resolveActualType(element);
  }

  DependencyConfig _resolveActualType(
    ClassElement c, [
    ExecutableElement? excModuleMember,
  ]) {
    final annotatedElement = excModuleMember ?? c;
    _typeImpl = _type;

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

      throwIf(
        abstractSubtype == null,
        '[${c.name}] is not a subtype of [${abstractType.getDisplayString(withNullability: false)}]',
        element: c,
      );

      _type = _typeResolver.resolveType(abstractSubtype!);
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
      throwIf(
        _dependencyType == DependencyType.factory,
        'Factory types can not have a dispose method',
        element: c,
      );
      throwIf(
        disposeMethod.parameters.any(
          (p) => p.isRequiredNamed || p.isRequiredPositional || p.hasRequired,
        ),
        'Dispose method must not take any required arguments',
        element: disposeMethod,
      );
      _disposeFunctionConfig = DisposeFunctionConfig(
        isInstance: true,
        name: disposeMethod.name,
      );
    } else if (disposeFuncFromAnnotation != null) {
      final params = disposeFuncFromAnnotation.parameters;
      throwIf(
        params.length != 1 ||
            _typeResolver.resolveType(params.first.type) != _type,
        'Dispose function for $_type must have the same signature as FutureOr Function($_type instance)',
        element: disposeFuncFromAnnotation,
      );
      _disposeFunctionConfig = DisposeFunctionConfig(
        name: disposeFuncFromAnnotation.name,
        importableType: _typeResolver.resolveFunctionType(
          disposeFuncFromAnnotation.type,
          disposeFuncFromAnnotation,
        ),
      );
    }

    late ExecutableElement executableInitializer;
    if (excModuleMember != null && !excModuleMember.isAbstract) {
      executableInitializer = excModuleMember;
    } else {
      final possibleFactories = <ExecutableElement>[
        ...c.methods.where((m) => m.isStatic),
        ...c.constructors,
      ];

      executableInitializer = possibleFactories.firstWhere(
        (m) => factoryMethodChecker.hasAnnotationOfExact(m),
        orElse: () {
          throwIf(
            c.isAbstract,
            '''[${c.name}] is abstract and can not be registered directly! \nif it has a factory or a create method annotate it with @factoryMethod''',
            element: c,
          );
          return c.unnamedConstructor as ExecutableElement;
        },
      );
    }

    _isAsync = executableInitializer.returnType.isDartAsyncFuture;
    _constructorName = executableInitializer.name;
    for (final param in executableInitializer.parameters) {
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
      typeImplementation: _typeImpl,
      dependencyType: _dependencyType,
      dependencies: _dependencies,
      dependsOn: _dependsOn,
      environments: _environments,
      signalsReady: _signalsReady,
      preResolve: _preResolve,
      instanceName: _instanceName,
      moduleConfig: _moduleConfig,
      constructorName: _constructorName,
      isAsync: _isAsync,
      disposeFunctionConfig: _disposeFunctionConfig,
    );
  }

  DependencyConfig resolveInjectionModuleMember(
    ClassElement classElement,
  ) {
    final moduleType = _typeResolver.resolveType(classElement.thisType);
    var isAbstract = false;

    return _resolveActualType(classElement);
  }

  DependencyConfig resolveModuleMember(
    ClassElement classElement,
    ExecutableElement executableElement,
  ) {
    final moduleType = _typeResolver.resolveType(classElement.thisType);
    final initializerName = executableElement.name;
    var isAbstract = false;

    final returnType = executableElement.returnType;

    throwIf(
      returnType.element is! ClassElement,
      '${returnType.getDisplayString(withNullability: false)} is not a class element',
      element: returnType.element,
    );

    Element? c;
    var type = returnType;
    if (executableElement.isAbstract) {
      c = returnType.element;
      isAbstract = true;
      throwIf(
        executableElement.parameters.isNotEmpty,
        'Abstract methods can not have injectable or factory parameters',
        element: executableElement,
      );
    } else {
      if (returnType.isDartAsyncFuture) {
        final typeArg = returnType as ParameterizedType;
        c = typeArg.typeArguments.first.element;
        type = typeArg.typeArguments.first;
      } else {
        c = returnType.element;
      }
    }
    _moduleConfig = ModuleConfig(
      isAbstract: isAbstract,
      isMethod: executableElement is MethodElement,
      type: moduleType,
      initializerName: initializerName,
    );
    _type = _typeResolver.resolveType(type);
    return _resolveActualType(c as ClassElement, executableElement);
  }
}
