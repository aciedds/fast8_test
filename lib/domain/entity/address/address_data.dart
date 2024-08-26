import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_data.freezed.dart';

@freezed
class AddressData with _$AddressData {
  const factory AddressData({
    required String ktpPhoto,
    required String nik,
    required String ktpAddress,
    required String province,
    required String city,
    required String district,
    required String subDistrict,
    required String postalCode,
  }) = _AddressData;
}
