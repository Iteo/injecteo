// ignore_for_file: avoid_print

import 'package:counter/counter.dart';
import 'package:injecteo/injecteo.dart';
import 'package:logger/logger.dart';

void main() async {
  const env = 'dev';
  print(
    '''--- Register dependencies using InjectionModule classes exported from feature packages ----''',
  );
  print('''
      Pay attention, that counter feature depends on logger feature. 
      Even if register order is different, everything will work correctly. 
      ''');

  for (final module in [
    CounterInjectionModule(),
    LoggerInjectionModule(),
  ]) {
    module.registerDependencies(
      GetItServiceLocator.instance,
      environment: env,
    );
  }

  final counter = GetItServiceLocator.instance.get<CounterRepository>();
  print("Initial value: ${counter.getValue()}");
  print("Call increment method...");
  counter.increment();
  print("New value: ${counter.getValue()}");

  final a = GetItServiceLocator.instance<Logger>();
  final b = GetItServiceLocator.instance.get<Logger>();
  print(
    "Proof that instances are identical (supposed to be a singleton): identical: ${identical(a, b)}, equals: ${a == b}",
  );
  a.d("Sample debug log");
  b.e("Sample error log");
}
