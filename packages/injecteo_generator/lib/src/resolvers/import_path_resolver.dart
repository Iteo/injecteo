// ignore_for_file: avoid_classes_with_only_static_members
import 'package:path/path.dart' as p;

abstract class ImportPathResolver {
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
