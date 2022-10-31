import 'package:injecteo_annotation/injecteo_annotation.dart';

abstract class ExampleRepo {
  Future<String> hello();
}

@singleton
class ExampleRepoImpl implements ExampleRepo {
  @override
  Future<String> hello() async {
    return 'hello';
  }
}
