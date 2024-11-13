import 'package:milky_http_client/milky_http_client.dart';

import '../../../flutter_booof_module.dart';
import '../../infrastructures/resources/http_client_utils.dart';
import '../../infrastructures/resources/interceptors/token_interceptor.dart';
import '../../infrastructures/utils/constants/api_keys.dart';
import '../../infrastructures/utils/constants/utils.dart';
import '../models/dto/refresh_token_dto.dart';
import '../models/refresh_token_view_model.dart';

class RefreshTokenRepository {
  final _httpClient = MilkyHttpClient(
    baseUrl: booofModuleParameters.fullBaseUrl,
    handleExceptionCallBack: httpClientUtils.handleException,
    connectTimeout: utils.defaultTimeOutDuration,
    receiveTimeout: utils.defaultTimeOutDuration,
    sendTimeout: utils.defaultTimeOutDuration,
    interceptors: [
      TokenInterceptor(),
    ],
  );

  Future<Either<String, RefreshTokenViewModel>> refreshToken(
      final RefreshTokenDto dto) async {
    final resultOrException = await _httpClient.put(
      apiKeys.refreshToken,
      data: dto,
    );

    return resultOrException.fold(
      Left.new,
      (final result) => Right(
        RefreshTokenViewModel.fromJson(result.data),
      ),
    );
  }
}
