import 'package:get/get.dart';
import 'package:we_ship_faas/app/core/get_di.dart';
import 'package:we_ship_faas/domain/repositories/remote_repository.dart';
import 'package:we_ship_faas/presentation/auth/controllers/reset_password_controller.dart';

class ResetPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      ResetPasswordController(remoteRepository: find<RemoteRepository>()),
    );
  }
}
