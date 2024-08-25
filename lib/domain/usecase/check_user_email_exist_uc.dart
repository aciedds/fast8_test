import 'package:fast8_test/domain/repository/user_repository.dart';
import 'package:fast8_test/state/data_state/data_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckUserEmailExistUc {
  final UserRepository _userRepository;

  CheckUserEmailExistUc(this._userRepository);

  Future<DataState<bool>> call({required String email}) async {
    return await _userRepository.checkUserEmailExist(email: email);
  }
}
