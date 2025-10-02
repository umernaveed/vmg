import 'package:get/get.dart';
import 'package:we_ship_faas/app/core/get_di.dart';
import 'package:we_ship_faas/domain/repositories/remote_repository.dart';
import 'package:we_ship_faas/presentation/account/controllers/get_delivery_packages_controller.dart';

class AllDeliveryPackagesBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      AllDeliveryPackagesController(remoteRepository: find<RemoteRepository>()),
    );
  }
}
