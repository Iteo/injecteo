import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:glob/glob.dart';
import 'package:injecteo/injecteo.dart';
import 'package:injecteo_models/injecteo_models.dart';
import 'package:source_gen/source_gen.dart';

import 'library_generator.dart';

class InjecteoConfigGenerator extends GeneratorForAnnotation<InjecteoConfig> {
  @override
  dynamic generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    final preferRelativeImports =
        annotation.read("preferRelativeImports").boolValue;
    final targetFile = preferRelativeImports ? element.source?.uri : null;
    final configFunctionName =
        annotation.read('configFunctionName').stringValue;

    final pattern = Glob("**.injecteo.json");
    final jsonData = <Map<String, dynamic>>[];

    await for (final id in buildStep.findAssets(pattern)) {
      final json = jsonDecode(await buildStep.readAsString(id));
      jsonData.addAll([...json]);
    }

    final dependencyConfig = <DependencyConfig>[];
    for (final json in jsonData) {
      dependencyConfig.add(DependencyConfig.fromJson(json));
    }

    final generator = LibraryGenerator(
      dependencies: dependencyConfig,
      targetFile: targetFile,
      configFunctionName: configFunctionName,
    );

    final generatedLib = generator.generate();

    final generatedCode = DartFormatter().format(
      generatedLib
          .accept(
            DartEmitter(
              allocator: Allocator.simplePrefixing(),
              orderDirectives: true,
              useNullSafetySyntax: true,
            ),
          )
          .toString(),
    );
    return generatedCode;
  }
}
