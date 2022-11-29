
<div align="center">

<h1>injecteo</h1>

[![melos](https://img.shields.io/badge/maintained%20with-melos-f700ff.svg?style=flat-square)](https://github.com/invertase/melos)
&nbsp;
[![Test status](https://github.com/Iteo/injecteo/workflows/Build/badge.svg)](https://github.com/Iteo/injecteo/actions/workflows/build.yml)
&nbsp;
[![pub package](https://img.shields.io/pub/v/injecteo)](https://pub.dartlang.org/packages/injecteo)
&nbsp;
[![GitHub license](https://img.shields.io/badge/licence-MIT-green)](https://github.com/Iteo/injecteo/blob/master/packages/injecteo/LICENSE)
&nbsp;

</div>

---

Nice to see you here, dear Developer. This is a root of `injecteo` service locator / dependency injection generator project.\
Repository contains several folders:

- packages
  - `injecteo`: Dependency Injection annotations (@singleton, @inject, @InjectionModule, @externalModule),
  abstract class for `ServiceLocator` pattern and the implementation using `get_it` package
  - `injecteo_generator`: Actual code generator which scans project for `injecteo` annotations and generate top-level configuration function with additional `InjectionModule` classes
  - `injecteo_models`: Internal models used by generator. Represents `DependencyConfig` with required properties like:\
  import name, type and implementation definition

- example
  - `basic`: Simple counter app, which shows how to annotate classes for `injecteo_generator` and configure dependencies
  - `feature_packages`: Focuses on `InjectionModule` - a way to split features into multiple packages and integrate them with `Melos`
  - `todeo`: Advanced to-do application with multiple dependencies registered for `dev` and `prod` environments.

For details, please see each folder README files.

## Development

Packages use Melos with `usePubspecOverrides: true`.\
Local packages are linked via Melos-generated `pubspec_overrides.yaml`.

```sh
melos bs
melos run get
melos run generate
melos run format
```

Before commit

```sh
melos run format
melos run test
```
