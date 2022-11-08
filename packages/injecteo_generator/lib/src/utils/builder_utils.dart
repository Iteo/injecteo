import 'package:code_builder/code_builder.dart';
import 'package:injecteo_generator/src/model/dependency_config.dart';
import 'package:injecteo_generator/src/model/importable_type.dart';
import 'package:injecteo_generator/src/model/injected_dependency.dart';
import 'package:injecteo_generator/src/resolvers/import_path_resolver.dart';

Set<DependencyConfig> sortDependencies(List<DependencyConfig> deps) {
  // sort dependencies alphabetically
  deps.sort((a, b) => a.type.name.compareTo(b.type.name));
  // sort dependencies by their register order
  final Set<DependencyConfig> sorted = {};
  _sortByDependents(deps.toSet(), sorted);
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
        if (lookupDependencyWithNoEnvOrHasAny(
              dependency,
              sorted,
              dep.environments,
            ) !=
            null) {
          return true;
        }
        // if dep is in unSorted we skip it in this iteration, if not we include it
        return lookupDependencyWithNoEnvOrHasAny(
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
  Set<DependencyConfig> allDeps,
) {
  final dep = lookupDependency(dependency, allDeps);
  if (dep == null) {
    return false;
  }

  if (dep.isAsync && !dep.preResolve) {
    return true;
  }

  return hasAsyncDependency(dep, allDeps);
}

bool hasAsyncDependency(DependencyConfig dep, Set<DependencyConfig> allDeps) {
  for (final dependency in dep.dependencies) {
    final config = lookupDependency(dependency, allDeps);

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
    if (hasAsyncDependency(config, allDeps)) {
      return true;
    }
  }
  return false;
}

DependencyConfig? lookupDependency(
  InjectedDependency dependency,
  Set<DependencyConfig> allDeps,
) {
  try {
    return allDeps.firstWhere(
      (d) =>
          d.type == dependency.type &&
          d.instanceName == dependency.instanceName,
    );
  } catch (e) {
    return null;
  }
}

DependencyConfig? lookupDependencyWithNoEnvOrHasAny(
  InjectedDependency dependency,
  Set<DependencyConfig> allDeps,
  List<String> envs,
) {
  try {
    return allDeps.firstWhere(
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

Set<DependencyConfig> lookupPossibleDeps(
  InjectedDependency dependency,
  Iterable<DependencyConfig> allDeps,
) {
  return allDeps
      .where(
        (d) =>
            d.type == dependency.type &&
            d.instanceName == dependency.instanceName,
      )
      .toSet();
}

bool hasPreResolvedDependencies(Set<DependencyConfig> deps) {
  return deps.any((d) => d.isAsync && d.preResolve);
}

Reference typeRefer(
  ImportableType importableType, [
  Uri? targetFile,
]) {
  final relativeImportUrl = targetFile == null
      ? ImportPathResolver.resolveAssetImport(importableType.import)
      : ImportPathResolver.relative(importableType.import, targetFile);

  return TypeReference(
    (reference) {
      reference
        ..symbol = importableType.name
        ..url = relativeImportUrl
        ..isNullable = importableType.isNullable;
      if (importableType.typeArguments.isNotEmpty) {
        reference.types.addAll(
          importableType.typeArguments.map(
            (e) => typeRefer(
              e,
              targetFile,
            ),
          ),
        );
      }
    },
  );
}
