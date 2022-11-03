import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:injecteo_generator/src/model/models.dart';

abstract class ImportableTypeResolver {
  String? resolveImport(Element element);

  ImportableType resolveType(DartType type);

  ImportableType resolveFunctionType(
    FunctionType function, [
    ExecutableElement? executableElement,
  ]);
}
