import 'package:fast8_test/di/injection.dart';
import 'package:fast8_test/domain/entity/user/user_data.dart';
import 'package:fast8_test/domain/usecase/get_current_user_uc.dart';
import 'package:fast8_test/domain/usecase/logout_uc.dart';
import 'package:fast8_test/presentation/routes.dart';
import 'package:fast8_test/state/view_state/view_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final GetCurrentUserUc getCurrentUserUc = inject<GetCurrentUserUc>();
  final LogoutUc logoutUc = inject<LogoutUc>();

  late TextEditingController firstNameTEC;
  late FocusNode firstNameFN;
  late TextEditingController lastNameTEC;
  late FocusNode lastNameFN;

  RxBool isEditingName = false.obs;
  Rx<ViewState<UserData>> userData = const ViewState<UserData>.initial().obs;

  @override
  void onInit() {
    super.onInit();
    getProfile();
    initializeFirstNameTexField();
    initializeLastNameTextField();
  }

  void initializeFirstNameTexField() {
    firstNameTEC = TextEditingController();
    firstNameFN = FocusNode();
  }

  void initializeLastNameTextField() {
    lastNameTEC = TextEditingController();
    lastNameFN = FocusNode();
  }

  @override
  void dispose() {
    firstNameTEC.dispose();
    firstNameFN.dispose();
    lastNameTEC.dispose();
    lastNameFN.dispose();
    isEditingName.value = false;
    super.dispose();
  }

  void logout() async {
    final result = await logoutUc.call();
    result.when(
      success: (data) => Get.offAllNamed(Routes.ONBOARDING),
      error: (message, data, exception, stackTrace, statusCode) =>
          Get.snackbar("Error", message),
    );
  }

  void getProfile() async {
    userData.value = const ViewState.loading();
    final result = await getCurrentUserUc.call();
    result.when(
      success: (data) => userData.value = ViewState.success(data: data),
      error: (message, data, exception, stackTrace, statusCode) {
        Get.snackbar("Error", message);
      },
    );
  }
}
