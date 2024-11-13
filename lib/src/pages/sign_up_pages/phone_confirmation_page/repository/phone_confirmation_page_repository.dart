import 'package:milky_http_client/milky_http_client.dart';

import '../../../../infrastructures/resources/http_client_utils.dart';
import '../../../../infrastructures/utils/constants/api_keys.dart';
import '../models/dto/phone_confirmation_dto.dart';
import '../models/phone_confirmation_response_model.dart';

class PhoneConfirmationPageRepository {
  final _httpClient = httpClientUtils.httpClient();

  Future<Either<String, PhoneConfirmationResponseModel>> postPhoneNumber(
      final PhoneConfirmationDto dto) async {
    final resultOrException = await _httpClient.post(
      apiKeys.phoneConfirmation,
      data: dto,
    );

    return resultOrException.fold(
      Left.new,
      (final result) => Right(
        PhoneConfirmationResponseModel.fromJson(result.data),
      ),
    );
  }
}
