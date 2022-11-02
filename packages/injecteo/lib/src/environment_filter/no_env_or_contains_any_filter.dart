import 'package:injecteo/src/environment_filter/environment_filter.dart';

/// This filter validates dependencies with no environment keys, or containing one of the provided [environments]
///
class NoEnvOrContainsAnyFilter extends EnvironmentFilter {
  const NoEnvOrContainsAnyFilter(super.environments);

  @override
  bool canRegister(Set<String> envs) {
    return (envs.isEmpty) || envs.intersection(environments).isNotEmpty;
  }
}
