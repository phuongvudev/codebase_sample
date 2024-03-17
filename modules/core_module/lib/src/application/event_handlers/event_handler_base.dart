import 'package:core_module/src/domain/events/domain_event.dart';

abstract class EventHandlerBase<Event extends DomainEventBase, Response> {
  Future<Response> handle(Event domainEvent);
}
