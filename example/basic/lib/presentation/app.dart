import 'package:di_example/core/di/di.dart';
import 'package:di_example/presentation/page/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return HookedBlocConfigProvider(
      injector: () => sl,
      child: MaterialApp(
        title: 'DI Demo',
        theme: ThemeData.dark(),
        home: const HomePage(),
      ),
    );
  }
}
