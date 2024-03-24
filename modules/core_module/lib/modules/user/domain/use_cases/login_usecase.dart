import 'package:core_module/src/domain/command/i_command_output.dart';
import 'package:core_module/src/domain/use_cases/i_use_case.dart';
import 'package:core_module/modules/user/domain/command/login_command.dart';
import 'package:core_module/modules/user/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
final class LoginUseCase extends IUseCase<LoginCommand> {
  final UserRepository _repository;

  LoginUseCase(this._repository);
  @override
  Future<void> execute(LoginCommand input, CommandOutput output) async {

  }

}