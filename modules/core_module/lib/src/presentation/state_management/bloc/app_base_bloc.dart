import 'package:core_module/src/infrastructure/logger/logger_port.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_base_event.dart';

part 'app_base_state.dart';

class AppBaseBloc extends Bloc<AppBaseEvent, AppBaseState> {
  final LoggerPort _loggerPort;
  AppBaseBloc(this._loggerPort) : super(AppBaseInitial()) {
    on<AppBaseEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
