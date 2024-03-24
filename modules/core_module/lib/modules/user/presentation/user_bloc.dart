import 'package:bloc/bloc.dart';
import 'package:core_module/modules/user/user_service.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserService userService;
  UserBloc(this.userService) : super(UserInitial()) {
    on<UserEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
