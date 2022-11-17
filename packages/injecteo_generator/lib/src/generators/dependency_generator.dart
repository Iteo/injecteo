import 'dart:async';
import 'dart:convert';

import 'package:build/build.dart';
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

    for (final c in library.classes) {
      if (externalModuleChecker.hasAnnotationOfExact(c) ||
          (injectionModuleChecker.hasAnnotationOf(c) && !c.isAbstract) ||
          injectChecker.hasAnnotationOf(c)) {
        final dependencyConfig = DependencyResolver(typeResolver).resolve(c);
        allDepsInStep.addAll(dependencyConfig);
      }
    }
    return allDepsInStep.isNotEmpty ? jsonEncode(allDepsInStep) : null;
  }
}
