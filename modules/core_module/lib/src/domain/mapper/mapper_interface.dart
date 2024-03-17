import 'package:core_module/src/domain/entities/entity_base.dart';

/// Abstract class representing a mapper for converting between domain entities,
/// database records, and response objects.
abstract class Mapper<DomainEntity extends EntityBase, DbRecord, Response> {
  /// Converts a domain entity to its corresponding database record representation.
  DbRecord toPersistence(DomainEntity entity);

  /// Converts a database record to its corresponding domain entity representation.
  DomainEntity toDomain(DbRecord record);

  /// Converts a domain entity to its corresponding response object representation.
  Response toResponse(DomainEntity entity);
}
