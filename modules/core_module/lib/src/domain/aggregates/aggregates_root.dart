import 'package:core_module/src/domain/entities/entity_base.dart';
import 'package:core_module/src/domain/events/domain_event.dart';
import 'package:core_module/src/infrastructure/logger/logger_port.dart';
import 'package:equatable/equatable.dart';

/// Abstract class representing an aggregate root in domain-driven design.
/// An aggregate root is a domain object that is responsible for enforcing consistency and invariants
/// within a specific aggregate.
abstract class AggregateRoot<EntityProps extends Equatable>
    extends EntityBase<EntityProps> {
  /// List to store domain events associated with this aggregate root.
  final List<DomainEventBase> _domainEvents = [];

  /// Constructs an [AggregateRoot] instance with the provided [id] and [props].
  AggregateRoot({required super.id, required super.props});

  /// Adds a [domainEvent] to the list of domain events associated with this aggregate root.
  void addEvent(DomainEventBase domainEvent) {
    this._domainEvents.add(domainEvent);
  }

  /// Clears all domain events associated with this aggregate root.
  void clearEvents() {
    this._domainEvents.clear();
  }

  /// Publishes all domain events associated with this aggregate root and clears the events list.
  ///
  /// Takes a [logger] instance to log event publication.
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
