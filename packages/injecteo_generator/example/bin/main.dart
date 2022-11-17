import 'package:example/singleton/abstract_singleton.dart';
import 'package:example/singleton/named_singleton.dart';
import 'package:example/singleton/simple_singleton.dart';
import 'package:example/singleton/singleton_with_dispose_method.dart';
import 'package:example/singleton/singleton_with_env.dart';

import 'di.dart';

void main() {
  configureDependencies('dev');

  _singleton();
}

void _singleton() {
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
}
