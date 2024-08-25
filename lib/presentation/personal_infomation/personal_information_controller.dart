import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInformationController extends GetxController {
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
  RxBool agreedToTerms = false.obs;

  @override
  void onInit() {
    super.onInit();
    initializeNameTextField();
    initializePhoneNumberTextField();
    initializeEmailTextField();
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

  void toggleAgreement(bool? value) {
    agreedToTerms.value = value ?? false;
  }

  String get formattedDate {
    if (selectedDate.value == null) return '';
    final date = selectedDate.value!;
    return '${date.day}/${date.month}/${date.year}';
  }
}
