import 'package:fast8_test/di/injection.dart';
import 'package:fast8_test/domain/entity/biodata/biodata_data.dart';
import 'package:fast8_test/domain/usecase/add_biodata_uc.dart';
import 'package:fast8_test/domain/usecase/get_biodata_uc.dart';
import 'package:fast8_test/domain/usecase/get_current_user_uc.dart';
import 'package:fast8_test/presentation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BiodataInformationController extends GetxController {
  final GetCurrentUserUc _getCurrentUserUc = inject<GetCurrentUserUc>();
  final GetBiodataUc _getBiodataUc = inject<GetBiodataUc>();
  final AddBiodataUc _addBiodataUc = inject<AddBiodataUc>();

  late TextEditingController nameTEC;
  late FocusNode nameFN;

  late TextEditingController emailTEC;
  late FocusNode emailFN;

  late TextEditingController phoneNumberTEC;
  late FocusNode phoneNumberFN;

  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  RxString gender = ''.obs;
  RxString education = ''.obs;
  RxString maritalStatus = ''.obs;
  RxString email = ''.obs;

  @override
  void onInit() {
    super.onInit();
    initializeNameTextField();
    initializePhoneNumberTextField();
    initializeEmailTextField();
    getBioData();
  }

  void initializeNameTextField() {
    nameTEC = TextEditingController();
    nameFN = FocusNode();
  }

  void initializePhoneNumberTextField() {
    phoneNumberTEC = TextEditingController();
    phoneNumberFN = FocusNode();
  }

  void initializeEmailTextField() {
    emailTEC = TextEditingController();
    emailFN = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    nameTEC.dispose();
    nameFN.dispose();
    phoneNumberTEC.dispose();
    phoneNumberFN.dispose();
    emailTEC.dispose();
    emailFN.dispose();
  }

  void updateDate(DateTime date) {
    selectedDate.value = date;
  }

  void updateGender(String selectedGender) {
    gender.value = selectedGender;
  }

  void updateEducation(String selectedEducation) {
    education.value = selectedEducation;
  }

  void updateMaritalStatus(String selectedMaritalStatus) {
    maritalStatus.value = selectedMaritalStatus;
  }

  String get formattedDate {
    if (selectedDate.value == null) return '';
    final date = selectedDate.value!;
    return '${date.day}/${date.month}/${date.year}';
  }

  void getBioData() async {
    final result = _getBiodataUc();
    DateFormat dateFormat = DateFormat("dd-MM-yyyy");
    result.when(
      success: (data) {
        nameTEC.text = data.name;
        emailTEC.text = data.email;
        phoneNumberTEC.text = data.phoneNumber;
        gender.value = data.gender;
        selectedDate.value = dateFormat.parse(data.dob);
        education.value = data.education;
        maritalStatus.value = data.maritalStatus;
        email.value = data.email;
      },
      error: (message, data, exception, stackTrace, statusCode) {
        getUserData();
      },
    );
  }

  void getUserData() async {
    final result = await _getCurrentUserUc();
    DateFormat dateFormat = DateFormat("dd-MM-yyyy");
    result.when(
      success: (data) {
        nameTEC.text = data.name;
        emailTEC.text = data.email;
        phoneNumberTEC.text = data.phoneNumber;
        gender.value = data.gender;
        selectedDate.value = dateFormat.parse(data.dob);
        email.value = data.email;
      },
      error: (message, data, exception, stackTrace, statusCode) {
        Get.snackbar('Error', message);
      },
    );
  }

  void continueToAddressInformation() {
    _addBiodataUc(
      data: BiodataData(
        name: nameTEC.text,
        email: emailTEC.text,
        phoneNumber: phoneNumberTEC.text,
        dob: selectedDate.value!.toIso8601String(),
        gender: gender.value,
        education: education.value,
        maritalStatus: maritalStatus.value,
      ),
    );
    Get.offNamed(Routes.ADDRESS_INFORMATION);
  }
}
