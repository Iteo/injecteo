# Change Log

All notable changes to this project will be documented in this file.
See [Conventional Commits](https://conventionalcommits.org) for commit guidelines.

## 2022-11-24

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`injecteo_models` - `v1.0.0`](#injecteo_models---v100)
 - [`injecteo_generator` - `v1.0.1`](#injecteo_generator---v101)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `injecteo_generator` - `v1.0.1`

---

#### `injecteo_models` - `v1.0.0`

 - Bump "injecteo_models" to `1.0.0`.


## 2022-11-24

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`injecteo_generator` - `v1.0.0`](#injecteo_generator---v100)

---

#### `injecteo_generator` - `v1.0.0`

 - Bump "injecteo_generator" to `1.0.0`.


## 2022-11-24

### Changes

---

Packages with breaking changes:

 - [`injecteo` - `v1.0.0`](#injecteo---v100)
 - [`injecteo_generator` - `v0.1.0`](#injecteo_generator---v010)
 - [`injecteo_models` - `v0.1.0`](#injecteo_models---v010)

Packages with other changes:

 - There are no other changes in this release.

---

#### `injecteo` - `v1.0.0`

 - **FIX**: Update test expected outputs because some parameters were removed.
 - **FEAT**: Combine test coverage report.
 - **FEAT**: Register singleton instance by executing factory.
 - **FEAT**: Support external module (dependency) registration.
 - **FEAT**: Generator with env filters.
 - **FEAT**: Initial generator files.
 - **FEAT**: Initial setup.
 - **BREAKING** **FIX**: Skip register of abstract class in InjectionModule.
 - **BREAKING** **FEAT**: Generate injection modules with correct assignments.
 - **BREAKING** **FEAT**: Generate injection module classes.
 - **BREAKING** **CHORE**: Remove empty @named annotation.
 - **BREAKING** **CHORE**: Remove annotation package and move to injecteo package.

#### `injecteo_generator` - `v0.1.0`

 - **REFACTOR**: Remove unnecessary assignment of library.classes.
 - **REFACTOR**: Use file path built on parts in test.
 - **FIX**: Lint errors.
 - **FIX**: Update test expected outputs because some parameters were removed.
 - **FIX**: Generate async function, if async or has async dependencies.
 - **FIX**: Avoid generate duplicated external module definition.
 - **FEAT**: Support external module (dependency) registration.
 - **FEAT**: Generator with env filters.
 - **FEAT**: Initial generator files.
 - **FEAT**: Initial setup.
 - **BREAKING** **FIX**: Skip register of abstract class in InjectionModule.
 - **BREAKING** **FEAT**: Require InjectionModuleConfig definition in order to properly generate classes.
 - **BREAKING** **FEAT**: Generate injection modules with correct assignments.
 - **BREAKING** **FEAT**: Generate injection module classes.
 - **BREAKING** **CHORE**: Make generator functions public to test them.
 - **BREAKING** **CHORE**: Remove annotation package and move to injecteo package.
 - **BREAKING** **CHORE**: Remove signalsReady and dependsOn properties.
 - **BREAKING** **CHORE**: Remove return of ServiceLocator from initializer.
 - **BREAKING** **CHORE**: Split configuration models into separate files.

#### `injecteo_models` - `v0.1.0`

 - **FIX**: Avoid generate duplicated external module definition.
 - **BREAKING** **FEAT**: Require InjectionModuleConfig definition in order to properly generate classes.
 - **BREAKING** **FEAT**: Generate injection module classes.
 - **BREAKING** **CHORE**: Remove signalsReady and dependsOn properties.

