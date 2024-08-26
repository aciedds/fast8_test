import 'dart:convert';

import 'package:fast8_test/data/model/personal_information_model/personal_information_model.dart';
import 'package:fast8_test/state/data_state/data_state.dart';
import 'package:fast8_test/utils/hive_utils.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PersonalInformationLocalSource {
  final HiveUtils _hiveUtils;
  final String _key = 'personal_information';

  PersonalInformationLocalSource(this._hiveUtils);

  DataState<bool> addBiodata({
    required String name,
    required String email,
    required String dob,
    required String gender,
    required String phoneNumber,
    required String education,
    required String maritalStatus,
  }) {
    try {
      final data = getPersonalData();
      return data.when(success: (data) {
        final temp = data.copyWith(
          name: name,
          email: email,
          dob: dob,
          gender: gender,
          phoneNumber: phoneNumber,
          education: education,
          maritalStatus: maritalStatus,
        );
        _hiveUtils.set(key: _key, data: jsonEncode(temp.toJson()));
        return const DataState.success(data: true);
      }, error: (message, data, exception, stackTrace, statusCode) {
        if (message == "Data not found") {
          final temp = PersonalInformationModel(
            name: name,
            email: email,
            dob: dob,
            gender: gender,
            phoneNumber: phoneNumber,
            education: education,
            maritalStatus: maritalStatus,
          );
          _hiveUtils.set(key: _key, data: jsonEncode(temp.toJson()));
          return const DataState.success(data: true);
        } else {
          return DataState.error(message: message);
        }
      });
    } catch (e) {
      return DataState.error(message: "Error: $e");
    }
  }

  DataState<bool> addAddress({
    required String ktpPhoto,
    required String nik,
    required String ktpAddress,
    required String province,
    required String city,
    required String district,
    required String subDistrict,
    required String postalCode,
  }) {
    try {
      final data = getPersonalData();
      return data.when(success: (data) {
        final temp = data.copyWith(
          ktpPhoto: ktpPhoto,
          nik: nik,
          ktpAddress: ktpAddress,
          province: province,
          city: city,
          district: district,
          subDistrict: subDistrict,
          postalCode: postalCode,
        );
        _hiveUtils.set(key: _key, data: jsonEncode(temp.toJson()));
        return const DataState.success(data: true);
      }, error: (message, data, exception, stackTrace, statusCode) {
        if (message == "Data not found") {
          final temp = PersonalInformationModel(
            ktpPhoto: ktpPhoto,
            nik: nik,
            ktpAddress: ktpAddress,
            province: province,
            city: city,
            district: district,
            subDistrict: subDistrict,
            postalCode: postalCode,
          );
          _hiveUtils.set(key: _key, data: jsonEncode(temp.toJson()));
          return const DataState.success(data: true);
        } else {
          return DataState.error(message: message);
        }
      });
    } catch (e) {
      return DataState.error(message: "Error: $e");
    }
  }

  DataState<bool> addCompany({
    required String companyName,
    required String companyAddress,
    required String position,
    required String lengthOfService,
    required String incomeSource,
    required String grossYearlyIncome,
    required String bankName,
    required String bankAccountNumber,
    required String bankAccountName,
  }) {
    try {
      final data = getPersonalData();
      return data.when(success: (data) {
        final temp = data.copyWith(
          companyName: companyName,
          companyAddress: companyAddress,
          position: position,
          lengthOfService: lengthOfService,
          incomeSource: incomeSource,
          grossYearlyIncome: grossYearlyIncome,
          bankName: bankName,
          bankAccountNumber: bankAccountNumber,
          bankAccountName: bankAccountName,
        );
        _hiveUtils.set(key: _key, data: jsonEncode(temp.toJson()));
        return const DataState.success(data: true);
      }, error: (message, data, exception, stackTrace, statusCode) {
        if (message == "Data not found") {
          final temp = PersonalInformationModel(
            companyName: companyName,
            companyAddress: companyAddress,
            position: position,
            lengthOfService: lengthOfService,
            incomeSource: incomeSource,
            grossYearlyIncome: grossYearlyIncome,
            bankName: bankName,
            bankAccountNumber: bankAccountNumber,
            bankAccountName: bankAccountName,
          );
          _hiveUtils.set(key: _key, data: jsonEncode(temp.toJson()));
          return const DataState.success(data: true);
        } else {
          return DataState.error(message: message);
        }
      });
    } catch (e) {
      return DataState.error(message: "Error: $e");
    }
  }

  DataState<PersonalInformationModel> getPersonalData() {
    try {
      final raw = _hiveUtils.get(key: _key);
      if (raw != null) {
        final data = PersonalInformationModel.fromJson(jsonDecode(raw));
        return DataState.success(data: data);
      } else {
        return const DataState.error(message: "Data not found");
      }
    } catch (e) {
      return DataState.error(message: "Error: $e");
    }
  }
}
