import 'package:fast8_test/domain/entity/biodata/biodata_data.dart';
import 'package:fast8_test/domain/entity/company/company_data.dart';
import 'package:fast8_test/domain/repository/personal_information_repository.dart';
import 'package:fast8_test/state/data_state/data_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCompanyUc {
  final PersonalInformationRepository _personalInformationRepository;

  GetCompanyUc(this._personalInformationRepository);

  DataState<CompanyData> call() => _personalInformationRepository.getCompany();
}
