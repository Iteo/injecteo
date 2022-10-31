import 'dart:async';

import 'package:get_it/get_it.dart' as get_it;
import 'package:injecteo/injecteo.dart';

class GetItServiceLocator implements ServiceLocator {
  GetItServiceLocator._();

  static final _getIt = get_it.GetIt.instance;

  static final _instance = GetItServiceLocator._();

  static ServiceLocator get instance {
    return _instance;
  }

  @override
  T call<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  }) {
    return _getIt(
      instanceName: instanceName,
      param1: param1,
      param2: param2,
    );
  }

  @override
  T get<T extends Object>({String? instanceName}) {
    return _getIt.get(
      instanceName: instanceName,
    );
  }

  @override
  Future<T> getAsync<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  }) {
    return _getIt.getAsync(
      instanceName: instanceName,
      param1: param1,
      param2: param2,
    );
  }

  @override
  bool isRegistered<T extends Object>({
    String? instanceName,
  }) {
    return _getIt.isRegistered(
      instanceName: instanceName,
    );
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
  void registerLazySingleton<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
    bool? signalsReady,
    DisposableFunc<T>? dispose,
  }) {
    return _getIt.registerLazySingleton(
      factoryFunc,
      instanceName: instanceName,
      dispose: dispose,
    );
  }

  @override
  void registerSingleton<T extends Object>(
    T instance, {
    String? instanceName,
    DisposableFunc<T>? dispose,
  }) {
    return _getIt.registerSingleton(
      instance,
      instanceName: instanceName,
      dispose: dispose,
    );
  }

  @override
  Future<void> registerSingletonAsync<T extends Object>(
    FactoryFuncAsync<T> factoryFunc, {
    String? instanceName,
    Iterable<Type>? dependsOn,
    DisposableFunc<T>? dispose,
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
  void registerSingletonWithDependencies<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
    Iterable<Type>? dependsOn,
    DisposableFunc<T>? dispose,
  }) {
    return _getIt.registerSingletonWithDependencies(
      factoryFunc,
      instanceName: instanceName,
      dependsOn: dependsOn,
      dispose: dispose,
    );
  }

  @override
  FutureOr unregister<T extends Object>({
    Object? instance,
    String? instanceName,
    DisposableFunc<T>? dispose,
  }) {
    return _getIt.unregister(
      instance: instance,
      instanceName: instanceName,
      disposingFunction: dispose,
    );
  }

  @override
  Future<void> waitForRegisterComplete() {
    return _getIt.allReady();
  }
}
