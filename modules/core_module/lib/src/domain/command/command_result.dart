import 'package:core_module/src/exceptions/exception_base.dart';

class CommandResult<R> {
  final R? result;

  final ExceptionBase? error;

  const CommandResult({this.result, this.error});

  bool get isSuccess => error == null;
}