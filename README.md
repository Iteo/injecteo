Nice to see you here, dear Developer. This is a root of `injecteo` service locator / dependency injection generator project. It contains several folders:

- example
  - basic: Simple counter app, which shows how to annotate classes for `injecteo_generator` and configure dependencies 
  - feature_packages: Focuses on `InjectionModule` - a way to split features into multiple packages and integrate them with `Melos`
  - todeo: Advanced to-do application with multiple dependnecies registered for `dev` and `prod` environments. 
- packages
  - `injecteo`: Dependnecy Injection annotations (@singleton, @inject, @InjectionModule, @externalModule), abstract class for `ServiceLocator` pattern and the implementation using `get_it` package
  - `injecteo_generator`: Actual code generator which scans project for `injecteo` annotations and generate top-level configuration function with additional `InjectionModule` classes
  - `injecteo_models`: Internal models used by generator. Represents `DependencyConfig` with required properties like: import name, type and implementation definition

For details, please see each folder README files. 