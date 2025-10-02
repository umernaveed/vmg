import 'package:get/get.dart';
import 'package:we_ship_faas/app/core/get_di.dart';
import 'package:we_ship_faas/domain/repositories/remote_repository.dart';
import 'package:we_ship_faas/presentation/delivery/controllers/delivery_controller.dart';

class DeliveryBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      DeliveryController(
        remoteRepository: find<RemoteRepository>(),
      ),
    );
  }
}
