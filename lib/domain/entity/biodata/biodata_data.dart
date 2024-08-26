import 'package:freezed_annotation/freezed_annotation.dart';

part 'biodata_data.freezed.dart';

@freezed
class BiodataData with _$BiodataData {
  const factory BiodataData({
    required String name,
    required String email,
    required String dob,
    required String gender,
    required String phoneNumber,
    required String education,
    required String maritalStatus,
  }) = _BiodataData;
}
