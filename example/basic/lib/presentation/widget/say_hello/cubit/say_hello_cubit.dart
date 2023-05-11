import 'package:di_example/use_case/hello/say_hello_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injecteo/injecteo.dart';

@inject
class SayHelloCubit extends Cubit<String> {
  SayHelloCubit(
    this._sayHelloUseCase,
  ) : super('');

  final SayHelloUseCase _sayHelloUseCase;

  Future<void> initialize() async {
    final hello = await _sayHelloUseCase();
    emit(hello);
  }
}
