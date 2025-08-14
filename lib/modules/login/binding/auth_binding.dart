import 'package:get/get.dart';
import 'package:webwork_task/modules/login/controllers/login_phonenumber_ctrl.dart';

class PhoneNumberAuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhoneNumberAuthController>(() => PhoneNumberAuthController());
  }
}
