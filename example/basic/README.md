# injecteo

Example how to use injecteo in Flutter app

## Description

This example use injecteo as dependency injection engine.

Injecteo scan the library files and generate `di.config.dart` file which contains several modules (Counter, Logger).

Before app start, there is a  `configureDependencies` call with given environment to properly configure Service Locator.

Then, app uses `ServiceLocator.get<T>` to provide you registered dependencies.

## Run

In order to run example, get packages, run build_runner (which triggers injecteo_generator to generate dependency injection config).
After that, run sample application with selected environment

```sh
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run -t lib/main_dev.dart
```
