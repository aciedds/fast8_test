import 'package:fast8_test/domain/entity/address/address_data.dart';
import 'package:fast8_test/domain/repository/personal_information_repository.dart';
import 'package:fast8_test/state/data_state/data_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAddressUc {
  final PersonalInformationRepository _personalInformationRepository;

  GetAddressUc(this._personalInformationRepository);

  DataState<AddressData> call() => _personalInformationRepository.getAddress();
}
