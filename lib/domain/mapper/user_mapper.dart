import 'package:fast8_test/data/model/user_model/user_model.dart';
import 'package:fast8_test/domain/entity/user/user_data.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UserMapper {
  UserData mapModelToEntity(UserModel data) {
    return UserData(
      id: data.id ?? '-',
      name: data.name ?? '-',
      email: data.email ?? '-',
      isEmailVerified: data.isEmailVerified ?? false,
      dob: data.dob ?? '-',
      gender: data.gender ?? '-',
      phoneNumber: data.phoneNumber ?? '-',
    );
  }

  UserModel mapEntityToModel(UserData data) {
    return UserModel(
      id: data.id,
      name: data.name,
      email: data.email,
      isEmailVerified: data.isEmailVerified,
      dob: data.dob,
      gender: data.gender,
      phoneNumber: data.phoneNumber,
    );
  }
}
