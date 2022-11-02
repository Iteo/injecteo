import 'dart:async';

import 'package:injecteo/injecteo.dart';
import 'package:injecteo/src/typedefs.dart';

abstract class ServiceLocator {
  T call<T extends Object>({
    String? instanceName,
  });

  T get<T extends Object>({
    String? instanceName,
  });

  Future<T> getAsync<T extends Object>({
    String? instanceName,
  });

  bool isRegistered<T extends Object>({
    String? instanceName,
  });

  FutureOr unregister<T extends Object>({
    String? instanceName,
    DisposeFunc<T>? dispose,
  });

  Future<void> waitForRegisterComplete();

  /// Factory
  ///

  void registerFactory<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
  });

  void registerFactoryAsync<T extends Object>(
    FactoryFuncAsync<T> factoryFunc, {
    String? instanceName,
  });

  /// Singleton
  ///

  void registerSingleton<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    Iterable<Type>? dependsOn,
    String? instanceName,
    DisposeFunc<T>? dispose,
  });

  Future<void> registerSingletonAsync<T extends Object>(
    FactoryFuncAsync<T> factoryFunc, {
    String? instanceName,
    DisposeFunc<T>? dispose,
  });

  void registerLazySingleton<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
    DisposeFunc<T>? dispose,
  });

  Future<void> registerLazySingletonAsync<T extends Object>(
    FactoryFuncAsync<T> factoryFunc, {
    String? instanceName,
    DisposeFunc<T>? dispose,
  });
}
