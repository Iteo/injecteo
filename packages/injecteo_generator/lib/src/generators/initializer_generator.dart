import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:glob/glob.dart';
import 'package:injecteo_annotation/injecteo_annotation.dart';
import 'package:injecteo_generator/src/generators/library_generator.dart';
import 'package:injecteo_generator/src/model/models.dart';
import 'package:injecteo_generator/src/resolvers/importable_type_resolver_impl.dart';
import 'package:source_gen/source_gen.dart';

class InjecteoInitializerGenerator
    extends GeneratorForAnnotation<InjecteoInitializer> {
  @override
  dynamic generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    final generateForDir = annotation
        .read('generateForDir')
        .listValue
        .map((e) => e.toStringValue());

    final targetFile = element.source?.uri;
    final preferRelativeImports =
        annotation.read("preferRelativeImports").boolValue;
    final initializerName = annotation.read('initializerName').stringValue;

    final dirPattern = generateForDir.length > 1
        ? '{${generateForDir.join(',')}}'
        : '${generateForDir.first}';
    final injectableConfigFiles = Glob("$dirPattern/**.injecteo.json");

    final jsonData = <Map<String, dynamic>>[];
    await for (final id in buildStep.findAssets(injectableConfigFiles)) {
      final json = jsonDecode(await buildStep.readAsString(id));
      jsonData.addAll([...json]);
    }

    final deps = <DependencyConfig>[];
    for (final json in jsonData) {
      deps.add(DependencyConfig.fromJson(json));
    }

    final typeResolver =
        ImportableTypeResolverImpl(await buildStep.resolver.libraries.toList());

    final generator = LibraryGenerator(
      dependencies: deps,
      targetFile: preferRelativeImports ? targetFile : null,
      initializerName: initializerName,
    );

    final generatedLib = generator.generate();
    final emitter = DartEmitter(
      allocator: Allocator.simplePrefixing(),
      orderDirectives: true,
    );

    return DartFormatter().format(generatedLib.accept(emitter).toString());
  }
}
