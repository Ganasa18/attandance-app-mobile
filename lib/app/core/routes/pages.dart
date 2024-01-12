import 'package:get/get.dart';
import 'package:mobile_attandance/app/core/routes/names.dart';
import 'package:mobile_attandance/app/modules/absent/binding.dart';
import 'package:mobile_attandance/app/modules/export_pages.dart';
import 'package:mobile_attandance/app/modules/login/binding.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.FORGOT_PASSWORD,
      page: () => const ForgotPasswordPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.VERIFY_OTP,
      page: () => const OtpPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.RESET_PASSWORD,
      page: () => const ResetPasswordPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomePage(),
    ),
    GetPage(
      name: AppRoutes.ABSENT,
      page: () => AbsentPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(seconds: 1),
      binding: AbsentBinding(),
    ),
    GetPage(
      name: AppRoutes.ATTANDANCE,
      page: () => const AttandancePage(),
    ),
  ];
}
