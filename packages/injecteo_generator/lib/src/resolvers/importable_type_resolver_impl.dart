import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:injecteo_models/injecteo_models.dart';

import 'importable_type_resolver.dart';

class ImportableTypeResolverImpl extends ImportableTypeResolver {
  ImportableTypeResolverImpl(this.libs);
  final List<LibraryElement> libs;

  @override
  String? resolveImport(Element? element) {
    if (element?.source == null || _isCoreDartType(element)) {
      return null;
    }

    for (final lib in libs) {
      final libraryExportContainsElement = !_isCoreDartType(lib) &&
          lib.exportNamespace.definedNames.values.contains(element);

      if (libraryExportContainsElement) {
        return lib.identifier;
      }
    }
    return null;
  }

  bool _isCoreDartType(Element? element) {
    return element?.source?.fullName == 'dart:core';
  }

  @override
  ImportableType resolveFunctionType(
    FunctionType type, [
    ExecutableElement? executableElement,
  ]) {
    final functionElement =
        executableElement ?? type.element ?? type.alias?.element;
    if (functionElement == null) {
      throw 'Can not resolve function type \nTry using an alias e.g typedef MyFunction = ${type.getDisplayString(withNullability: false)};';
    }
    final displayName = functionElement.displayName;
    var functionName = displayName;

    Element elementToImport = functionElement;
    final enclosingElement = functionElement.enclosingElement;

    if (enclosingElement != null && enclosingElement is ClassElement) {
      functionName = '${enclosingElement.displayName}.$displayName';
      elementToImport = enclosingElement;
    }

    return ImportableType(
      name: functionName,
      import: resolveImport(elementToImport),
      isNullable: type.nullabilitySuffix == NullabilitySuffix.question,
    );
  }

  @override
  ImportableType resolveType(DartType type) {
    return ImportableType(
      name: type.element?.name ??
          type.getDisplayString(
            withNullability: false,
          ),
      isNullable: type.nullabilitySuffix == NullabilitySuffix.question,
      import: resolveImport(type.element),
      typeArguments: _resolveTypeArguments(type),
    );
  }

  List<ImportableType> _resolveTypeArguments(DartType typeToCheck) {
    final importableTypes = <ImportableType>[];
    if (typeToCheck is ParameterizedType) {
      for (final type in typeToCheck.typeArguments) {
        if (type.element is TypeParameterElement) {
          importableTypes.add(const ImportableType(name: 'dynamic'));
        } else {
          final name = type.element?.name ??
              type.getDisplayString(withNullability: false);
          final import = resolveImport(type.element);
          importableTypes.add(
            ImportableType(
              name: name,
              import: import,
              isNullable: type.nullabilitySuffix == NullabilitySuffix.question,
              typeArguments: _resolveTypeArguments(type),
            ),
          );
        }
      }
    }
    return importableTypes;
  }
}
