import 'package:milky_http_client/milky_http_client.dart';

import '../../../infrastructures/resources/http_client_utils.dart';
import '../../../infrastructures/utils/constants/api_keys.dart';
import '../models/account_details_view_model.dart';

class AccountPageRepository {
  final _httpClient = httpClientUtils.httpClient();

  Future<Either<String, AccountDetailsViewModel>> getAccountDetails() async {
    final resultOrException = await _httpClient.get(apiKeys.getAccountDetails);

    return resultOrException.fold(
      Left.new,
      (final result) => Right(
        AccountDetailsViewModel.fromJson(
          result.data,
        ),
      ),
    );
  }
}
