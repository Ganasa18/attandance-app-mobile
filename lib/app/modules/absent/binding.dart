import 'package:get/get.dart';
import 'package:mobile_attandance/app/modules/absent/controller.dart';

class AbsentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AbsentController(),
    );
  }
}
