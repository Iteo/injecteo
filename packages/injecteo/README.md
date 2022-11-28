# Injecteo

Convinient way to establish dependency injection configuration using Service Locator pattern.

## Contents

<!-- pub.dev accepts anchors only with lowercase -->

- [Injecteo](#injecteo)
- [Contents](#contents)
- [Why injecteo](#why-injecteo)
- [Motivation](#motivation)
- [Setup](#setup)
- [Annotations](#annotations)
  - [@injecteoConfig](#injecteoconfig)
  - [@InjectionModule](#injectionmodule)
  - [@externalModule](#externalmodule)
  - [@singleton](#singleton)
  - [@disposeMethod](#disposemethod)
  - [@inject](#inject)
  - [@factoryMethod](#factorymethod)
  - [@Named](#named)
  - [@preResolve](#preresolve)
  - [@Environment](#environment)
- [Troubleshooting](#troubleshooting)
- [Contributions](#contributions)

## Why injecteo

Thanks to the annotations, you are able to easily mark classes which needs to behave as dependencies. In your application, you might need access Singleton or Factory instance in order to eliminate tight coupling between classes. *injecteo* solves that problem, providing dependency configuration generator [injecteo_generator].

## Motivation

Library follows principles of [get_it], widely known and commonly used *Service Locator* package. Instead of manual registration required by `getIt`, *injecteo* provides generator inspired by [injectable].

The additional benefits are:

- Abstract `ServiceLocator` interface - you may implement your own SL, if you have an idea requiring custom implementation
- `GetItServiceLocator` - wrapper for [get_it] so you can use already known Service Locator out of the box
- `ServiceLocatorHelper` which guards dependency registration for certain environemnts (e.g. dev only or different service implementation for production usage)

## Setup

Install package and generator

```sh
flutter pub add injecteo
flutter pub add --dev injecteo_generator
```

Or manually add the dependency in `pubspec.yaml`

```yaml
dependencies:
  injecteo:

dev_dependencies:
  injecteo_generator:
```

Annotate the classes and run generator (build or watch)

```sh
flutter run build_runner build
```

Call the generated `$configureInjecteo` function (from `.config.dart` file) which registers the dependencies you annotated in a project. Follow simple steps (or copy&paste code below):

1) Create a new file and define global `ServiceLocator` instance (use `GetItServiceLocator.instance` until you do not need custom solution)
2) Define a top-level function and annotate with `@injecteoConfig`
3) Call the generated `$injecteoConfig` initializer
4) Call top-level function before running the App

### Ready to use snippet

```dart
import 'package:injecteo/injecteo.dart';

import 'di.config.dart';

final sl = GetItServiceLocator.instance;

@injecteoConfig
Future<void> configureDependencies(String env) => $injecteoConfig(
    sl,
    environment: env,
);
```

## Annotations

### @injecteoConfig

Marks a top-level function as a config function. You should annotate single top-level function which you'd like to use as initializer. Generator search for that function and generate registration of all the project `InjectionModules` with their dependencies inside. Remember to import `.config.dart` file which exposes generated function with name you defined (parameter: `configFunctionName` or default: `$injecteoConfig`).

| Parameter             | Type   | Description                                                   | Example            |
| --------------------- | ------ | ------------------------------------------------------------- | ------------------ |
| preferRelativeImports | bool   | If generated imports should be relative (default) or absolute | true               |
| configFunctionName    | String | Name of the generated configure function                      | $configureInjecteo |

### @InjectionModule

Main idea of `InjectionModule` is to separate dependency registration of logically connected classes. Imagine a scenario you would like to group a set of classes which belongs to the certain feature (e.g: Authorization). With `InjectionModule` it's now possible: you will have `AuthorizationInjectionModule` class with its own `registerDependencies` method. It gives you a possibility to conditionally register some modules in `main` entrypoint, before app starts.

| Parameter | Type   | Description                 | Example             |
| --------- | ------ | --------------------------- | ------------------- |
| name      | String | Name of the generated class | AuthInjectionModule |

#### **Example**

Create a const variable and give your module meaningful name. That variable would be your new annotation. Annotate all the classes which belong to certain `InjectionModule` and run the generator. You will notice that new class appeared in `di.config` file.

If your project benefits from multi-package structure (for example: [melos]), just export the generated class from a feature package. Then, you can use injection module instance to register module dependencies in main file (see `example/feature_packages` folder)

```dart
const counterInjectionModule = InjectionModule(name: "CounterInjectionModule");

@singleton
@counterInjectionModule
class CounterDataSource {
  /// ...
}
```

##### *Generated result*

```dart
class CounterInjectionModule extends _i1.BaseInjectionModule {
  @override
  void registerDependencies(
   /// ...
  }) {
    /// ...
    serviceLocatorHelper.registerSingleton<CounterDataSource>(
        () => CounterDataSource());
  }
}
```

### @externalModule

`ExternalModule` is useful for registration of the dependencies you do not own. Let's say your app is using some 3rd party dependency like  `SharedPreferences` or some fancy `Logger`.

Classes you create (for example: `StorageRepository`) want to use that external dependency. In such case, it's best to provide them externally, instead of tight coupling.

Wrap an external dependencies in `ExternalModule` and configure the environments you want to be available.

Let's consider  `MyFancyLogger` example. We want to register 3rd party (Fimber) `LogTree` object to be injected via `MyFancyLogger(LogTree logTree)` constructor. We need to define a class which gives access to the external type instance:

#### **Example**

```dart
@externalModule
abstract class LoggerConfig {

  @dev
  LogTree get debugLogTree => DebugTree(useColors: true);

  @prod
  LogTree get prodLogTree => DebugTree(
        useColors: true,
        logLevels: ["W", "E"],
      );
}
```

##### *Generated result*

```dart
final loggerConfig = _$LoggerConfig();
serviceLocatorHelper.registerFactory<LogTree>(
  () => loggerConfig.debugLogTree,
  registerFor: {_dev},
);
serviceLocatorHelper.registerFactory<LogTree>(
  () => loggerConfig.prodLogTree,
  registerFor: {_prod},
);
serviceLocatorHelper.registerSingleton<Logger>(
    () => Logger(serviceLocator.get<LogTree>()));
```

### @singleton

Sometimes it's crucial to have exactly one instance. For example, you only want one instance of a class that represents a local storage to avoid being out of sync. Use the `@singleton` or `@Singleton(as: ..., env: ...)` to annotate yout singleton classes.

| Parameter | Type           | Description                                          | Example                |
| --------- | -------------- | ---------------------------------------------------- | ---------------------- |
| as        | Type?          | Abstract type to be registered                       | AbstractAuthRepository |
| env       | List\<String>? | Environment in which singleton should be registered. | [dev]                  |
| dispose   | Function?      | Dispose callback                                     |                        |

#### **Example**

```dart
@Singleton(as: HelloRepository)
class HelloRepositoryImpl implements HelloRepository {
  /// ...
}
```

##### *Generated result*

```dart
serviceLocatorHelper.registerSingleton<HelloRepository>(() =>
        HelloRepositoryImpl());
```

### @disposeMethod

[get_it] provides a way to dispose singleton instances by passing a dispose callback to the register function. There are two ways of annotating `dispose` method.

#### Annotate a method inside singleton class with `@disposeMethod`

  ```dart
  @singleton
  class DataSource {

    @disposeMethod
    void dispose(){
      // logic to dispose instance
    }
  }
  ```

#### Pass a reference to a dispose function within `@Singleton` annotation

  ```dart
  @Singleton(dispose: externalDisposeCallback)
  class DataSource {
    void dispose() {
    }
  }

  /// dispose function signature must match Function(T instance)
  FutureOr externalDisposeCallback(DataSource instance) {
    instance.dispose();
  }
  ```

### @inject

Factories occur in almost every project. Every time you need an instance of given `Type`, the `ServiceLocator` will create an instance for you. Annotate every class which should behave as factory with `@inject` and your are done.\
Use `@Inject(as: ...)` to bind abstract class to their implementation.

| Parameter | Type           | Description                                        | Example                |
| --------- | -------------- | -------------------------------------------------- | ---------------------- |
| as        | Type?          | Abstract type to be registered                     | AbstractAuthRepository |
| env       | List\<String>? | Environment in which factory should be registered. | [dev]                  |

#### **Example**

```dart
@inject
class HelloDataSource {
  /// ...
}

```

##### *Generated result*

```dart
serviceLocatorHelper
    .registerFactory<HelloDataSource>(() => HelloDataSource());
```

### @factoryMethod

`@factoryMethod` is an annotation which tells `injecteo` that other method should be used to create the dependency. That includes: named constructors, factory constructors and static create method. An instance may require `async` creation - so create static `async` initializer and tell `injecteo` that annotate it with `@factoryMethod`.

#### **Example**

```dart
@inject
@userInjectionModule
class UserInfoProvider {
  UserInfoProvider(
    this.userInfo,
  );

  final UserInfo userInfo;

  @factoryMethod
  static Future<UserInfoProvider> create(UserDataSource userDataSource) async {
    // some additional async work that takes time
    final userInfo = await userDataSource.fetch();
    return UserInfoProvider(userInfo);
  }
}

@singleton
@userInjectionModule
class UserDataSource {
  Future<UserInfo> fetch() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return UserInfo(
      "John",
      "Flutter Developer",
    );
  }
}
```

##### *Generated result*

```dart
serviceLocatorHelper
        .registerSingleton<_i11.UserDataSource>(() => _i11.UserDataSource());

serviceLocatorHelper.registerFactoryAsync<_i11.UserInfoProvider>(() async =>
        _i11.UserInfoProvider.create(
            serviceLocator.get<_i11.UserDataSource>()));
```

### @Named

Use `@Named` (tag) to register instances referenced by name. Example use-case : when multiple implementations of some abstract `Service` are required.

#### **Example**

```dart
@Named("impl1")
@Inject(as: HelloService)
class HelloServiceFirstImpl implements HelloService {
  @override
  String sayHello() {
    return 'Hello from first implementation';
  }
}

@Named("impl2")
@Inject(as: HelloService)
class HelloServiceSecondImpl implements HelloService {
  @override
  String sayHello() {
    return 'Hello from second implementation';
  }
}

@Singleton(as: HelloRepository)
class HelloRepositoryImpl implements HelloRepository {
  HelloRepositoryImpl(@Named('impl1') this.helloService);

  final HelloService helloService;

  @override
  Future<String> hello() async {
    return helloService.sayHello();
  }
}
```

##### *Generated result*

```dart
serviceLocatorHelper.registerFactory<_i2.HelloService>(
  () => _i3.HelloServiceFirstImpl(),
  instanceName: 'impl1',
);
serviceLocatorHelper.registerFactory<_i2.HelloService>(
  () => _i3.HelloServiceSecondImpl(),
  instanceName: 'impl2',
);
serviceLocatorHelper.registerSingleton<_i5.HelloRepository>(() =>
    _i3.HelloRepositoryImpl(
        serviceLocator.get<_i2.HelloService>(instanceName: 'impl1')));
```

Next annotate the injected instance with @Named() right in the constructor and pass in the name of the desired implementation.

### @preResolve

Some dependencies require asynchronus initialization. Typically, 3rd party modules return `Future<ThirdPartyType>`. Before using such dependency, it's useful to wait for initialization complete. Annotate member with `@preResolve`. One of the common example is `SharedPreferences` which needs pre-initialization before first usage:

#### **Example**

```dart
@externalModule
abstract class StorageModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
```

##### *Generated result*

```dart
await serviceLocatorHelper.registerFactoryAsync<_i4.SharedPreferences>(
    () async => storageModule.prefs,
    preResolve: true,
);
```

Pay attention that using `@preResolve` generates `async` `registerDependencies` method. It means you should `await` the `injecteoConfig` function before starting the app.

### @Environment

Environment annotation let's you register some dependencies only for selected environment(s). It's a common scenario that you would like to provide different API base url (or Firebase configuration) for different environments. You can use predefined annotations: `@dev`, `@test`, `@prod` or create own using `const customEnv = Environment('customEnvName')`

#### **Important**

Remember to pass an environment variable to `configureInjecteo` function. That will create a simple environment filter which check if dependency should be available.

You can also implement own `EnvironmentFilter` to decide which dependencies to register.

#### **Example**

```dart
@externalModule
abstract class ApiConfig {
  @dev
  String get devApiUrl => "https://iteo.com";

  @prod
  String get prodApiUrl => "https://iteo.com";
}
```

##### **Result**

```dart
serviceLocatorHelper.registerFactory<String>(
  () => apiConfig.devApiUrl,
  registerFor: {_dev},
);
serviceLocatorHelper.registerFactory<String>(
  () => apiConfig.prodApiUrl,
  registerFor: {_prod},
);
```

## Troubleshooting

Make sure you saved the files before running the generator. If you have conflicts or errors in generated file, try to clean and rebuild.

```sh
flutter pub run build_runner clean
```

## Contributions

We accept any contribution to the project!

Suggestions of a new feature or fix should be created via pull-request or issue.

<a href="https://github.com/iteo/injecteo/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=iteo/injecteo" />
</a>

[melos]: https://melos.invertase.dev
[injecteo_generator]: https://pub.dev/packages/injecteo_generator
[get_it]: https://pub.dev/packages/get_it
[injectable]: https://pub.dev/packages/injectable
