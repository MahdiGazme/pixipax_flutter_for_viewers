import 'package:connectivity/connectivity.dart';
import 'package:milky_http_client/milky_http_client.dart';

import '../../../shared/enums/cached_apis_status_enum.dart';
import '../../../shared/models/dto/request_date_dto.dart';
import '../../utils/offline_api_enqueue_service.dart';

class OfflineCachingInterceptor extends Interceptor {
  @override
  void onRequest(
    final RequestOptions options,
    final RequestInterceptorHandler handler,
  ) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      final dto = RequestDateDto(
        data: options.data,
        status: CachedApisStatusEnum.pending,
        method: options.method,
        url: options.uri.path,
      );
      await offlineEnqueueService.addToQueue(dto);
    }

    super.onRequest(options, handler);
  }
}
