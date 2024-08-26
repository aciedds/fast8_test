import 'package:fast8_test/presentation/address_information/address_information_controller.dart';
import 'package:get/get.dart';

class AddressInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddressInformationController());
  }
}
