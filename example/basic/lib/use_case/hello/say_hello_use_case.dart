import 'package:di_example/domain/hello/hello_repository.dart';
import 'package:injecteo/injecteo.dart';

@inject
class SayHelloUseCase {
  SayHelloUseCase(this._helloRepository);

  final HelloRepository _helloRepository;

  Future<String> call() async {
    return _helloRepository.hello();
  }
}
