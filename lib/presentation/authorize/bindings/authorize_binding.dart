import 'package:get/get.dart';
import 'package:we_ship_faas/presentation/dashboard/controllers/dashboard_tabbar_controller.dart';

class AuthorizeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DashboardTabBarController());
  }
}
