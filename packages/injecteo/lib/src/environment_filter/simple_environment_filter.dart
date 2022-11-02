import 'package:injecteo/src/environment_filter/environment_filter.dart';

typedef EnvironmentFilterFunc = bool Function(Set<String>);

///  A simple filter that can be used directly for simple use cases without having to extend the base [EnvironmentFilter]
///
class SimpleEnvironmentFilter extends EnvironmentFilter {
  const SimpleEnvironmentFilter({
    required this.filter,
    Set<String> environments = const {},
  }) : super(environments);

  final EnvironmentFilterFunc filter;

  @override
  bool canRegister(Set<String> depEnvironments) => filter(depEnvironments);
}
