import 'package:get/get.dart';
import 'package:we_ship_faas/app/core/get_di.dart';
import 'package:we_ship_faas/domain/repositories/remote_repository.dart';
import 'package:we_ship_faas/presentation/account/controllers/refferal_users_controller.dart';

class RefferalUsersBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      RefferalUsersController(
        remoteRepository: find<RemoteRepository>(),
      ),
    );
  }
}
