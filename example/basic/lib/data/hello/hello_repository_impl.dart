import 'package:di_example/data/hello/hello_service.dart';
import 'package:di_example/domain/hello/hello_repository.dart';
import 'package:injecteo/injecteo.dart';

@Named('impl1')
@Inject(as: HelloService)
class HelloServiceFirstImpl implements HelloService {
  @override
  String sayHello() {
    return 'Hello from first implementation';
  }
}

@Named('impl2')
@Inject(as: HelloService)
class HelloServiceSecondImpl implements HelloService {
  @override
  String sayHello() {
    return 'Hello from second implementation';
  }
}

@Singleton(as: HelloRepository)
class HelloRepositoryImpl implements HelloRepository {
  HelloRepositoryImpl(@Named('impl1') this.helloService);

  final HelloService helloService;

  @override
  Future<String> hello() async {
    return helloService.sayHello();
  }
}
