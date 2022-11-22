import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:todeo/core/logger/logger.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    if (kDebugMode) {
      Logger.d('SBO Log: ${bloc.runtimeType} created');
    }
    super.onCreate(bloc);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    if (kDebugMode) {
      Logger.d('SBO Log: ${bloc.runtimeType} event: $event');
    }
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    if (kDebugMode) {
      Logger.d('SBO Log: ${bloc.runtimeType} has $change');
    }
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    if (kDebugMode) {
      Logger.d('SBO Log: ${bloc.runtimeType} transition: $transition');
    }
    super.onTransition(bloc, transition);
  }

  @override
  void onError(
    BlocBase bloc,
    Object error,
    StackTrace stackTrace,
  ) {
    if (kDebugMode) {
      Logger.d('SBO Log: ${bloc.runtimeType} $error $stackTrace');
    }
    super.onError(
      bloc,
      error,
      stackTrace,
    );
  }

  @override
  void onClose(BlocBase bloc) {
    if (kDebugMode) {
      Logger.d('SBO Log: ${bloc.runtimeType} closed');
    }
    super.onClose(bloc);
  }
}
