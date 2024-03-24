import 'package:core_module/src/domain/command/i_command.dart';

class CommandOutput<R, E> {
  R? _result;

  E? _error;

  void setResult(dynamic value) {
    _result = value;
  }

  void setError(dynamic value) {
    _error = value;
  }

  T getResult<T>() {
    return _result as T;
  }

  T getError<T>() {
    return _error as T;
  }
}
