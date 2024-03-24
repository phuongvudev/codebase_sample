import 'dart:async';
import 'package:core_module/src/domain/command/command_result.dart';
import 'package:core_module/src/domain/command/i_command.dart';
import 'package:core_module/src/domain/command/i_command_output.dart';
import 'package:core_module/src/domain/service/i_service_observer.dart';
import 'package:core_module/src/domain/use_cases/i_use_case.dart';
import 'package:core_module/src/exceptions/exception_base.dart';

typedef CommandHandler<Input extends ICommand> = FutureOr<void> Function(
    Input event, CommandOutput);

abstract class IService {
  IService({this.observer = const _DefaultServiceObserver()}) {
    observer.onCreate(this);
  }

  final _handlers = <Type, IUseCase>{};

  final _commandController = StreamController<ICommand>.broadcast();

  Stream<ICommand> get commands =>
      _commandController.stream.asBroadcastStream();

  final IServiceObserver observer;

  Future<CommandResult<R>> submitCommand<R>(ICommand command) async {
    final handlerExists = _handlers[command.runtimeType];
    if (handlerExists == null) {
      final commandType = command.runtimeType;
      throw StateError(
        '''add($commandType) was called without a registered event handler.\n'''
        '''Make sure to register a handler via on<$commandType>((command, output) {...})''',
      );
    }
    try {
      _onCommand(command);
      final output = CommandOutput<R, ExceptionBase>();
      await handlerExists.execute(command, output);
      _commandController.add(command);
      return CommandResult<R>(
        result: output.getResult<R>(),
        error: output.getError<ExceptionBase>(),
      );
    } catch (error, stackTrace) {
      _onError(error, stackTrace);
      rethrow;
    }
  }

  void on<E extends ICommand>(IUseCase useCase) {
    assert(() {
      final handlerExists = _handlers.containsKey(E.runtimeType);
      if (handlerExists) {
        throw StateError(
          'on<$E> was called multiple times. '
          'There should only be a single event handler per event type.',
        );
      }
      _handlers[E.runtimeType] = useCase;
      return true;
    }());
  }

  void _onCommand(ICommand command) {
    observer.onCommand(this, command);
  }

  void _onError(Object error, StackTrace stackTrace) {
    observer.onError(this, error, stackTrace);
  }

  void _onClose() {
    _commandController.close();
    observer.onClose(this);
  }

  void close() {
    _onClose();
  }
}

class _DefaultServiceObserver extends IServiceObserver {
  const _DefaultServiceObserver();
}
