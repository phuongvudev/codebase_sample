abstract class LoggerPort {
  void log(String message, [StackTrace trace]);

  void error(String message, [StackTrace trace]);

  void warn(String message, [StackTrace trace]);

  void debug(String message, [StackTrace trace]);
}
