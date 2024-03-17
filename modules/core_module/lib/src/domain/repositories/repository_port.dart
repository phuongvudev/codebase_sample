import 'package:core_module/src/domain/entities/entity_base.dart';
import 'package:core_module/src/domain/repositories/paginated.dart';

typedef TransactionHandler<T> = Future<T> Function();

abstract class RepositoryPort<T extends EntityBase> {
  Future<T> findById(String id);

  Future<T> findByKey(String key);

  Future<List<T>> findAll();

  Future<List<T>> findAllByIds(Set<String> ids);

  Future<Paginated<T>> findAllPaginated(PaginatedQueryParams params);

  Future<bool> existsById(String id);

  Future<int> count();

  Future<T> insert(T entity);

  Future<List<T>> insertMany(List<T> entities);

  Future<T> update(T entity);

  Future<List<T>> updateMany(List<T> entities);

  Future<bool> delete(T entity);

  Future<bool> deleteById(String id);

  Future<bool> deleteAllByIds(Set<String> ids);

  Future<bool> deleteBulk(Set<String> ids);

  Future<T> transaction<E>(TransactionHandler<E> handler);
}
