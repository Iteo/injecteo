import 'dart:async';

import 'package:get_it/get_it.dart' as get_it;
import 'package:injecteo/injecteo.dart';

class GetItServiceLocator implements ServiceLocator {
  GetItServiceLocator._();

  static final _instance = GetItServiceLocator._();
  final _getIt = get_it.GetIt.instance;

  static ServiceLocator get instance {
    return _instance;
  }

  @override
  T call<T extends Object>({
    String? instanceName,
  }) {
    return get(
      instanceName: instanceName,
    );
  }

  @override
  T get<T extends Object>({
    String? instanceName,
  }) {
    return _getIt.get(
      instanceName: instanceName,
    );
  }

  @override
  Future<T> getAsync<T extends Object>({
    String? instanceName,
  }) {
    return _getIt.getAsync(
      instanceName: instanceName,
    );
  }

  @override
  bool isRegistered<T extends Object>({
    String? instanceName,
  }) {
    return _getIt.isRegistered<T>(
      instanceName: instanceName,
    );
  }

  @override
  FutureOr unregister<T extends Object>({
    Object? instance,
    String? instanceName,
    DisposeFunc<T>? dispose,
  }) {
    return _getIt.unregister<T>(
      instance: instance,
      instanceName: instanceName,
      disposingFunction: dispose,
    );
  }

  @override
  Future<void> waitForRegisterComplete() {
    return _getIt.allReady();
  }

  @override
  void registerFactory<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
  }) {
    return _getIt.registerFactory(
      factoryFunc,
      instanceName: instanceName,
    );
  }

  @override
  void registerFactoryAsync<T extends Object>(
    FactoryFuncAsync<T> factoryFunc, {
    String? instanceName,
  }) {
    return _getIt.registerFactoryAsync(
      factoryFunc,
      instanceName: instanceName,
    );
  }

  @override
  void registerSingleton<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    Iterable<Type>? dependsOn,
    String? instanceName,
    DisposeFunc<T>? dispose,
  }) {
    return _getIt.registerSingletonWithDependencies(
      factoryFunc,
      dependsOn: dependsOn,
      instanceName: instanceName,
      dispose: dispose,
    );
  }

  @override
  Future<void> registerSingletonAsync<T extends Object>(
    FactoryFuncAsync<T> factoryFunc, {
    String? instanceName,
    Iterable<Type>? dependsOn,
    DisposeFunc<T>? dispose,
  }) {
    _getIt.registerSingletonAsync(
      factoryFunc,
      instanceName: instanceName,
      dependsOn: dependsOn,
      dispose: dispose,
    );

    return _getIt.isReady<T>(
      instanceName: instanceName,
    );
  }

  @override
  void registerLazySingleton<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
    bool? signalsReady,
    DisposeFunc<T>? dispose,
  }) {
    return _getIt.registerLazySingleton(
      factoryFunc,
      instanceName: instanceName,
      dispose: dispose,
    );
  }

  @override
  Future<void> registerLazySingletonAsync<T extends Object>(
    FactoryFuncAsync<T> factoryFunc, {
    String? instanceName,
    DisposeFunc<T>? dispose,
  }) async {
    _getIt.registerLazySingletonAsync(
      factoryFunc,
      instanceName: instanceName,
      dispose: dispose,
    );

    return _getIt.isReady<T>(
      instanceName: instanceName,
    );
  }
}
