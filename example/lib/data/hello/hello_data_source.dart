import 'package:injecteo_annotation/injecteo_annotation.dart';

@inject
class HelloDataSource {
  Future<String> hello() async {
    return 'hello';
  }
}
