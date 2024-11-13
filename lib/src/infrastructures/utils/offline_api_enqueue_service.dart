import 'package:connectivity/connectivity.dart';

import '../../shared/enums/cached_apis_status_enum.dart';
import '../../shared/models/dto/request_date_dto.dart';
import '../../shared/models/request_date_view_model.dart';
import '../../shared/repository/cashed_apis_repository.dart';
import '../resources/cached_api_dao.dart';

class OfflineEnqueueService {
  bool _serviceRunning = false;

  final _dataBase = CachedApiDao();
  final _repository = CachedApisRepository();

  void startService() async {
    // Service is already running
    if (_serviceRunning == true) {
      return;
    }

    final connection = await Connectivity().checkConnectivity();

    // Should be online to process the queue
    if (connection == ConnectivityResult.none) {
      return;
    }

    _serviceRunning = true;

    // Search all the pending items in the queue
    final pendingItems = await _dataBase.getAllPendingApis();

    // If the queue doesn't have any items the service is stopped
    if (pendingItems.isEmpty) {
      _serviceRunning = false;
      return;
    }

    for (final item in pendingItems) {
      await _processItem(item);
    }

    _serviceRunning = false;
  }

  Future<void> addToQueue(final RequestDateDto dto) async {
    await _dataBase.insertApi(dto);
  }

  Future<void> _processItem(final RequestDateViewModel model) async {
    final resultOrException = await _repository.sendRequest(model);

    await resultOrException.fold(
      (final exception) async => _changeFailedRequestStatus(model),
      (final result) async => _dataBase.deleteApi(model.id),
    );
  }

  Future<void> _changeFailedRequestStatus(
      final RequestDateViewModel model) async {
    final dto = _createFailedDto(model);
    await _dataBase.updateApi(
      model.id,
      dto,
    );
  }

  RequestDateDto _createFailedDto(
    final RequestDateViewModel model,
  ) =>
      RequestDateDto(
        data: model.data,
        status: CachedApisStatusEnum.failed,
        method: model.method,
        url: model.url,
      );
}

final offlineEnqueueService = OfflineEnqueueService();
