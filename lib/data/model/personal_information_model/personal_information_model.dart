import 'package:freezed_annotation/freezed_annotation.dart';

part 'personal_information_model.freezed.dart';
part 'personal_information_model.g.dart';

@freezed
class PersonalInformationModel with _$PersonalInformationModel {
  const factory PersonalInformationModel({
    //biodata
    String? name,
    String? email,
    String? dob,
    String? gender,
    String? phoneNumber,
    String? education,
    String? maritalStatus,
    //address
    String? ktpPhoto,
    String? nik,
    String? ktpAddress,
    String? province,
    String? city,
    String? district,
    String? subDistrict,
    String? postalCode,
    //company
    String? companyName,
    String? companyAddress,
    String? position,
    String? lengthOfService,
    String? incomeSource,
    String? grossYearlyIncome,
    String? bankName,
    String? bankAccountNumber,
    String? bankAccountName,
  }) = _PersonalInformationModel;

  factory PersonalInformationModel.fromJson(Map<String, dynamic> json) =>
      _$PersonalInformationModelFromJson(json);
}
