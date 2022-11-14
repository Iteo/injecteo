/// Marks a top-level function as an config function
///
class InjecteoConfig {
  const InjecteoConfig({
    this.preferRelativeImports = true,
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
