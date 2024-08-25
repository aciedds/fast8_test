import 'package:fast8_test/di/injection.dart';
import 'package:fast8_test/domain/usecase/add_user_data_uc.dart';
import 'package:fast8_test/domain/usecase/register_uc.dart';
import 'package:fast8_test/presentation/register/args/register_args.dart';
import 'package:fast8_test/presentation/routes.dart';
import 'package:fast8_test/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RegisterController extends GetxController {
  final RegisterUc registerUc = inject<RegisterUc>();
  final DialogUtils dialogUtils = inject<DialogUtils>();
  final AddUserDataUc addUserDataUc = inject<AddUserDataUc>();

  late RegisterArgs registerArgs;
  late TextEditingController nameTEC;
  late FocusNode nameFN;
  late TextEditingController phoneNumberTEC;
  late FocusNode phoneNumberFN;

  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  RxString gender = ''.obs;
  RxBool agreedToTerms = false.obs;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as RegisterArgs?;
    if (args != null) {
      registerArgs = args;
    }

    initializeNameTextField();
    initializePhoneNumberTextField();
  }

  void initializeNameTextField() {
    nameTEC = TextEditingController();
    nameFN = FocusNode();
  }

  void initializePhoneNumberTextField() {
    phoneNumberTEC = TextEditingController();
    phoneNumberFN = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    nameTEC.dispose();
    nameFN.dispose();
    phoneNumberTEC.dispose();
    phoneNumberFN.dispose();
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

  bool validateForm() {
    return nameTEC.text.isNotEmpty &&
        gender.isNotEmpty &&
        phoneNumberTEC.text.isNotEmpty &&
        agreedToTerms.value;
  }

  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    return formatter.format(date);
  }

  void proceedToRegister(BuildContext context) {
    final validate = validateForm();
    if (validate) {
      registerArgs.when(
        register: (email, password) => register(
          context,
          email: email,
          password: password,
        ),
        googleSso: (email, id) => addDataToFirebase(
          context,
          email: email,
          uid: id,
        ),
      );
    }
  }

  void addDataToFirebase(
    BuildContext context, {
    required String email,
    required String uid,
  }) async {
    dialogUtils.showLoading(context);
    final result = await addUserDataUc.call(
      id: uid,
      name: nameTEC.text,
      email: email,
      isEmailVerified: true,
      dob: formatDate(selectedDate.value!),
      gender: gender.value,
      phoneNumber: phoneNumberTEC.text,
    );
    result.when(
      success: (data) {
        dialogUtils.hideLoading(context);
        Get.offAllNamed(Routes.HOME);
      },
      error: (message, data, exception, stackTrace, statusCode) {
        dialogUtils.hideLoading(context);
        Get.snackbar("Error", message);
      },
    );
  }

  void register(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    dialogUtils.showLoading(context);
    final result = await registerUc.call(
      email: email,
      password: password,
      name: nameTEC.text,
      dob: formatDate(selectedDate.value!),
      gender: gender.value,
      phoneNumber: phoneNumberTEC.text,
    );
    result.when(
      success: (data) {
        dialogUtils.hideLoading(context);
        Get.offAllNamed(Routes.HOME);
      },
      error: (message, data, exception, stackTrace, statusCode) {
        dialogUtils.hideLoading(context);
        Get.snackbar("Error", message);
      },
    );
  }
}
