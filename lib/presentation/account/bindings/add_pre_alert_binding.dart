import 'package:get/get.dart';
import 'package:we_ship_faas/app/core/get_di.dart';
import 'package:we_ship_faas/app/services/file_picker_service.dart';
import 'package:we_ship_faas/domain/repositories/remote_repository.dart';
import 'package:we_ship_faas/presentation/account/controllers/add_alert_controller.dart';

class AddPreControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      AddPreAlertController(
          remoteRepository: find<RemoteRepository>(),
          filePickerService: find<FilePickerService>()),
    );
  }
}
