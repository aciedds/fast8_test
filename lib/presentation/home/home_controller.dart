import 'package:fast8_test/di/injection.dart';
import 'package:fast8_test/domain/entity/user/user_data.dart';
import 'package:fast8_test/domain/usecase/get_current_user_uc.dart';
import 'package:fast8_test/domain/usecase/logout_uc.dart';
import 'package:fast8_test/presentation/routes.dart';
import 'package:fast8_test/state/view_state/view_state.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class HomeController extends GetxController {
  final GetCurrentUserUc getCurrentUserUc = inject<GetCurrentUserUc>();
  final LogoutUc logoutUc = inject<LogoutUc>();

  late RefreshController refreshController;

  Rx<ViewState<UserData>> userData = const ViewState<UserData>.initial().obs;

  RxString greetingMessage = 'Selamat Pagi'.obs;
  RxString selectedVoucherOption = 'Terpopuler'.obs;

  RxBool isBottomSheetExpanded = false.obs;

  @override
  void onInit() {
    super.onInit();
    refreshController = RefreshController(initialRefresh: false);
    updateGreeting();
    getUserData();
  }

  void getUserData() async {
    userData.value = const ViewState.loading();
    final result = await getCurrentUserUc.call();
    result.when(success: (data) {
      userData.value = ViewState.success(data: data);
    }, error: (message, data, exception, stackTrace, statusCode) {
      userData.value = ViewState.error(message: message);
    });
  }

  void updateGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      greetingMessage.value = 'Selamat Pagi';
    } else if (hour < 18) {
      greetingMessage.value = 'Selamat Siang';
    } else {
      greetingMessage.value = 'Selamat Malam';
    }
  }

  void logout() async {
    final result = await logoutUc.call();
    result.when(
      success: (data) => Get.offAllNamed(Routes.ONBOARDING),
      error: (message, data, exception, stackTrace, statusCode) =>
          Get.snackbar("Error", message),
    );
  }
}
