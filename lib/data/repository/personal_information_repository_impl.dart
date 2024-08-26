import 'package:fast8_test/data/source/personal_information_local_source.dart';
import 'package:fast8_test/domain/entity/address/address_data.dart';
import 'package:fast8_test/domain/entity/biodata/biodata_data.dart';
import 'package:fast8_test/domain/entity/company/company_data.dart';
import 'package:fast8_test/domain/repository/personal_information_repository.dart';
import 'package:fast8_test/state/data_state/data_state.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PersonalInformationRepository)
class PersonalInformationRepositoryImpl
    implements PersonalInformationRepository {
  final PersonalInformationLocalSource _localSource;

  PersonalInformationRepositoryImpl(this._localSource);

  @override
  DataState<bool> addAddress({required AddressData data}) =>
      _localSource.addAddress(
        ktpPhoto: data.ktpPhoto,
        nik: data.nik,
        ktpAddress: data.ktpAddress,
        province: data.province,
        city: data.city,
        district: data.district,
        subDistrict: data.subDistrict,
        postalCode: data.postalCode,
      );

  @override
  DataState<bool> addBiodata({required BiodataData data}) =>
      _localSource.addBiodata(
        name: data.name,
        email: data.email,
        dob: data.dob,
        gender: data.gender,
        phoneNumber: data.phoneNumber,
        education: data.education,
        maritalStatus: data.maritalStatus,
      );

  @override
  DataState<bool> addCompany({required CompanyData data}) =>
      _localSource.addCompany(
        companyName: data.companyName,
        companyAddress: data.companyAddress,
        position: data.position,
        lengthOfService: data.lengthOfService,
        incomeSource: data.incomeSource,
        grossYearlyIncome: data.grossYearlyIncome,
        bankName: data.bankName,
        bankAccountNumber: data.bankAccountNumber,
        bankAccountName: data.bankAccountName,
      );

  @override
  DataState<AddressData> getAddress() {
    final data = _localSource.getPersonalData();
    return data.when(
      success: (data) {
        if (data.city == null &&
            data.district == null &&
            data.postalCode == null &&
            data.province == null &&
            data.subDistrict == null &&
            data.ktpAddress == null &&
            data.ktpPhoto == null &&
            data.nik == null) {
          return const DataState.error(message: "Data not found");
        }
        return DataState.success(
          data: AddressData(
            city: data.city ?? '-',
            district: data.district ?? '-',
            postalCode: data.postalCode ?? '-',
            province: data.province ?? '-',
            subDistrict: data.subDistrict ?? '-',
            ktpAddress: data.ktpAddress ?? '-',
            ktpPhoto: data.ktpPhoto ?? '-',
            nik: data.nik ?? '-',
          ),
        );
      },
      error: (message, data, exception, stackTrace, statusCode) {
        return DataState.error(message: message);
      },
    );
  }

  @override
  DataState<BiodataData> getBiodata() {
    final data = _localSource.getPersonalData();
    return data.when(
      success: (data) {
        if (data.name == null &&
            data.email == null &&
            data.dob == null &&
            data.gender == null &&
            data.phoneNumber == null &&
            data.education == null &&
            data.maritalStatus == null) {
          return const DataState.error(message: "Data not found");
        } else {
          return DataState.success(
            data: BiodataData(
              name: data.name ?? '-',
              email: data.email ?? '-',
              dob: data.dob ?? '-',
              gender: data.gender ?? '-',
              phoneNumber: data.phoneNumber ?? '-',
              education: data.education ?? '-',
              maritalStatus: data.maritalStatus ?? '-',
            ),
          );
        }
      },
      error: (message, data, exception, stackTrace, statusCode) {
        return DataState.error(message: message);
      },
    );
  }

  @override
  DataState<CompanyData> getCompany() {
    final data = _localSource.getPersonalData();
    return data.when(
      success: (data) {
        if (data.companyName == null &&
            data.companyAddress == null &&
            data.position == null &&
            data.lengthOfService == null) {
          return const DataState.error(message: "Data not found");
        } else {
          return DataState.success(
            data: CompanyData(
              bankAccountName: data.bankAccountName ?? '-',
              bankAccountNumber: data.bankAccountNumber ?? '-',
              bankName: data.bankName ?? '-',
              companyAddress: data.companyAddress ?? '-',
              companyName: data.companyName ?? '-',
              grossYearlyIncome: data.grossYearlyIncome ?? '-',
              incomeSource: data.incomeSource ?? '-',
              lengthOfService: data.lengthOfService ?? '-',
              position: data.position ?? '-',
            ),
          );
        }
      },
      error: (message, data, exception, stackTrace, statusCode) {
        return DataState.error(message: message);
      },
    );
  }
}
