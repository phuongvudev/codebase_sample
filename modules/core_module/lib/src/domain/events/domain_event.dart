import 'package:core_module/src/helpers/ids.dart';

final class DomainEventMetadata {
  /// Timestamp when this domain event occurred
  final int timestamp;

  /// ID for correlation purposes (for Integration Events,logs correlation, etc).
  final int correlationId;

  /// Causation id used to reconstruct execution order if needed
  final int? causationId;

  /// User ID for debugging and logging purposes
  final int? userId;

  DomainEventMetadata(
      {required this.timestamp,
      required this.correlationId,
      this.causationId,
      this.userId});

  factory DomainEventMetadata.basic({
    required int correlationId,
    int? causationId,
    int? userId,
  }) {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    return DomainEventMetadata(
        timestamp: timestamp,
        correlationId: correlationId,
        causationId: causationId,
        userId: userId);
  }
}

abstract class DomainEventBase {
  late final String id;

  final String aggregateId;

  final DomainEventMetadata metadata;

  DomainEventBase(
      {String? id, required this.aggregateId, required this.metadata}) {
    this.id = id ?? IDHelpers.generatePrefixId(prefix: "de");
  }
}
