import 'package:di_example/presentation/page/home/cubit/home_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

import '../../widget/say_hello/say_hello.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<HomePageCubit>();
    final state = useBlocBuilder(cubit);

    useEffect(
      // ignore: body_might_complete_normally_nullable
      () {
        cubit.initialize();
      },
      [],
    );

    return Scaffold(
      appBar: AppBar(
        title: const SayHello(),
      ),
      body: Center(
        child: state.map(
          idle: (state) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${state.counter}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
          loading: (_) => const CircularProgressIndicator(),
          error: (state) => Text(
            state.message,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => cubit.increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
