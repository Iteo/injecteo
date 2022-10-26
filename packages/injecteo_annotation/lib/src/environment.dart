/// Annotate dependencies which should be registered only for certain environment
///
class Environment {
  const Environment(this.name);

  final String name;
}

const dev = Environment('dev');
const test = Environment('test');
const prod = Environment('prod');
