import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:glob/glob.dart';
import 'package:injecteo_annotation/injecteo_annotation.dart';
import 'package:injecteo_generator/src/generators/library_generator.dart';
import 'package:injecteo_generator/src/model/dependency_config.dart';
import 'package:source_gen/source_gen.dart';

class InjecteoInitializerGenerator
    extends GeneratorForAnnotation<InjecteoInitializer> {
  @override
  dynamic generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    final preferRelativeImports =
        annotation.read("preferRelativeImports").boolValue;
    final targetFile = preferRelativeImports ? element.source?.uri : null;
    final initializerName = annotation.read('initializerName').stringValue;

    final pattern = Glob("**.injecteo.json");
    final jsonData = <Map<String, dynamic>>[];

    await for (final id in buildStep.findAssets(pattern)) {
      final json = jsonDecode(await buildStep.readAsString(id));
      jsonData.addAll([...json]);
    }

    final deps = <DependencyConfig>[];
    for (final json in jsonData) {
      deps.add(DependencyConfig.fromJson(json));
    }

    final generator = LibraryGenerator(
      dependencies: deps,
      targetFile: targetFile,
      initializerName: initializerName,
    );

    final generatedLib = generator.generate();
    final emitter = DartEmitter(
      allocator: Allocator.simplePrefixing(),
      orderDirectives: true,
      useNullSafetySyntax: true,
    );

    return DartFormatter().format(generatedLib.accept(emitter).toString());
  }
}
