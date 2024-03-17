import 'package:core_module/src/domain/entities/entity_base.dart';
import 'package:core_module/src/domain/repositories/repository_port.dart';

/// Base class for service implementations.
abstract class ServiceBase<T extends EntityBase> {
  final RepositoryPort<T> repository;

  /// Constructs a [ServiceBase] instance with the provided [repository].
  ServiceBase(this.repository);

}
