import 'package:milky_http_client/milky_http_client.dart';

import '../../../../infrastructures/resources/http_client_utils.dart';
import '../../../../infrastructures/utils/constants/api_keys.dart';
import '../models/card_preview_view_model.dart';

class CardPreviewPageRepository {
  final _httpClient = httpClientUtils.httpClient();

  Future<Either<String, CardPreviewViewModel?>> getCardInfo() async {
    final resultOrException = await _httpClient.get(apiKeys.getCardPreview);

    return resultOrException.fold(
      Left.new,
      (final result) {
        if (result.statusCode == 401) {
          return const Right(null);
        }
        return Right(
          CardPreviewViewModel.fromJson(result.data),
        );
      },
    );
  }
}
