import 'package:get/get.dart';
import 'package:we_ship_faas/app/core/get_di.dart';
import 'package:we_ship_faas/domain/repositories/local_repository.dart';
import 'package:we_ship_faas/domain/repositories/remote_repository.dart';
import 'package:we_ship_faas/presentation/delivery/controllers/manage_pickup_request_controller.dart';

class ManagePickUpRequestBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      ManagePickUpRequestController(
        remoteRepository: find<RemoteRepository>(),
        localRepository: find<LocalRepository>(),
      ),
    );
  }
}
