import 'package:core_module/src/domain/entities/entity_base.dart';

abstract class Mapper<DomainEntity extends EntityBase, DbRecord, Response> {
  DbRecord toPersistence(DomainEntity entity);

  DomainEntity toDomain(DbRecord record);

  Response toResponse(DomainEntity entity);
}
