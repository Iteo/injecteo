import 'package:injecteo_models/injecteo_models.dart';

Set<DependencyConfig> sortDependencies(
    List<DependencyConfig> dependencyConfigs) {
  // sort dependencies alphabetically
  dependencyConfigs.sort((a, b) => a.type.name.compareTo(b.type.name));
  // sort dependencies by their register order
  final Set<DependencyConfig> sorted = {};
  _sortByDependents(dependencyConfigs.toSet(), sorted);
  return sorted;
}

void _sortByDependents(
  Set<DependencyConfig> unSorted,
  Set<DependencyConfig> sorted,
) {
  for (final dep in unSorted) {
    if (dep.dependencies.every(
      (dependency) {
        // if dep is already in sorted return true
        if (findDependencyWithNoEnvOrHasAny(
              dependency,
              sorted,
              dep.environments,
            ) !=
            null) {
          return true;
        }
        // if dep is in unSorted we skip it in this iteration, if not we include it
        return findDependencyWithNoEnvOrHasAny(
              dependency,
              unSorted,
              dep.environments,
            ) ==
            null;
      },
    )) {
      sorted.add(dep);
    }
  }
  if (unSorted.isNotEmpty) {
    _sortByDependents(unSorted.difference(sorted), sorted);
  }
}

bool isAsyncOrHasAsyncDependency(
  InjectedDependency dependency,
  Set<DependencyConfig> dependencyConfigs,
) {
  final dep = findDependency(dependency, dependencyConfigs);
  if (dep == null) {
    return false;
  }

  if (dep.isAsync && !dep.preResolve) {
    return true;
  }

  return hasAsyncDependency(dep, dependencyConfigs);
}

bool hasAsyncDependency(
  DependencyConfig dependencyConfig,
  Set<DependencyConfig> dependencyConfigs,
) {
  for (final dep in dependencyConfig.dependencies) {
    final config = findDependency(dep, dependencyConfigs);

    // If the dependency corresponding to the InjectedDependency couldn't be
    // found, this probably indicates there is a missing dependency.
    if (config == null) {
      continue;
    }

    // Ultimately, this is what we're looking for:
    if (config.isAsync && !config.preResolve) {
      return true;
    }

    // If the dependency itself isn't async, check to see if any of *its*
    // dependencies are async.
    if (hasAsyncDependency(config, dependencyConfigs)) {
      return true;
    }
  }
  return false;
}

DependencyConfig? findDependency(
  InjectedDependency dep,
  Set<DependencyConfig> dependencyConfigs,
) {
  try {
    return findPossibleDeps(dep, dependencyConfigs).first;
  } catch (e) {
    return null;
  }
}

DependencyConfig? findDependencyWithNoEnvOrHasAny(
  InjectedDependency dependency,
  Set<DependencyConfig> dependencyConfigs,
  List<String> envs,
) {
  try {
    return dependencyConfigs.firstWhere(
      (d) =>
          d.type == dependency.type &&
          d.instanceName == dependency.instanceName &&
          (d.environments.isEmpty ||
              envs.isEmpty ||
              d.environments.any(
                (e) => envs.contains(e),
              )),
    );
  } catch (e) {
    return null;
  }
}

Set<DependencyConfig> findPossibleDeps(
  InjectedDependency dep,
  Iterable<DependencyConfig> dependencyConfigs,
) {
  return dependencyConfigs
      .where(
        (d) => d.type == dep.type && d.instanceName == dep.instanceName,
      )
      .toSet();
}

bool hasPreResolvedDependencies(Set<DependencyConfig> deps) {
  return deps.any((d) => d.isAsync && d.preResolve);
}
