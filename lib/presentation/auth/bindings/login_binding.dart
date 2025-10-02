import 'package:get/get.dart';
import 'package:we_ship_faas/app/core/get_di.dart';
import 'package:we_ship_faas/domain/repositories/local_repository.dart';
import 'package:we_ship_faas/domain/repositories/remote_repository.dart';
import 'package:we_ship_faas/presentation/auth/controllers/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      LoginController(
          remoteRepository: find<RemoteRepository>(),
          localRepository: find<LocalRepository>()),
    );
  }
}
