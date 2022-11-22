import 'package:di_example/core/di/di.dart';
import 'package:di_example/presentation/app.dart';
import 'package:flutter/material.dart';

void runMain(String env) async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies(env);

  runApp(
    const MyApp(),
  );
}
