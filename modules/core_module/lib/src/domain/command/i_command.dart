
import 'package:core_module/src/helpers/ids.dart';

abstract class ICommand{
  late final String id;

  late final CommandMeta meta;

  ICommand({String? id, CommandMeta? meta}) {
    this.meta = meta ?? CommandMeta.basic();
    this.id = id ?? IDHelpers.generatePrefixId(prefix: 'Command_');
  }
}

final class CommandMeta {
  final int timestamp;

  final String correlationId;

  final int? causationId;

  final int? userId;

  CommandMeta({
    required this.timestamp,
    required this.correlationId,
    required this.causationId,
    required this.userId,
  });

  factory CommandMeta.basic({
    String? correlationId,
    int? causationId,
    int? userId,
  }) {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final id =
        correlationId ?? IDHelpers.generatePrefixId(prefix: 'Correlation_');
    return CommandMeta(
      timestamp: timestamp,
      correlationId: id,
      causationId: causationId,
      userId: userId,
    );
  }
}


abstract class NotificationEvent extends ICommand{
  NotificationEvent();
}