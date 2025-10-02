import 'package:get/get.dart';
import 'package:we_ship_faas/app/core/get_di.dart';
import 'package:we_ship_faas/domain/repositories/remote_repository.dart';
import 'package:we_ship_faas/presentation/unpaid_invoices/controllers/unpaid_invoices.dart';

class UnpaidInvoicesBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      UnpaidInvoicesController(
        remoteRepository: find<RemoteRepository>(),
      ),
    );
  }
}
