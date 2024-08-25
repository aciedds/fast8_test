import 'package:fast8_test/domain/entity/user/user_data.dart';
import 'package:fast8_test/domain/repository/user_repository.dart';
import 'package:fast8_test/state/data_state/data_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddUserDataUc {
  final UserRepository _userRepository;

  AddUserDataUc(this._userRepository);

  Future<DataState<UserData>> call({
    required String id,
    required String name,
    required String email,
    required bool isEmailVerified,
    required String dob,
    required String gender,
    required String phoneNumber,
  }) async =>
      await _userRepository.addUserData(
        UserData(
          id: id,
          name: name,
          email: email,
          isEmailVerified: isEmailVerified,
          dob: dob,
          gender: gender,
          phoneNumber: phoneNumber,
        ),
      );
}
