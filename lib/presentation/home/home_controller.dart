import 'package:fast8_test/di/injection.dart';
import 'package:fast8_test/domain/entity/post/post_data.dart';
import 'package:fast8_test/domain/entity/user/user_data.dart';
import 'package:fast8_test/domain/usecase/get_current_user_uc.dart';
import 'package:fast8_test/domain/usecase/get_list_post_uc.dart';
import 'package:fast8_test/domain/usecase/get_post_uc.dart';
import 'package:fast8_test/state/view_state/view_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class HomeController extends GetxController {
  final GetCurrentUserUc getCurrentUserUc = inject<GetCurrentUserUc>();
  final GetListPostUc getListPostUseCase = inject<GetListPostUc>();
  final GetPostUc getPostUc = inject<GetPostUc>();

  late RefreshController refreshController;
  late TextEditingController filterTEC;
  late FocusNode filterFN;

  Rx<ViewState<UserData>> userData = const ViewState<UserData>.initial().obs;

  Rx<ViewState<List<PostData>>> listPostData =
      const ViewState<List<PostData>>.initial().obs;

  RxBool isFiltered = false.obs;

  var isBottomSheetExpanded = false.obs;
  String greetingMessage = 'Selamat Pagi';
  var selectedVoucherOption = 'Terpopuler'.obs;

  @override
  void onInit() {
    super.onInit();
    refreshController = RefreshController(initialRefresh: false);
    initializeFilterTextField();
    getUserData();
    getListPostData();
  }

  void initializeFilterTextField() {
    filterTEC = TextEditingController();
    filterFN = FocusNode();
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

  void getListPostData() async {
    isFiltered.value = false;
    listPostData.value = const ViewState.loading();
    final result = await getListPostUseCase.call();
    result.when(success: (data) {
      listPostData.value = ViewState.success(data: data);
    }, error: (message, data, exception, stackTrace, statusCode) {
      listPostData.value = ViewState.error(message: message);
    });
  }

  void getPostData() async {
    listPostData.value = const ViewState.loading();
    final result = await getPostUc.call(int.parse(filterTEC.text));
    result.when(success: (data) {
      listPostData.value = ViewState.success(data: [data]);
    }, error: (message, data, exception, stackTrace, statusCode) {
      listPostData.value = ViewState.error(message: message);
    });
  }

  // Update greeting based on time
  void updateGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      greetingMessage = 'Selamat Pagi';
    } else if (hour < 18) {
      greetingMessage = 'Selamat Siang';
    } else {
      greetingMessage = 'Selamat Malam';
    }
  }
}
