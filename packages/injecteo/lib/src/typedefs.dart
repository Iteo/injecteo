import 'dart:async';

typedef FactoryFunc<T> = T Function();

typedef FactoryFuncAsync<T> = Future<T> Function();

typedef DisposeFunc<T> = FutureOr Function(T param);
