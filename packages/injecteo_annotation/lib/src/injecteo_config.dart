/// Marks a top-level function as an config function
///
class InjecteoConfig {
  const InjecteoConfig({
    this.preferRelativeImports = true,
    this.initializerName = r'$injecteoConfig',
  });

  /// Use relative imports
  ///
  final bool preferRelativeImports;

  /// Generated initializer function name
  ///
  final String initializerName;
}

const injecteoConfig = InjecteoConfig();
