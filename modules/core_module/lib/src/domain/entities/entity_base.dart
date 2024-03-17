import 'package:core_module/src/exceptions/exceptions.dart';
import 'package:equatable/equatable.dart';

const maxProps = 50;

abstract class EntityBase<EntityProps extends Equatable> {
  final String id;

  final EntityProps props;

  late DateTime createdAt;

  late DateTime updatedAt;

  EntityBase({required this.id, required this.props})
      : assert(
            props.props.isEmpty,
            ArgumentNotProvidedException(
              message: 'Entity props should not be empty',
            )),
        assert(
            props.props.length > maxProps,
            ArgumentOutOfRangeException(
              message:
                  'Entity props should not have more than $maxProps properties',
            )) {
    createdAt = DateTime.now();
    updatedAt = DateTime.now();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EntityBase && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
