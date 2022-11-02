import 'package:injecteo/src/environment_filter/environment_filter.dart';
import 'package:injecteo/src/environment_filter/no_env_or_contains_filter.dart';
import 'package:injecteo/src/service_locator.dart';
import 'package:injecteo/src/typedefs.dart';

const kEnvironmentsName = '__environments__';

class ServiceLocatorHelper {
  ServiceLocatorHelper(
    this._serviceLocator, [
    String? environment,
    EnvironmentFilter? environmentFilter,
  ])  : assert(environment == null || environmentFilter == null),
        _environmentFilter =
            environmentFilter ?? NoEnvOrContainsFilter(environment) {
    if (!_serviceLocator.isRegistered<Set<String>>(
      instanceName: kEnvironmentsName,
    )) {
      _serviceLocator.registerLazySingleton<Set<String>>(
        () => _environmentFilter.environments,
        instanceName: kEnvironmentsName,
      );
    }
  }
  final ServiceLocator _serviceLocator;
  final EnvironmentFilter _environmentFilter;

  bool _canRegister(Set<String>? registerFor) {
    return _environmentFilter.canRegister(registerFor ?? {});
  }

  void registerFactory<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
    Set<String>? registerFor,
  }) {
    if (_canRegister(registerFor)) {
      _serviceLocator.registerFactory(
        factoryFunc,
        instanceName: instanceName,
      );
    }
  }

  Future<void> registerFactoryAsync<T extends Object>(
    FactoryFuncAsync<T> factoryfunc, {
    String? instanceName,
    bool preResolve = false,
    Set<String>? registerFor,
  }) {
    if (_canRegister(registerFor)) {
      if (preResolve) {
        return factoryfunc().then(
          (instance) => registerFactory(
            () => instance,
            instanceName: instanceName,
          ),
        );
      } else {
        _serviceLocator.registerFactoryAsync(
          factoryfunc,
          instanceName: instanceName,
        );
      }
    }
    return Future.value();
  }

  void registerLazySingleton<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
    Set<String>? registerFor,
    DisposeFunc<T>? dispose,
  }) {
    if (_canRegister(registerFor)) {
      _serviceLocator.registerLazySingleton(
        factoryFunc,
        instanceName: instanceName,
        dispose: dispose,
      );
    }
  }

  Future<void> registerLazySingletonAsync<T extends Object>(
    FactoryFuncAsync<T> factoryFunc, {
    String? instanceName,
    bool preResolve = false,
    Set<String>? registerFor,
    DisposeFunc<T>? dispose,
  }) {
    if (_canRegister(registerFor)) {
      if (preResolve) {
        return factoryFunc().then(
          (instance) => registerLazySingleton(
            () => instance,
            instanceName: instanceName,
            dispose: dispose,
          ),
        );
      } else {
        _serviceLocator.registerLazySingletonAsync(
          factoryFunc,
          instanceName: instanceName,
          dispose: dispose,
        );
      }
    }
    return Future.value();
  }

  void registerSingleton<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    Iterable<Type>? dependsOn,
    String? instanceName,
    Set<String>? registerFor,
    DisposeFunc<T>? dispose,
  }) {
    if (_canRegister(registerFor)) {
      _serviceLocator.registerSingleton(
        factoryFunc,
        dependsOn: dependsOn,
        instanceName: instanceName,
        dispose: dispose,
      );
    }
  }

  Future<void> registerSingletonAsync<T extends Object>(
    FactoryFuncAsync<T> factoryFunc, {
    String? instanceName,
    bool preResolve = false,
    Set<String>? registerFor,
    DisposeFunc<T>? dispose,
  }) {
    if (_canRegister(registerFor)) {
      if (preResolve) {
        return factoryFunc().then(
          (instance) => registerSingleton(
            () => instance,
            instanceName: instanceName,
            dispose: dispose,
          ),
        );
      } else {
        _serviceLocator.registerSingletonAsync(
          factoryFunc,
          instanceName: instanceName,
          dispose: dispose,
        );
      }
    }
    return Future.value();
  }
}
