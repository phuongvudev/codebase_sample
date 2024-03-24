import 'package:core_module/src/domain/service/i_service.dart';
import 'package:core_module/modules/user/domain/command/login_command.dart';
import 'package:core_module/modules/user/domain/use_cases/login_usecase.dart';

final class UserService extends IService {
  final LoginUseCase _loginUseCase;

  UserService(this._loginUseCase) {
    on<LoginCommand>(_loginUseCase);
  }
}
