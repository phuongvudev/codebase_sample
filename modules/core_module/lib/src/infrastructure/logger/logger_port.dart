/// Abstract class representing a logger port.
abstract class LoggerPort {
  /// Logs a message.
  void log(String message, [StackTrace? trace]);

  /// Logs an error message.
  void error(String message, [StackTrace? trace]);

  /// Logs a warning message.
  void warn(String message, [StackTrace? trace]);

  /// Logs a debug message.
  void debug(String message, [StackTrace? trace]);
}
