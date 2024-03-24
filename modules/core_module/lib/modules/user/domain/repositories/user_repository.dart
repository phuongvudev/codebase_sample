import 'package:core_module/src/domain/repositories/i_repository.dart';
import 'package:core_module/modules/user/domain/entities/user_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable()
final class UserRepository extends IRepository<UserEntity> {

}