import 'package:di_example/presentation/widget/say_hello/cubit/say_hello_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

class SayHello extends HookWidget {
  const SayHello({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<SayHelloCubit>();
    final state = useBlocBuilder(cubit);

    useEffect(
      () {
        cubit.initialize();
        return null;
      },
      [],
    );
    return Text(state);
  }
}
