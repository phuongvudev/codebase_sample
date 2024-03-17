import 'package:core_module/src/infrastructure/clients/i_client.dart';
import 'package:core_module/src/infrastructure/logger/logger_port.dart';
import 'package:dio/dio.dart';

abstract base class HttpClient implements IClient {
  late final Dio dio;
  final LoggerPort loggerPort;

  HttpClient({required this.loggerPort});

  void buildBaseOptions() {}

  void addInterceptors() {}
}
