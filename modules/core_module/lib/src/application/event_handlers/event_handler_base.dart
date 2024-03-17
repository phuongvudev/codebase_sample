import 'package:core_module/src/domain/events/domain_event.dart';

/// Abstract class representing an event handler that handles domain events and produces a response.
abstract class EventHandlerBase<Event extends DomainEventBase, Response> {
  /// Handles the given [domainEvent] and produces a response.
  Future<Response> handle(Event domainEvent);
}
