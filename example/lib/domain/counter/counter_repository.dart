abstract class CounterRepository<T extends Object> {
  Future<T> getValue();
  Future<void> increment();
}
