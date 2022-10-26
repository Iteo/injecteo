class InjecteoError extends Error {
  InjecteoError(this.message);

  final String message;

  @override
  String toString() {
    return 'InjecteoError: \n$message\n';
  }
}
