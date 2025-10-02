import 'package:get/get.dart';
import 'package:we_ship_faas/app/core/get_di.dart';
import 'package:we_ship_faas/domain/repositories/remote_repository.dart';
import 'package:we_ship_faas/presentation/purchase/controllers/purchase_controller.dart';

class PurchaseBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PurchaseController(remoteRepository: find<RemoteRepository>()));
  }
}
