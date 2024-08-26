import 'package:fast8_test/presentation/address_information/address_information_binding.dart';
import 'package:fast8_test/presentation/address_information/address_information_view.dart';
import 'package:fast8_test/presentation/biodata_information/biodata_information_binding.dart';
import 'package:fast8_test/presentation/biodata_information/biodata_information_view.dart';
import 'package:fast8_test/presentation/company_information/company_information_binding.dart';
import 'package:fast8_test/presentation/company_information/company_information_view.dart';
import 'package:fast8_test/presentation/forgot_password/forgot_password_binding.dart';
import 'package:fast8_test/presentation/forgot_password/forgot_password_view.dart';
import 'package:fast8_test/presentation/home/home_binding.dart';
import 'package:fast8_test/presentation/home/home_view.dart';
import 'package:fast8_test/presentation/login/login_binding.dart';
import 'package:fast8_test/presentation/login/login_view.dart';
import 'package:fast8_test/presentation/onboarding/auth_middleware.dart';
import 'package:fast8_test/presentation/onboarding/onboarding_binding.dart';
import 'package:fast8_test/presentation/onboarding/onboarding_view.dart';
import 'package:fast8_test/presentation/profile/profile_binding.dart';
import 'package:fast8_test/presentation/profile/profile_view.dart';
import 'package:fast8_test/presentation/register/register_binding.dart';
import 'package:fast8_test/presentation/register/register_view.dart';
import 'package:fast8_test/presentation/reset_email/reset_email_binding.dart';
import 'package:fast8_test/presentation/reset_email/reset_email_view.dart';
import 'package:fast8_test/presentation/reset_password/reset_password_binding.dart';
import 'package:fast8_test/presentation/reset_password/reset_password_view.dart';
import 'package:fast8_test/presentation/routes.dart';
import 'package:get/get.dart';

class Pages {
  Pages._();

  static const initial = Routes.ONBOARDING;
  static final routes = [
    GetPage(
      name: Routes.ONBOARDING,
      page: () => const OnboardingView(),
      transition: Transition.rightToLeftWithFade,
      binding: OnboardingBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterView(),
      transition: Transition.rightToLeftWithFade,
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      transition: Transition.rightToLeftWithFade,
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      transition: Transition.rightToLeftWithFade,
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      transition: Transition.rightToLeftWithFade,
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => const ProfileView(),
      transition: Transition.rightToLeftWithFade,
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.RESET_PASSWORD,
      page: () => const ResetPasswordView(),
      transition: Transition.rightToLeftWithFade,
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: Routes.RESET_EMAIL,
      page: () => const ResetEmailView(),
      transition: Transition.rightToLeftWithFade,
      binding: ResetEmailBinding(),
    ),
    GetPage(
      name: Routes.BIODATA_INFORMATION,
      page: () => const BiodataInformationView(),
      transition: Transition.rightToLeftWithFade,
      binding: BiodataInformationBinding(),
    ),
    GetPage(
      name: Routes.ADDRESS_INFORMATION,
      page: () => const AddressInformationView(),
      transition: Transition.rightToLeftWithFade,
      binding: AddressInformationBinding(),
    ),
    GetPage(
      name: Routes.COMPANY_INFORMATION,
      page: () => const CompanyInformationView(),
      transition: Transition.rightToLeftWithFade,
      binding: CompanyInformationBinding(),
    ),
  ];
}
