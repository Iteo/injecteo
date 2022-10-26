/// Marks a top-level function as an initializer function
///
class DiInitialize {
  const DiInitialize({
    this.preferRelativeImports = true,
    this.initializerName = r'$diInitialize',
  });

  /// Use relative imports
  ///
  final bool preferRelativeImports;

  /// Generated initializer function name
  ///
  final String initializerName;
}

const diInitiaize = DiInitialize();
