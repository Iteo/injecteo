import 'dart:async';
import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:injecteo_annotation/injecteo_annotation.dart';
import 'package:injecteo_models/injecteo_models.dart';
import 'package:source_gen/source_gen.dart';

import '../resolvers/dependency_resolver.dart';
import '../resolvers/importable_type_resolver_impl.dart';
import '../resolvers/type_checker.dart';

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
      final hasInjectionModuleAnnotation =
          injectionModuleChecker.hasAnnotationOf(c);
      final hasExternalModuleAnnotation = externalModuleChecker.hasAnnotationOfExact(c);
      final hasInjectAnnotation = injectChecker.hasAnnotationOf(c);

      if (hasExternalModuleAnnotation) {
        if (!c.isAbstract) {
          throw InvalidGenerationSourceError(
            '[${c.name}] must be an abstract class!',
            element: c,
          );
        }
        final moduleProperties = <ExecutableElement>[
          ...c.accessors,
          ...c.methods,
        ];
        for (final moduleElement in moduleProperties) {
          if (moduleElement.isPrivate) continue;
          allDepsInStep.add(
            DependencyResolver(typeResolver).resolveAsModuleMember(
              c,
              moduleElement,
            ),
          );
        }
      } else if (hasInjectionModuleAnnotation) {
        allDepsInStep.add(
          DependencyResolver(typeResolver)
              .resolveWithInjectionModuleAnnotation(c),
        );
      } else if (hasInjectAnnotation) {
        allDepsInStep.add(
          DependencyResolver(typeResolver).resolve(c),
        );
      }
    }
    return allDepsInStep.isNotEmpty ? jsonEncode(allDepsInStep) : null;
  }
}
