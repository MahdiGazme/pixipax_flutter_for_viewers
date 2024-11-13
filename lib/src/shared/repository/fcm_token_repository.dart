import 'package:milky_http_client/milky_http_client.dart';

import '../../infrastructures/resources/http_client_utils.dart';
import '../../infrastructures/utils/constants/api_keys.dart';
import '../models/dto/fcm_token_dto.dart';

class FcmTokenRepository {
  final _httpClient = httpClientUtils.httpClient();

  Future<Either<String, String>> refreshToken(
    final FcmTokenDto data,
  ) async {
    final resultOrException = await _httpClient.patch(
      apiKeys.refreshFcmToken,
      data: data,
      disableHandleException: true,
    );

    return resultOrException.fold(
      Left.new,
      (final result) => Right((result.data as Map)['token']),
    );
  }
}
