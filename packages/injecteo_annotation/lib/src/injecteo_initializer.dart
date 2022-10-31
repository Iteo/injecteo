/// Marks a top-level function as an initializer function
///
class InjecteoInitializer {
  const InjecteoInitializer({
    this.preferRelativeImports = true,
    this.initializerName = r'$injecteoInitializer',
  });

  /// Use relative imports
  ///
  final bool preferRelativeImports;

  /// Generated initializer function name
  ///
  final String initializerName;
}

const injecteoInitializer = InjecteoInitializer();
