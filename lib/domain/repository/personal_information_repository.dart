import 'package:fast8_test/domain/entity/address/address_data.dart';
import 'package:fast8_test/domain/entity/biodata/biodata_data.dart';
import 'package:fast8_test/domain/entity/company/company_data.dart';
import 'package:fast8_test/state/data_state/data_state.dart';

abstract class PersonalInformationRepository {
  DataState<bool> addBiodata({required BiodataData data});

  DataState<BiodataData> getBiodata();

  DataState<bool> addCompany({required CompanyData data});

  DataState<CompanyData> getCompany();

  DataState<bool> addAddress({required AddressData data});

  DataState<AddressData> getAddress();
}
