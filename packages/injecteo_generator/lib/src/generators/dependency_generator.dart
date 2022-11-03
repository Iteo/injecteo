import 'dart:async';
import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:injecteo_generator/src/model/models.dart';
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
    for (final c in library.classes) {
      if (moduleChecker.hasAnnotationOfExact(c)) {
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
            DependencyResolver(
              getResolver(libs),
            ).resolveModuleMember(c, element),
          );
        }
      } else if (_hasAnnotation(c)) {
        allDepsInStep.add(
          DependencyResolver(
            getResolver(libs),
          ).resolve(c),
        );
      }
    }

    return allDepsInStep.isNotEmpty ? jsonEncode(allDepsInStep) : null;
  }

  ImportableTypeResolver getResolver(List<LibraryElement> libs) {
    return ImportableTypeResolverImpl(libs);
  }

  bool _hasAnnotation(ClassElement c) {
    return injectChecker.hasAnnotationOf(c);
  }
}
