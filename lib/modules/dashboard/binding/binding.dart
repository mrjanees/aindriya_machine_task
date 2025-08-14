import 'package:get/get.dart';
import 'package:webwork_task/modules/dashboard/controller/dashboard_ctrl.dart';


class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashBoardController>(() => DashBoardController());
  }
}