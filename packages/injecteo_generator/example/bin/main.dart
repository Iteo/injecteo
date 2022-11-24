import 'package:example/external_module/async_external_module.dart';
import 'package:example/external_module/named_module.dart';
import 'package:example/external_module/network_module.dart';
import 'package:example/external_module/simple_module.dart';
import 'package:example/factory/abstract_factory.dart';
import 'package:example/factory/factory_with_env.dart';
import 'package:example/factory/factory_with_factory_method.dart';
import 'package:example/factory/named_factory.dart';
import 'package:example/factory/simple_factory.dart';
import 'package:example/injection_module/simple_module.dart';
import 'package:example/singleton/abstract_singleton.dart';
import 'package:example/singleton/named_singleton.dart';
import 'package:example/singleton/simple_singleton.dart';
import 'package:example/singleton/singleton_with_dispose_method.dart';
import 'package:example/singleton/singleton_with_env.dart';
import 'package:example/singleton/singleton_with_external_dispose_method.dart';
import 'package:example/singleton/singleton_with_factory_method.dart';

import 'di.dart';

Future<void> main() async {
  await configureDependencies('dev');

  await _singleton();
  await _factory();
  await _externalModule();
  await _injectionModule();
}

Future<void> _singleton() async {
  print("----- Singleton -----");

  final simpleSingleton = sl.get<SimpleSingleton>();
  print('Simple singleton: $simpleSingleton');

  final abstractSingleton = sl.get<AbstractSingleton>();
  print('Abstract singleton with implementation: $abstractSingleton');

  final singletonWithDisposeMethod = sl.get<SingletonWithDisposeMethod>();
  print("Singleton with dispose method: $singletonWithDisposeMethod");

  final singletonWithExternalDisposeMethod =
      sl.get<SingletonWithExternalDisposeMethod>();
  print(
    "Singleton with external dispose method: $singletonWithExternalDisposeMethod",
  );

  try {
    sl.get<SingletonWithEnv>();
  } catch (e) {
    print(
      'Error thrown, because Example Singleton is marked with different environment than configured. Error: $e',
    );
  }

  final namedInstance =
      sl<NamedSingleton>(instanceName: 'NamedSingletonInstance');
  print('Named instance: $namedInstance');

  final a = await sl.getAsync<SingletonApiClient>();
  final b = await sl.getAsync<SingletonApiClient>();
  final identicalInstances = identical(a, b);
  final areEqual = a == b;
  print("Singleton with factory method: \n $a \n $b");
  print(
    "Are singleton instances identical with factory method: $identicalInstances. \n Are instances equal: $areEqual \n",
  );
}

Future<void> _factory() async {
  print("----- Factory -----");

  final simpleFactory = sl.get<SimpleFactory>();
  print('Simple factory: $simpleFactory');

  final abstractFactory = sl.get<AbstractFactory>();
  print('Abstract factory with implementation: $abstractFactory');

  try {
    sl.get<FactoryWithEnv>();
  } catch (e) {
    print(
      'Error thrown, because $FactoryWithEnv is marked with different environment than configured. Error: $e',
    );
  }

  final namedInstance = sl<NamedFactory>(instanceName: 'NamedFactoryInstance');
  print('Named instance: $namedInstance');

  final a = await sl.getAsync<FactoryApiClient>();
  final b = await sl.getAsync<FactoryApiClient>();
  final identicalInstances = identical(a, b);
  final areEqual = a == b;
  print("Factory with factory method: \n $a \n $b");
  print(
    "Are factory instances identical with factory method: $identicalInstances. Are instances equal: $areEqual",
  );
}

Future<void> _externalModule() async {
  _printFormatted('EXTERNAL MODULE');

  final simpleModule = sl.get<AbstractSimpleModule>();
  _printFormatted('Simple external module: $simpleModule');

  final envModule = sl.get<NetworkExternalModule>();
  final apiService = envModule.getApiService();
  final url = apiService.baseUrl;
  _printFormatted('External module for test env: $envModule ($url)');

  final fancyName = 'MyFancyModuleInstance';
  final fancyNamedModule = sl.get<NamedModule>(instanceName: fancyName);
  _printFormatted('External fancy named module: $fancyNamedModule');

  final normalName = 'MyQuiteNormalNamedModuleInstance';
  final normalNamedModule = sl.get<NamedModule>(instanceName: normalName);
  _printFormatted('External normal named module: $normalNamedModule');

  final factoryA = await sl.getAsync<AsyncAbstractExternalModule>(
    instanceName: 'AsyncFactoryExternalModule',
  );
  final factoryB = await sl.getAsync<AsyncAbstractExternalModule>(
    instanceName: 'AsyncFactoryExternalModule',
  );
  final areFactoriesEqual = identical(factoryA, factoryB);
  final factoryMessage = '''
  External module with factory method:
  $factoryA
  $factoryB
  
  Are ext.module instances identical with factory method: $areFactoriesEqual.
  Are instances equal: ${factoryA == factoryB} \n''';
  _printFormatted(factoryMessage);
}

Future<void> _injectionModule() async {
  _printFormatted('INJECTION MODULE');

  final simpleUseCase = sl.get<SimpleUseCase>();
  final number = await simpleUseCase();
  _printFormatted('Number: $number');

  final simpleClass = sl.get<SimpleClass>();
  final value = await simpleClass.calculate();
  _printFormatted('Calculate something: $value');
}

void _printFormatted(String text) {
  final dashes = '-' * 75;
  print('$dashes \n >> $text \n$dashes');
}
