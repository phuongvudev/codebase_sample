abstract class EntityBase {
  final String id;

  const EntityBase(this.id);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EntityBase &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
