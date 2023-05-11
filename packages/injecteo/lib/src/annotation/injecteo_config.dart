/// Marks a top-level function as a config function
///
class InjecteoConfig {
  const InjecteoConfig({
    this.preferRelativeImports = false,
    this.configFunctionName = r'$injecteoConfig',
  });

  /// Use relative imports
  ///
  final bool preferRelativeImports;

  /// Generated configuration function name
  ///
  final String configFunctionName;
}

const injecteoConfig = InjecteoConfig();
