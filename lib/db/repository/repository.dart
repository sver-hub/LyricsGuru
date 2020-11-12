abstract class Repository<T> {
  Future<bool> save(T model);

  Future<T> getById(int id);

  Future<List<T>> getAll();

  Future<int> getCount();
}
