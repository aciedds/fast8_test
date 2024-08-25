import 'package:fast8_test/domain/entity/auth/auth_data.dart';
import 'package:fast8_test/domain/entity/user/user_data.dart';
import 'package:fast8_test/domain/repository/auth_repository.dart';
import 'package:fast8_test/domain/repository/user_repository.dart';
import 'package:fast8_test/state/data_state/data_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUc {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  RegisterUc(this._authRepository, this._userRepository);

  Future<DataState<AuthData>> call({
    required String email,
    required String password,
    required String name,
    required String dob,
    required String gender,
    required String phoneNumber,
  }) async {
    final authResult = await _authRepository.registerWithAuthEmailPassword(
      email: email,
      password: password,
    );
    return authResult.when(
      success: (data) async {
        await Future.wait([
          _addDataToFireStore(
            authData: data,
            name: name,
            dob: dob,
            gender: gender,
            phoneNumber: phoneNumber,
          ),
          _updateName(name),
        ]);
        return DataState.success(data: data);
      },
      error: (message, code, statusCode, exception, stackTrace) {
        return DataState.error(message: message);
      },
    );
  }

  Future<DataState<AuthData>> _addDataToFireStore({
    required AuthData authData,
    required String name,
    required String dob,
    required String gender,
    required String phoneNumber,
  }) async {
    final result = await _userRepository.addUserData(
      UserData(
        name: name,
        isEmailVerified: authData.emailVerified,
        email: authData.email,
        id: authData.uid,
        dob: dob,
        gender: gender,
        phoneNumber: phoneNumber,
      ),
    );
    return result.when(
      success: (data) => DataState.success(data: authData),
      error: (message, data, exception, stackTrace, statusCode) {
        return DataState.error(message: message);
      },
    );
  }

  Future<bool> _updateName(String name) async {
    final result = await _authRepository.updateDisplayName(displayName: name);
    return result.when(
      success: (data) => true,
      error: (message, data, exception, stackTrace, statusCode) => false,
    );
  }
}
