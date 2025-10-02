import 'package:get/get.dart';
import 'package:we_ship_faas/app/core/get_di.dart';
import 'package:we_ship_faas/app/services/image_service.dart';
import 'package:we_ship_faas/domain/repositories/local_repository.dart';
import 'package:we_ship_faas/domain/repositories/remote_repository.dart';
import 'package:we_ship_faas/presentation/account/controllers/update_profile_controller.dart';

class UpdateProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      UpdateProfileController(
        remoteRepository: find<RemoteRepository>(),
        localRepository: find<LocalRepository>(),
        imagePicker: find<IImagePicker>(),
      ),
    );
  }
}
