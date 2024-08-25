import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.freezed.dart';

@freezed
class UserData with _$UserData {
  const factory UserData({
    required String id,
    required String name,
    required String email,
    required bool isEmailVerified,
    required String dob,
    required String gender,
    required String phoneNumber,
  }) = _UserData;
}
