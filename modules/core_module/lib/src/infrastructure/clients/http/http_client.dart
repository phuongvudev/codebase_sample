import 'package:core_module/src/infrastructure/clients/i_client.dart';
import 'package:core_module/src/infrastructure/logger/logger_port.dart';
import 'package:dio/dio.dart';

/// Abstract base class for HTTP clients.
abstract class HttpClient implements IClient {
  /// Instance of Dio for making HTTP requests.
  late final Dio dio;

  /// Logger port for logging HTTP interactions.
  final LoggerPort loggerPort;

  /// Constructs an [HttpClient] instance with the provided [loggerPort].
  HttpClient({required this.loggerPort});

  /// Builds base options for the HTTP client.
  void buildBaseOptions() {}

  /// Adds interceptors to the HTTP client.
  void addInterceptors() {}
}
