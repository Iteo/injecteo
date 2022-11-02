import 'package:injecteo/src/environment_filter/environment_filter.dart';

/// This filter validates dependencies with no environment keys or containing the provided [environment]
///
class NoEnvOrContainsFilter extends EnvironmentFilter {
  NoEnvOrContainsFilter(
    String? environment,
  ) : super({if (environment != null) environment});

  @override
  bool canRegister(Set<String> envs) {
    return (envs.isEmpty) || envs.contains(environments.first);
  }
}
