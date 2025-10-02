import 'package:get/get.dart';
import 'package:we_ship_faas/app/core/get_di.dart';
import 'package:we_ship_faas/domain/repositories/remote_repository.dart';
import 'package:we_ship_faas/presentation/controller/push_notification_navigation_controller.dart';
import 'package:we_ship_faas/presentation/dashboard/controllers/dashboard_address_controller.dart';
import 'package:we_ship_faas/presentation/dashboard/controllers/dashboard_controller.dart';
import 'package:we_ship_faas/presentation/dashboard/controllers/dashboard_packages_controller.dart';
import 'package:we_ship_faas/presentation/dashboard/controllers/dashboard_tabbar_controller.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DashboardTabBarController());
    Get.put(
      DashboardController(remoteRepository: find<RemoteRepository>()),
    );
    Get.put(
      DashboardAddressController(remoteRepository: find<RemoteRepository>()),
    );
    Get.put(
      DashboardPackagesController(remoteRepository: find<RemoteRepository>()),
    );
    Get.put(PushNotificationNavigationController());
  }
}
