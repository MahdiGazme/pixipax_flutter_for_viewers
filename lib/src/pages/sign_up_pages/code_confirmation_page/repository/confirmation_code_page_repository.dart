import 'package:milky_http_client/milky_http_client.dart';

import '../../../../infrastructures/resources/http_client_utils.dart';
import '../../../../infrastructures/utils/constants/api_keys.dart';
import '../models/dto/confirmation_code_dto.dart';

class ConfirmationCodePageRepository {
  final _httpClient = httpClientUtils.httpClient();

  Future<Either<String, dynamic>> postConfirmationCode(
      final ConfirmationCodeDto dto) async {
    final resultOrException = await _httpClient.post(
      apiKeys.confirmCode,
      data: dto,
    );

    return resultOrException.fold(
      Left.new,
      (final result) => Right(result.data),
    );
  }
}
