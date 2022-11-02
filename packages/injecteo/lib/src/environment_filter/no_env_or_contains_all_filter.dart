import 'package:injecteo/src/environment_filter/environment_filter.dart';

/// This filter validates dependencies with no environment keys, or containing all of the provided [environments]
///
class NoEnvOrContainsAllFilter extends EnvironmentFilter {
  const NoEnvOrContainsAllFilter(super.environments);

  @override
  bool canRegister(Set<String> envs) {
    return (envs.isEmpty) || envs.containsAll(environments);
  }
}
