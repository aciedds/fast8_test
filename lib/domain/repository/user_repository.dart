import 'package:fast8_test/domain/entity/user/user_data.dart';
import 'package:fast8_test/state/data_state/data_state.dart';

abstract class UserRepository {
  Future<DataState<UserData>> getUserData(String uid);

  Future<DataState<UserData>> addUserData(UserData usersEntity);

  Future<DataState<bool>> updateName({
    required String id,
    required String name,
  });

  Future<DataState<bool>> updateVerifyEmail({
    required String id,
    required bool isEmailVerified,
  });

  Future<DataState<bool>> updateEmail({
    required String id,
    required String email,
  });

  Future<DataState<bool>> checkUserEmailExist({required String email});
}
