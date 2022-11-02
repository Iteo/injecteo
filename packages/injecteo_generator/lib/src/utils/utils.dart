import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';

String capitalize(String s) {
  if (s.length < 2) {
    return s.toUpperCase();
  }
  return s[0].toUpperCase() + s.substring(1);
}

String toCamelCase(String s) {
  if (s.length < 2) {
    return s.toLowerCase();
  }
  return s[0].toLowerCase() + s.substring(1);
}

// ignore: avoid_positional_boolean_parameters
void throwIf(bool condition, String message, {Element? element}) {
  if (condition) {
    throw InvalidGenerationSourceError(
      message,
      element: element,
    );
  }
}

extension IterableExtenstion<E> on Iterable<E> {
  E? firstOrNull(
    bool Function(
      E element,
    )
        test,
  ) {
    for (final e in this) {
      if (test(e)) {
        return e;
      }
    }
    return null;
  }
}
