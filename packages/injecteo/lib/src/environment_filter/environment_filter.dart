/// To filter if dependency should be registered
///
abstract class EnvironmentFilter {
  const EnvironmentFilter(this.environments);
  final Set<String> environments;

  /// Function is called before every registration call,
  /// if returns true, the dependency will be registered
  /// otherwise, it will be ignored
  bool canRegister(Set<String> envs);
}
