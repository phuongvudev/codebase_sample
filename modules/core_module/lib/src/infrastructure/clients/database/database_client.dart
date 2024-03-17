import 'package:core_module/src/infrastructure/clients/i_client.dart';
import 'package:core_module/src/infrastructure/logger/logger_port.dart';

/// Abstract class representing a database client.
abstract class DatabaseClient implements IClient {
  /// Logger port for logging database interactions.
  final LoggerPort loggerPort;

  /// Constructs a [DatabaseClient] instance with the provided [loggerPort].
  DatabaseClient({required this.loggerPort});

  /// Connects to the database.
  Future<void> connect() async {
    // Implementation specific to connecting to the database
    loggerPort.debug('Connecting to the database...');
    // Simulating connection delay
    await Future.delayed(Duration(seconds: 2));
    loggerPort.debug('Connected to the database');
  }

  /// Disconnects from the database.
  @override
  Future<void> close() async {
    // Implementation specific to disconnecting from the database
    loggerPort.debug('Disconnecting from the database...');
    // Simulating disconnection delay
    await Future.delayed(Duration(seconds: 1));
    loggerPort.debug('Disconnected from the database');
  }

  /// Executes a database query.
  Future<void> executeQuery(String query) async {
    // Implementation specific to executing a database query
    loggerPort.debug('Executing query: $query');
    // Simulating query execution delay
    await Future.delayed(Duration(seconds: 1));
    loggerPort.debug('Query executed successfully');
  }
}
