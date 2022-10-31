/// Annotated class will have code for injectable dependency
class Injectable {
  const Injectable({
    this.as,
    this.env,
  });

  /// The type to bind your implementation to,
  /// typically, an abstract class which is implemented by the
  /// annotated class.
  final Type? as;

  /// An alternative way to pass environment named instead
  /// of annotating the element with @Environment
  final List<String>? env;
}

const injectable = Injectable();
