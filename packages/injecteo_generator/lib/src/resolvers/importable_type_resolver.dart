import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:injecteo_generator/src/model/models.dart';
import 'package:path/path.dart' as p;

abstract class ImportableTypeResolver {
  String? resolveImport(Element element);

  ImportableType resolveType(DartType type);

  ImportableType resolveFunctionType(
    FunctionType function, [
    ExecutableElement? executableElement,
  ]);

  static String? relative(String? path, Uri? to) {
    if (path == null || to == null) {
      return null;
    }
    final fileUri = Uri.parse(path);
    final libName = to.pathSegments.first;
    if ((to.scheme == 'package' &&
            fileUri.scheme == 'package' &&
            fileUri.pathSegments.first == libName) ||
        (to.scheme == 'asset' && fileUri.scheme != 'package')) {
      if (fileUri.path == to.path) {
        return fileUri.pathSegments.last;
      } else {
        return p.posix
            .relative(fileUri.path, from: to.path)
            .replaceFirst('../', '');
      }
    } else {
      return path;
    }
  }

  static String? resolveAssetImport(String? path) {
    if (path == null) {
      return null;
    }
    final fileUri = Uri.parse(path);
    if (fileUri.scheme == "asset") {
      return "/${fileUri.path}";
    }
    return path;
  }
}
