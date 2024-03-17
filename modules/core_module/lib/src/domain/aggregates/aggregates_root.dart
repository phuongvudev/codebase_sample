import 'package:core_module/src/domain/entities/entity_base.dart';
import 'package:core_module/src/domain/events/domain_event.dart';
import 'package:core_module/src/infrastructure/logger/logger_port.dart';

abstract class AggregateRoot<EntityProps> extends EntityBase<EntityProps> {
  final List<DomainEventBase> _domainEvents = [];

  AggregateRoot(super.id, super.props);

  void addEvent(DomainEventBase domainEvent) {
    this._domainEvents.add(domainEvent);
  }

  void clearEvents() {
    this._domainEvents.clear();
  }

  Future<void> publishEvents(
    LoggerPort logger,
  ) async {
    await Future.forEach(_domainEvents, (event) {
      logger.debug(
          " ${event.runtimeType} event published for aggregate $runtimeType");
    });

    clearEvents();
  }
}
