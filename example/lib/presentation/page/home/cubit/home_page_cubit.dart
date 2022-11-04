import 'package:di_example/presentation/page/home/cubit/home_page_state.f.dart';
import 'package:di_example/use_case/counter/get_counter_value_use_case.dart';
import 'package:di_example/use_case/counter/increment_counter_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injecteo_annotation/injecteo_annotation.dart';

@inject
class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit(
    this._getCounterValueUseCase,
    this._incrementCounterUseCase,
  ) : super(HomePageState.loading());

  final GetCounterValueUseCase _getCounterValueUseCase;
  final IncrementCounterUseCase _incrementCounterUseCase;

  Future<void> initialize() async {
    final initialValue = await _getCounterValueUseCase();
    emit(
      HomePageState.idle(counter: initialValue),
    );
  }

  Future<void> increment() async {
    await _incrementCounterUseCase();
    final newValue = await _getCounterValueUseCase();
    emit(
      HomePageState.idle(
        counter: newValue,
      ),
    );
  }
}
