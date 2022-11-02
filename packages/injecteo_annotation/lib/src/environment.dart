/// Annotate dependencies which should be registered only for certain environment
///
class Environment {
  const Environment(this.name);

  final String name;

  static const dev = 'dev';
  static const test = 'test';
  static const prod = 'prod';
}

const dev = Environment(Environment.dev);
const test = Environment(Environment.test);
const prod = Environment(Environment.prod);
