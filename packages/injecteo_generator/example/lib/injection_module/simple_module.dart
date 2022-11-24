import 'package:injecteo/injecteo.dart';

const injectionModule = InjectionModule(name: 'MyInjectionModule');

@injectionModule
abstract class InjectionRepository {
  Future<int> getNumber();
}

@injectionModule
@LazySingleton(as: InjectionRepository)
class SimpleRepository extends InjectionRepository {
  @override
  Future<int> getNumber() async {
    final delay = Duration(milliseconds: 100);
    await Future.delayed(delay);

    return 2137;
  }
}

@inject
@injectionModule
class SimpleUseCase {
  SimpleUseCase(this._repository);

  final InjectionRepository _repository;

  Future<int> call() async {
    return await _repository.getNumber();
  }
}

@inject
@injectionModule
class SimpleClass {
  SimpleClass(this.useCase);

  final SimpleUseCase useCase;

  Future<int> calculate() async {
    final value = await useCase();
    return value * 2;
  }
}
