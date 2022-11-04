import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_page_state.f.freezed.dart';

@freezed
class HomePageState with _$HomePageState {
  factory HomePageState.loading() = _HomePageStateLoading;

  factory HomePageState.idle({
    required int counter,
  }) = _HomePageStateIdle;

  factory HomePageState.error(String message) = _HomePageStateError;
}
