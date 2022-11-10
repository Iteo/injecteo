import 'package:code_builder/code_builder.dart';
import 'package:injecteo_models/injecteo_models.dart';

import '../resolvers/import_path_resolver.dart';

Reference typeRefer(
  ImportableType importableType, [
  Uri? targetFile,
]) {
  final relativeImportUrl = targetFile == null
      ? ImportPathResolver.resolveAssetImport(importableType.import)
      : ImportPathResolver.relative(importableType.import, targetFile);

  return TypeReference(
    (reference) {
      reference
        ..symbol = importableType.name
        ..url = relativeImportUrl
        ..isNullable = importableType.isNullable;
      if (importableType.typeArguments.isNotEmpty) {
        reference.types.addAll(
          importableType.typeArguments.map(
            (e) => typeRefer(
              e,
              targetFile,
            ),
          ),
        );
      }
    },
  );
}
