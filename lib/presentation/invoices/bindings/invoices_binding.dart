import 'package:get/get.dart';
import 'package:we_ship_faas/app/core/get_di.dart';
import 'package:we_ship_faas/domain/repositories/remote_repository.dart';
import 'package:we_ship_faas/presentation/invoices/controller/invoices_controller.dart';

class InvoicesBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      InvoicesController(remoteRepository: find<RemoteRepository>()),
    );
  }
}
