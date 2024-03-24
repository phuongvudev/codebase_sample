import 'package:core_module/src/domain/command/i_command.dart';
import 'package:core_module/src/domain/service/i_service.dart';
import 'package:flutter/foundation.dart';

abstract class IServiceObserver {

  const IServiceObserver();

  @mustCallSuper
  void onCreate(IService service) {}

  @mustCallSuper
  void onCommand(IService service, ICommand command) {}

  @mustCallSuper
  void onError(IService service, Object error, StackTrace stackTrace) {}

  @mustCallSuper
  void onClose(IService service) {}
}


