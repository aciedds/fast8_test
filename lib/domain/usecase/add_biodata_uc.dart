import 'package:fast8_test/domain/entity/address/address_data.dart';
import 'package:fast8_test/domain/entity/biodata/biodata_data.dart';
import 'package:fast8_test/domain/repository/personal_information_repository.dart';
import 'package:fast8_test/state/data_state/data_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddBiodataUc {
  final PersonalInformationRepository _personalInformationRepository;

  AddBiodataUc(this._personalInformationRepository);

  DataState<bool> call({required BiodataData data}) =>
      _personalInformationRepository.addBiodata(data: data);
}
