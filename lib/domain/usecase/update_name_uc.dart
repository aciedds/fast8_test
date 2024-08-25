import 'package:fast8_test/domain/repository/auth_repository.dart';
import 'package:fast8_test/domain/repository/user_repository.dart';
import 'package:fast8_test/state/data_state/data_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateNameUc {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  UpdateNameUc(this._userRepository, this._authRepository);

  Future<DataState<bool>> call({
    required String id,
    required String name,
  }) async {
    final resultAuth = await _authRepository.updateDisplayName(
      displayName: name,
    );
    return resultAuth.when(
      success: (data) async =>
          await _userRepository.updateName(id: id, name: name),
      error: (message, data, exception, stackTrace, statusCode) {
        return DataState.error(message: message);
      },
    );
  }
}
