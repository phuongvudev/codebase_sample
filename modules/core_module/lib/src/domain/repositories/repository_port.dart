import 'package:core_module/src/domain/entities/entity_base.dart';
import 'package:core_module/src/domain/repositories/paginated.dart';

/// A function signature for transactional operations.
typedef TransactionHandler<T> = Future<T> Function();

/// Abstract class representing a port for repository operations.
abstract class RepositoryPort<T extends EntityBase> {
  /// Finds an entity by its [id].
  Future<T> findById(String id);

  /// Finds an entity by its [key].
  Future<T> findByKey(String key);

  /// Finds all entities.
  Future<List<T>> findAll();

  /// Finds all entities by their IDs.
  Future<List<T>> findAllByIds(Set<String> ids);

  /// Finds entities in a paginated manner based on [params].
  Future<Paginated<T>> findAllPaginated(PaginatedQueryParams params);

  /// Checks if an entity with the given [id] exists.
  Future<bool> existsById(String id);

  /// Counts the total number of entities.
  Future<int> count();

  /// Inserts a new [entity].
  Future<T> insert(T entity);

  /// Inserts multiple [entities].
  Future<List<T>> insertMany(List<T> entities);

  /// Updates an existing [entity].
  Future<T> update(T entity);

  /// Updates multiple [entities].
  Future<List<T>> updateMany(List<T> entities);

  /// Deletes an [entity].
  Future<bool> delete(T entity);

  /// Deletes an entity by its [id].
  Future<bool> deleteById(String id);

  /// Deletes all entities with the given [ids].
  Future<bool> deleteAllByIds(Set<String> ids);

  /// Deletes multiple entities in bulk.
  Future<bool> deleteBulk(Set<String> ids);

  /// Executes a transactional operation specified by [handler].
  Future<T> transaction<E>(TransactionHandler<E> handler);
}
