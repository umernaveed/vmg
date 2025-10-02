import 'package:get/get.dart';
import 'package:we_ship_faas/app/core/get_di.dart';
import 'package:we_ship_faas/domain/repositories/remote_repository.dart';
import 'package:we_ship_faas/presentation/purchase/controllers/add_purchase_controller.dart';
import 'package:we_ship_faas/presentation/purchase/controllers/purchase_controller.dart';

class AddPurchaseBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      AddPurchaseController(
        remoteRepository: find<RemoteRepository>(),
        purchaseController: find<PurchaseController>(),
      ),
    );
  }
}
