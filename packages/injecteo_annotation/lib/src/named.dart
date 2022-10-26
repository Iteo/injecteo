/// Register a dependency with given name
///
class Named {
  const Named(this.name) : type = null;

  const Named.from(this.type) : name = null;

  final String? name;

  /// Instead of providing a literal name you can pass a type
  /// name will be extracted during generation
  final Type? type;
}

const named = Named('');
