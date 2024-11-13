import 'package:milky_http_client/milky_http_client.dart';

import '../../../../infrastructures/resources/http_client_utils.dart';
import '../../../../infrastructures/utils/constants/api_keys.dart';
import '../models/dto/card_information_dto.dart';

class CardFormPageRepository {
  final _httpClient = httpClientUtils.httpClient();

  Future<Either<String, String>> patchCardInfo(
    final CardInformationDto data,
  ) async {
    final resultOrException = await _httpClient.patch(
      apiKeys.patchCardInformation,
      data: data,
    );

    return resultOrException.fold(
      Left.new,
      (final result) => Right(
        result.data,
      ),
    );
  }
}
