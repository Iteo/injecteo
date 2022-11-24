## 1.0.1

 - Update a dependency to the latest release.

## 1.0.0

 - Bump "injecteo_generator" to `1.0.0`.

## 0.1.0

> Note: This release has breaking changes.

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

