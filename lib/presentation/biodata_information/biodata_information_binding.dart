
import 'package:fast8_test/presentation/biodata_information/biodata_information_controller.dart';
import 'package:get/get.dart';

class BiodataInformationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => BiodataInformationController());
  }

}