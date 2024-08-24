import 'package:fast8_test/domain/entity/auth/auth_data.dart';
import 'package:fast8_test/domain/repository/auth_repository.dart';
import 'package:fast8_test/state/data_state/data_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginGoogleUc {
  final AuthRepository _authRepository;

  LoginGoogleUc(this._authRepository);

  Future<DataState<AuthData>> call() async =>
      await _authRepository.signInWithGoogle();
}
