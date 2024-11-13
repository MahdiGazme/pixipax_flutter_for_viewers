import 'package:milky_http_client/milky_http_client.dart';

import '../../../infrastructures/resources/http_client_utils.dart';
import '../../../infrastructures/utils/constants/api_keys.dart';
import '../models/dto/signature_points_dto.dart';
import '../models/signature_points_view_model.dart';

class ElectronicSignaturePageRepository {
  final _httpClient = httpClientUtils.httpClient();

  Future<Either<String, SignatureViewModel>> getPoints() async {
    final resultOrException = await _httpClient.get(apiKeys.getSignature);

    return resultOrException.fold(
      Left.new,
      (final result) => Right(
        SignatureViewModel.fromJson(
          result.data,
        ),
      ),
    );
  }

  Future<Either<String, String>> postPoints(
    final SignaturePointsDto data,
  ) async {
    final resultOrException = await _httpClient.post(
      apiKeys.postSignature,
      data: data,
      //TODO: remove disable handle token after api is provided
      disableHandleException: true,
    );

    return resultOrException.fold(
      Left.new,
      (final result) => Right(
        result.data,
      ),
    );
  }
}
