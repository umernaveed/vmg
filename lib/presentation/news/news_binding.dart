import 'package:get/get.dart';
import 'package:we_ship_faas/app/core/get_di.dart';
import 'package:we_ship_faas/domain/repositories/remote_repository.dart';
import 'package:we_ship_faas/presentation/news/news_controller.dart';

class NewsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      NewsController(
        remoteRepository: find<RemoteRepository>(),
      ),
    );
  }
}
