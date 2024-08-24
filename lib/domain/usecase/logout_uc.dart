import 'package:fast8_test/domain/repository/auth_repository.dart';
import 'package:fast8_test/state/data_state/data_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class LogoutUc {
  final AuthRepository _authRepository;

  LogoutUc(this._authRepository);

  Future<DataState<bool>> call() async => await _authRepository.logout();
}
