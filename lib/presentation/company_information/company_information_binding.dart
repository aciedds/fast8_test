import 'package:fast8_test/presentation/address_information/address_information_controller.dart';
import 'package:fast8_test/presentation/company_information/company_information_controller.dart';
import 'package:get/get.dart';

class CompanyInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompanyInformationController());
  }
}
