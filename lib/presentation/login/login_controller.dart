import 'package:fast8_test/di/injection.dart';
import 'package:fast8_test/domain/usecase/check_user_email_exist_uc.dart';
import 'package:fast8_test/domain/usecase/login_google_uc.dart';
import 'package:fast8_test/domain/usecase/login_uc.dart';
import 'package:fast8_test/presentation/register/args/register_args.dart';
import 'package:fast8_test/presentation/routes.dart';
import 'package:fast8_test/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final LoginUc loginUc = inject<LoginUc>();
  final DialogUtils dialogUtils = inject<DialogUtils>();
  final LoginGoogleUc loginGoogleUc = inject<LoginGoogleUc>();
  final CheckUserEmailExistUc checkUserEmailExistUc =
      inject<CheckUserEmailExistUc>();

  late TextEditingController emailTEC;
  late FocusNode emailFN;

  late TextEditingController passwordTEC;
  late FocusNode passwordFN;

  late TextEditingController confirmPasswordTEC;
  late FocusNode confirmPasswordFN;

  RxInt passwordFieldVisible = 0.obs;

  RxBool isPasswordVisible = true.obs;
  RxBool isConfirmPasswordVisible = true.obs;

  @override
  void onInit() {
    super.onInit();
    initializeEmailTextField();
    initializePasswordTextField();
    initializeConfirmPasswordTextField();
  }

  void initializeEmailTextField() {
    emailTEC = TextEditingController();
    emailFN = FocusNode();
  }

  void initializePasswordTextField() {
    passwordTEC = TextEditingController();
    passwordFN = FocusNode();
  }

  void initializeConfirmPasswordTextField() {
    confirmPasswordTEC = TextEditingController();
    confirmPasswordFN = FocusNode();
  }

  @override
  void dispose() {
    emailTEC.dispose();
    emailFN.dispose();
    passwordTEC.dispose();
    passwordFN.dispose();
    confirmPasswordTEC.dispose();
    confirmPasswordFN.dispose();
    super.dispose();
  }

  void proceedToLoginOrRegister(BuildContext context) {
    if (passwordFieldVisible.value == 0) {
      _checkEmailExist(context);
    } else if (passwordFieldVisible.value == 1) {
      _login(context);
    } else {
      _register(context);
    }
  }

  void _checkEmailExist(BuildContext context) async {
    dialogUtils.showLoading(context);
    final result = await checkUserEmailExistUc.call(email: emailTEC.text);
    result.when(
      success: (data) {
        dialogUtils.hideLoading(context);
        passwordFieldVisible.value = 1;
      },
      error: (message, data, exception, stackTrace, statusCode) {
        passwordFieldVisible.value = 2;
      },
    );
  }

  void _login(BuildContext context) async {
    dialogUtils.showLoading(context);
    final result = await loginUc.call(
      email: emailTEC.text,
      password: passwordTEC.text,
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

  void _register(BuildContext context) {
    Get.offNamed(
      Routes.REGISTER,
      arguments: RegisterArgs.register(
        email: emailTEC.text,
        password: passwordTEC.text,
      ),
    );
  }

  void loginWithGoogle(BuildContext context) async {
    dialogUtils.showLoading(context);
    final result = await loginGoogleUc.call();
    result.when(
      success: (data) async {
        final checkData = await checkUserEmailExistUc.call(email: data.email);
        checkData.when(success: (userData) {
          dialogUtils.hideLoading(context);
          Get.offAllNamed(Routes.HOME);
        }, error: (message, errData, exception, stackTrace, statusCode) {
          dialogUtils.hideLoading(context);
          Get.offNamed(
            Routes.REGISTER,
            arguments: RegisterArgs.googleSso(
              email: data.email,
              id: data.uid,
            ),
          );
        });
      },
      error: (message, data, exception, stackTrace, statusCode) {
        dialogUtils.hideLoading(context);
        Get.snackbar("Error", message);
      },
    );
  }
}
