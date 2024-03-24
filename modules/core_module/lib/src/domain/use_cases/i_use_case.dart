import 'package:core_module/src/domain/command/i_command.dart';
import 'package:core_module/src/domain/command/i_command_output.dart';

abstract class IUseCase<Input extends ICommand> {
  Future<void> execute(Input input, CommandOutput output);
}


abstract class UseCaseObservable {

}