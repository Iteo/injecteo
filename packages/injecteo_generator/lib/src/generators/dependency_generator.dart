import 'dart:async';
import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:injecteo_annotation/injecteo_annotation.dart';
import 'package:injecteo_generator/src/model/models.dart';
import 'package:injecteo_generator/src/resolvers/dependency_resolver.dart';
import 'package:injecteo_generator/src/resolvers/importable_type_resolver.dart';
import 'package:injecteo_generator/src/resolvers/importable_type_resolver_impl.dart';
import 'package:source_gen/source_gen.dart';

const TypeChecker _injectableChecker = TypeChecker.fromRuntime(Injectable);

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
    for (final c in library.classes) {
      if (_hasInjectable(c)) {
        allDepsInStep.add(
          DependencyResolver(
            getResolver(await buildStep.resolver.libraries.toList()),
          ).resolve(c),
        );
      }
    }

    return allDepsInStep.isNotEmpty ? jsonEncode(allDepsInStep) : null;
  }

  ImportableTypeResolver getResolver(List<LibraryElement> libs) {
    return ImportableTypeResolverImpl(libs);
  }

  bool _hasInjectable(ClassElement element) {
    return _injectableChecker.hasAnnotationOf(element);
  }
}
