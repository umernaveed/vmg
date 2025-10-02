import 'package:get/get.dart';
import 'package:we_ship_faas/app/core/get_di.dart';
import 'package:we_ship_faas/domain/repositories/local_repository.dart';
import 'package:we_ship_faas/domain/repositories/remote_repository.dart';
import 'package:we_ship_faas/presentation/onboarding/controllers/on_boarding_controller.dart';

class OnBoardingBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      OnBoardingController(
        localRepository: find<LocalRepository>(),
        remoteRepository: find<RemoteRepository>(),
      ),
      permanent: true,
    );
  }
}
