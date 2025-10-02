import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:we_ship_faas/data/models/get_all_package/get_all_package.dart';
import 'package:we_ship_faas/data/models/requests/offset_request/offset_request.dart';
import 'package:we_ship_faas/domain/repositories/remote_repository.dart';
import 'package:we_ship_faas/presentation/mixin/pagination_service.dart';

class AllDeliveryPackagesController extends GetxController
    with PaginationService<GetAllPackage> {
  final RemoteRepository _remoteRepository;

  AllDeliveryPackagesController({required RemoteRepository remoteRepository})
      : _remoteRepository = remoteRepository;

  @override
  void onInit() {
    initlizieController();
    super.onInit();
  }

  @override
  void onClose() {
    disposeController();
    super.onClose();
  }

  @override
  Future<List<GetAllPackage>> listener(
    int pageKey, {
    String keyToSearch = '',
  }) async {
    final result = await _remoteRepository.getAllPackages(OffsetRequest(
      offset: pageKey.toString(),
      keyword: keyToSearch,
    ));
    return result.data.packages;
  }
}
