import 'package:get/get.dart';
import 'package:we_ship_faas/data/models/invoice/invoice.dart';
import 'package:we_ship_faas/data/models/requests/offset_request/offset_request.dart';
import 'package:we_ship_faas/domain/repositories/remote_repository.dart';
import 'package:we_ship_faas/presentation/mixin/pagination_service.dart';

class InvoicesController extends GetxController
    with PaginationService<Invoice> {
  final RemoteRepository _remoteRepository;

  InvoicesController({required RemoteRepository remoteRepository})
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
  Future<List<Invoice>> listener(int pageKey, {String keyToSearch = ''}) async {
    final res = await _remoteRepository.getAllInvoices(OffsetRequest(
      offset: pageKey.toString(),
      keyword: keyToSearch,
    ));
    return res.data.invoices;
  }
}
