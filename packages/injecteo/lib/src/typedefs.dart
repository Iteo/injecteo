import 'dart:async';

typedef FactoryFunc<T> = T Function();

typedef FactoryFuncAsync<T> = Future<T> Function();

typedef DisposableFunc<T> = FutureOr Function(T param);
