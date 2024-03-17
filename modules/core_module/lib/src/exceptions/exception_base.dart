class ExceptionBase extends Error {
  final String code;
  late final String correlationId;
  final String? message;

  ExceptionBase({required this.code, this.message, String? correlationId}) {
    this.correlationId = correlationId ?? "1";
  }
}
