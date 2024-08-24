import 'package:fast8_test/domain/entity/user/user_data.dart';
import 'package:fast8_test/domain/repository/user_repository.dart';
import 'package:fast8_test/state/data_state/data_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserDataUc {
  final UserRepository _userRepository;

  GetUserDataUc(this._userRepository);

  Future<DataState<UserData>> call(String uid) async {
    return await _userRepository.getUserData(uid);
  }
}
