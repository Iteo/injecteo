class AppEnv {
  static const testName = 'test';
  static const devName = 'dev';
  static const prodName = 'prod';

  final String name;
  final String apiUrl;

  AppEnv._(
    this.name, {
    required this.apiUrl,
  });

  factory AppEnv.test() {
    return AppEnv._(
      testName,
      apiUrl: '',
    );
  }

  factory AppEnv.development() {
    return AppEnv._(
      devName,
      apiUrl: '',
    );
  }

  factory AppEnv.production() {
    return AppEnv._(
      prodName,
      apiUrl: '',
    );
  }
}
