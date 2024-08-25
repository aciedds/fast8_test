import 'package:fast8_test/presentation/personal_infomation/personal_information_controller.dart';
import 'package:get/get.dart';

class PersonalInformationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PersonalInformationController());
  }

}