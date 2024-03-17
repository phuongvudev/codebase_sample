abstract class EntityBase<EntityProps> {
  final String id;

  final EntityProps props;

  const EntityBase(this.id, this.props);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EntityBase && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

abstract class EntityPropsBase {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;

  EntityPropsBase({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });
}

abstract class CreateEntityPropsBase<T> extends EntityPropsBase {
  final T data;

  CreateEntityPropsBase({
    required this.data,
    required super.id,
    required super.createdAt,
    required super.updatedAt,
  });
}
