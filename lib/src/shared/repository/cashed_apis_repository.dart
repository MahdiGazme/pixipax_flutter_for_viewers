import 'package:milky_http_client/milky_http_client.dart';

import '../../../flutter_booof_module.dart';
import '../../infrastructures/resources/interceptors/token_interceptor.dart';
import '../../infrastructures/utils/constants/utils.dart';
import '../models/request_date_view_model.dart';

class CachedApisRepository {
  MilkyHttpClient get _httpClient => MilkyHttpClient(
        baseUrl: booofModuleParameters.fullBaseUrl,
        interceptors: [
          TokenInterceptor(),
        ],
        connectTimeout: utils.defaultTimeOutDuration,
        receiveTimeout: utils.defaultTimeOutDuration,
        sendTimeout: utils.defaultTimeOutDuration,
      );

  Future<Either<String, dynamic>> sendRequest(
    final RequestDateViewModel request,
  ) async {
    final resultOrException = await _httpClient.request(
      request.url,
      data: request.data,
      options: Options(
        method: request.method,
      ),
    );

    return resultOrException.fold(
      Left.new,
      (final result) => Right(
        result.data,
      ),
    );
  }
}
