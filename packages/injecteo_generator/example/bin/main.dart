import 'package:example/factory/abstract_factory.dart';
import 'package:example/factory/factory_with_env.dart';
import 'package:example/factory/factory_with_factory_method.dart';
import 'package:example/factory/named_factory.dart';
import 'package:example/factory/simple_factory.dart';
import 'package:example/singleton/abstract_singleton.dart';
import 'package:example/singleton/named_singleton.dart';
import 'package:example/singleton/simple_singleton.dart';
import 'package:example/singleton/singleton_with_dispose_method.dart';
import 'package:example/singleton/singleton_with_env.dart';
import 'package:example/singleton/singleton_with_external_dispose_method.dart';
import 'package:example/singleton/singleton_with_factory_method.dart';

import 'di.dart';

Future<void> main() async {
  configureDependencies('dev');

  await _singleton();
  await _factory();
}

Future<void> _singleton() async {
  print("----- Singleton -----");

  final simpleSingleton = sl.get<SimpleSingleton>();
  print(
    'Simple singleton: $simpleSingleton',
  );

  final abstractSingleton = sl.get<AbstractSingleton>();
  print(
    'Abstract singleton with implementation: $abstractSingleton',
  );

  final singletonWithDisposeMethod = sl.get<SingletonWithDisposeMethod>();
  print(
    "Singleton with dispose method: $singletonWithDisposeMethod",
  );

  final singletonWithExternalDisposeMethod =
      sl.get<SingletonWithExternalDisposeMethod>();
  print(
    "Singleton with external dispose method: $singletonWithExternalDisposeMethod",
  );

  try {
    sl.get<SingletonWithEnv>();
  } catch (e) {
    print(
        'Error thrown, because Example Singleton is marked with different environment than configured. Error: $e');
  }

  final namedInstance =
      sl<NamedSingleton>(instanceName: 'NamedSingletonInstance');
  print(
    'Named instance: $namedInstance',
  );

  final a = await sl.getAsync<SingletonApiClient>();
  final b = await sl.getAsync<SingletonApiClient>();
  final identicalInstances = identical(a, b);
  final areEqual = a == b;
  print(
    "Singleton with factory method: \n $a \n $b",
  );
  print(
    "Are singleton instances identical with factory method: $identicalInstances. \n Are instances equal: $areEqual \n",
  );
}

Future<void> _factory() async {
  print("----- Factory -----");

  final simpleFactory = sl.get<SimpleFactory>();
  print(
    'Simple factory: $simpleFactory',
  );

  final abstractFactory = sl.get<AbstractFactory>();
  print(
    'Abstract factory with implementation: $abstractFactory',
  );

  try {
    sl.get<FactoryWithEnv>();
  } catch (e) {
    print(
        'Error thrown, because $FactoryWithEnv is marked with different environment than configured. Error: $e');
  }

  final namedInstance = sl<NamedFactory>(instanceName: 'NamedFactoryInstance');
  print(
    'Named instance: $namedInstance',
  );

  final a = await sl.getAsync<FactoryApiClient>();
  final b = await sl.getAsync<FactoryApiClient>();
  final identicalInstances = identical(a, b);
  final areEqual = a == b;
  print(
    "Factory with factory method: \n $a \n $b",
  );
  print(
    "Are factory instances identical with factory method: $identicalInstances. Are instances equal: $areEqual",
  );
}
