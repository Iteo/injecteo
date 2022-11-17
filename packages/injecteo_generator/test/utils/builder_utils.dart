import 'dart:io';

import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:injecteo_generator/builder.dart';

Future<void> checkDependencyGeneratorBuilder(
  String fileName, [
  String inputDirectory = 'example/lib',
  String outputDirectory = 'test/outputs',
  String outputExtension = 'injecteo.json',
  BuilderOptions options = BuilderOptions.empty,
]) async {
  final File inputFile =
      File('${Directory.current.path}/$inputDirectory/$fileName.dart');
  final File outputFile = File(
    '${Directory.current.path}/$outputDirectory/$fileName.$outputExtension',
  );

  assert(
    inputFile.existsSync(),
    'input file is missing, ${inputFile.path}',
  );
  assert(
    outputFile.existsSync(),
    'expected output file is missing, ${outputFile.path}',
  );

  final String inputContent = await inputFile.readAsString();
  final String outputContent = await outputFile.readAsString();

  final builder = dependencyGeneratorBuilder(
    options,
  );
  await checkBuilderContent(
    builder: builder,
    packageName: 'example',
    fileName: fileName,
    inputContent: inputContent,
    outputContent: outputContent,
  );
}

Future<void> checkBuilderContent({
  required Builder builder,
  required String packageName,
  required String fileName,
  required String inputContent,
  required String outputContent,
}) async {
  await testBuilder(
    builder,
    {
      '$packageName|lib/$fileName.dart': inputContent,
    },
    outputs: {
      '$packageName|lib/$fileName.injecteo.json': outputContent,
    },
    rootPackage: packageName,
    reader: await PackageAssetReader.currentIsolate(),
  );
}
