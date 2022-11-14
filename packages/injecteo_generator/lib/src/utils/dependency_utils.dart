import 'package:injecteo_models/injecteo_models.dart';

Set<DependencyConfig> sortDependencies(
  List<DependencyConfig> dependencyConfigs,
) {
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
        final alreadySorted = findDependencyConfigWithNoEnvOrHasAny(
              dependency,
              sorted,
              dep.environments,
            ) !=
            null;

        if (alreadySorted) {
          return true;
        }

        final notInUnsorted = findDependencyConfigWithNoEnvOrHasAny(
              dependency,
              unSorted,
              dep.environments,
            ) ==
            null;
        return notInUnsorted;
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
  final config = findDependencyConfig(dependency, dependencyConfigs);
  if (config == null) {
    return false;
  }

  if (config.isAsync && !config.preResolve) {
    return true;
  }

  return hasAsyncDependency(config, dependencyConfigs);
}

bool hasAsyncDependency(
  DependencyConfig dependencyConfig,
  Set<DependencyConfig> dependencyConfigs,
) {
  for (final dep in dependencyConfig.dependencies) {
    final config = findDependencyConfig(dep, dependencyConfigs);

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

Set<DependencyConfig> findDepsMatchingTypeAndName(
  InjectedDependency dep,
  Iterable<DependencyConfig> dependencyConfigs,
) {
  return dependencyConfigs
      .where(
        (d) => d.type == dep.type && d.instanceName == dep.instanceName,
      )
      .toSet();
}

DependencyConfig? findDependencyConfig(
  InjectedDependency dep,
  Set<DependencyConfig> dependencyConfigs,
) {
  try {
    return findDepsMatchingTypeAndName(dep, dependencyConfigs).first;
  } catch (e) {
    return null;
  }
}

DependencyConfig? findDependencyConfigWithNoEnvOrHasAny(
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

bool hasPreResolvedDependencies(Set<DependencyConfig> dependencyConfigs) {
  return dependencyConfigs.any((d) => d.isAsync && d.preResolve);
}

bool moduleHasOverrides(Iterable<DependencyConfig> dependencyConfigs) {
  return dependencyConfigs.where((d) => d.externalModuleConfig?.isAbstract == true).any(
        (d) => d.dependencies.isNotEmpty == true,
      );
}
