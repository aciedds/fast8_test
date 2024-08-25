import 'package:fast8_test/domain/entity/user/user_data.dart';
import 'package:fast8_test/domain/repository/auth_repository.dart';
import 'package:fast8_test/domain/repository/user_repository.dart';
import 'package:fast8_test/state/data_state/data_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCurrentUserUc {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  GetCurrentUserUc(this._authRepository, this._userRepository);

  Future<DataState<UserData>> call() async {
    final result = await _authRepository.getCurrentUserData();
    return result.when(
      success: (data) async {
        final userData = await _userRepository.getUserData(data.uid);
        return userData.when(
          success: (data) {
            return DataState.success(data: data);
          },
          error: (message, data, exception, stackTrace, statusCode) {
            return DataState.error(message: message);
          },
        );
      },
      error: (message, data, exception, stackTrace, statusCode) {
        return DataState.error(message: message);
      },
    );
  }
}
