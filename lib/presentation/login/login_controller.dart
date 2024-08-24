import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fast8_test/di/injection.dart';
import 'package:fast8_test/domain/usecase/login_google_uc.dart';
import 'package:fast8_test/domain/usecase/login_uc.dart';
import 'package:fast8_test/presentation/routes.dart';

class LoginController extends GetxController {
  final LoginUc loginUc = inject<LoginUc>();
  final LoginGoogleUc loginGoogleUc = inject<LoginGoogleUc>();
  late TextEditingController emailTEC;
  late FocusNode emailFN;

  late TextEditingController passwordTEC;
  late FocusNode passwordFN;

  @override
  void onInit() {
    super.onInit();
    initializeEmailTextField();
    initializePasswordTextField();
  }

  void initializeEmailTextField() {
    emailTEC = TextEditingController();
    emailFN = FocusNode();
  }

  void initializePasswordTextField() {
    passwordTEC = TextEditingController();
    passwordFN = FocusNode();
  }

  @override
  void dispose() {
    emailTEC.dispose();
    emailFN.dispose();
    passwordTEC.dispose();
    passwordFN.dispose();
    super.dispose();
  }

  void login() async {
    await loginUc.call(email: emailTEC.text, password: passwordTEC.text).then(
          (value) => value.when(
            success: (data) => Get.offAllNamed(Routes.HOME),
            error: (message, data, exception, stackTrace, statusCode) =>
                Get.snackbar("Error", message),
          ),
        );
  }

  void signInWithGoogle() async {
    await loginGoogleUc.call().then(
          (value) => value.when(
            success: (data) => Get.offAllNamed(Routes.HOME),
            error: (message, data, exception, stackTrace, statusCode) {
              Get.snackbar("Error", message);
            },
          ),
        );
  }
}
