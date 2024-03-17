import 'package:core_module/src/helpers/ids.dart';

/// Metadata associated with a domain event, containing information such as timestamp, correlation ID,
/// causation ID, and user ID.
class DomainEventMetadata {
  /// Timestamp when this domain event occurred.
  final int timestamp;

  /// ID for correlation purposes (for Integration Events, logs correlation, etc).
  final int correlationId;

  /// Causation ID used to reconstruct execution order if needed.
  final int? causationId;

  /// User ID for debugging and logging purposes.
  final int? userId;

  /// Constructs a [DomainEventMetadata] instance with the provided parameters.
  DomainEventMetadata({
    required this.timestamp,
    required this.correlationId,
    this.causationId,
    this.userId,
  });

  /// Constructs a [DomainEventMetadata] instance with basic information and the current timestamp.
  factory DomainEventMetadata.basic({
    required int correlationId,
    int? causationId,
    int? userId,
  }) {
    final timestamp = DateTime
        .now()
        .millisecondsSinceEpoch;
    return DomainEventMetadata(
      timestamp: timestamp,
      correlationId: correlationId,
      causationId: causationId,
      userId: userId,
    );
  }
}

/// Base class for domain events.
abstract class DomainEventBase {
  /// Unique identifier for the domain event.
  late final String id;

  /// Identifier of the aggregate associated with this domain event.
  final String aggregateId;

  /// Metadata associated with the domain event.
  final DomainEventMetadata metadata;

  /// Constructs a [DomainEventBase] instance with the provided parameters.
  DomainEventBase({
    String? id,
    required this.aggregateId,
    required this.metadata,
  }) {
    this.id = id ?? IDHelpers.generatePrefixId(prefix: "de");
  }
}

