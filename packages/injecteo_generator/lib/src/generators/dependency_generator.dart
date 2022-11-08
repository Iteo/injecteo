import 'dart:async';
import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:injecteo_generator/src/model/dependency_config.dart';
import 'package:injecteo_generator/src/resolvers/dependency_resolver.dart';
import 'package:injecteo_generator/src/resolvers/importable_type_resolver.dart';
import 'package:injecteo_generator/src/resolvers/importable_type_resolver_impl.dart';
import 'package:injecteo_generator/src/resolvers/type_checker.dart';
import 'package:injecteo_generator/src/utils/utils.dart';
import 'package:source_gen/source_gen.dart';

class InjecteoDependencyGenerator implements Generator {
  InjecteoDependencyGenerator(
    this.options,
  );

  final BuilderOptions options;

  @override
  FutureOr<String?> generate(
    LibraryReader library,
    BuildStep buildStep,
  ) async {
    final allDepsInStep = <DependencyConfig>[];
    final libs = await buildStep.resolver.libraries.toList();
    final typeResolver = ImportableTypeResolverImpl(libs);
    final classes = library.classes;

    for (final c in classes) {
      final isModule = moduleChecker.hasAnnotationOfExact(c);
      final isInject = injectChecker.hasAnnotationOf(c);

      if (isModule) {
        _addModuleDependency(
          c,
          typeResolver,
          allDepsInStep,
        );
      } else if (isInject) {
        _addInjectDependency(
          c,
          typeResolver,
          allDepsInStep,
        );
      }
    }
    return allDepsInStep.isNotEmpty ? jsonEncode(allDepsInStep) : null;
  }

  void _addModuleDependency(
    ClassElement c,
    ImportableTypeResolver typeResolver,
    List<DependencyConfig> allDepsInStep,
  ) {
    throwIf(
      !c.isAbstract,
      '[${c.name}] must be an abstract class!',
      element: c,
    );
    final executables = <ExecutableElement>[
      ...c.accessors,
      ...c.methods,
    ];
    for (final element in executables) {
      if (element.isPrivate) continue;
      allDepsInStep.add(
        DependencyResolver(typeResolver).resolveModuleMember(c, element),
      );
    }
  }

  void _addInjectDependency(
    ClassElement c,
    ImportableTypeResolver typeResolver,
    List<DependencyConfig> allDepsInStep,
  ) {
    allDepsInStep.add(
      DependencyResolver(typeResolver).resolve(c),
    );
  }
}
