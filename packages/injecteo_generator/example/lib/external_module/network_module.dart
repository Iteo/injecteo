import 'package:injecteo/injecteo.dart';

class ApiService {
  ApiService._({required this.baseUrl});

  factory ApiService.empty() {
    return ApiService._(baseUrl: '');
  }

  factory ApiService.test() {
    return ApiService._(baseUrl: 'https://${Environment.test}_service.com');
  }

  factory ApiService.dev() {
    return ApiService._(baseUrl: 'https://${Environment.dev}_service.com');
  }

  factory ApiService.prod() {
    return ApiService._(baseUrl: 'https://${Environment.prod}_service.com');
  }

  final String baseUrl;
}

@externalModule
abstract class NetworkExternalModule {
  @lazySingleton
  ApiService getApiService() => ApiService.empty();
}

@Inject(as: NetworkExternalModule, env: [Environment.dev])
class DevNetwork extends NetworkExternalModule {
  @override
  ApiService getApiService() => ApiService.dev();
}

@Inject(as: NetworkExternalModule, env: [Environment.test])
class TestNetwork extends NetworkExternalModule {
  @override
  ApiService getApiService() => ApiService.test();
}

@Inject(as: NetworkExternalModule, env: [Environment.prod])
class ProdNetwork extends NetworkExternalModule {
  @override
  ApiService getApiService() => ApiService.prod();
}
