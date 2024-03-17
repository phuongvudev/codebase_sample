/// Base class for custom exceptions.
class ExceptionBase extends Error {
  /// Error code associated with the exception.
  final String code;

  /// Correlation ID for tracking purposes.
  late final String correlationId;

  /// Optional error message.
  final String? message;

  /// Constructs an [ExceptionBase] instance with the provided [code], [message], and optional [correlationId].
  ExceptionBase({
    required this.code,
    this.message,
    String? correlationId,
  }) {
    this.correlationId = correlationId ?? "1";
  }
}
