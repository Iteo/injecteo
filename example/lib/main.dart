import 'package:di_example/core/di/di.dart';
import 'package:di_example/presentation/app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp(
    const MyApp(),
  );
}
