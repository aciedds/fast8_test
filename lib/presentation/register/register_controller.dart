import 'package:fast8_test/di/injection.dart';
import 'package:fast8_test/domain/usecase/register_uc.dart';
import 'package:fast8_test/presentation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final RegisterUc registerUc = inject<RegisterUc>();

  late TextEditingController emailTEC;
  late FocusNode emailFN;

  late TextEditingController passwordTEC;
  late FocusNode passwordFN;

  late TextEditingController firstNameTEC;
  late FocusNode firstNameFN;

  late TextEditingController lastNameTEC;
  late FocusNode lastNameFN;
  final fullName = ''.obs;
  final selectedDate = Rx<DateTime?>(null);
  final gender = ''.obs;
  final phoneNumber = ''.obs;
  final agreedToTerms = false.obs;

  @override
  void onInit() {
    super.onInit();
    initializeEmailTextField();
    initializePasswordTextField();
    initializeFirstNameTextField();
    initializeLastNameTextField();
  }

  void initializeEmailTextField() {
    emailTEC = TextEditingController();
    emailFN = FocusNode();
  }

  void initializePasswordTextField() {
    passwordTEC = TextEditingController();
    passwordFN = FocusNode();
  }

  void initializeFirstNameTextField() {
    firstNameTEC = TextEditingController();
    firstNameFN = FocusNode();
  }

  void initializeLastNameTextField() {
    lastNameTEC = TextEditingController();
    lastNameFN = FocusNode();
  }

  @override
  void dispose() {
    emailTEC.dispose();
    emailFN.dispose();
    passwordTEC.dispose();
    passwordFN.dispose();
    firstNameTEC.dispose();
    firstNameFN.dispose();
    lastNameTEC.dispose();
    lastNameFN.dispose();
    super.dispose();
  }

  void updateFullName(String name) {
    fullName.value = name;
  }

  void updateDate(DateTime date) {
    selectedDate.value = date;
  }

  void updateGender(String selectedGender) {
    gender.value = selectedGender;
  }

  void updatePhoneNumber(String phone) {
    phoneNumber.value = phone;
  }

  void toggleAgreement(bool? value) {
    agreedToTerms.value = value ?? false;
  }

  String get formattedDate {
    if (selectedDate.value == null) return '';
    final date = selectedDate.value!;
    return '${date.day}/${date.month}/${date.year}';
  }

  bool validateForm() {
    return fullName.isNotEmpty &&
        selectedDate.value != null &&
        gender.isNotEmpty &&
        phoneNumber.isNotEmpty &&
        agreedToTerms.value;
  }

  void register() async {
    final result = await registerUc.call(
      email: emailTEC.text,
      password: passwordTEC.text,
      firstName: firstNameTEC.text,
      lastName: lastNameTEC.text,
    );
    result.when(
      success: (data) => Get.offAllNamed(Routes.HOME),
      error: (message, data, exception, stackTrace, statusCode) =>
          Get.snackbar("Error", message),
    );
  }
}
