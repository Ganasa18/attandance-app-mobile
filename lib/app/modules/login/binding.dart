import 'package:get/get.dart';
import 'package:mobile_attandance/app/modules/login/controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginController(),
    );
  }
}
