import 'package:milky_http_client/milky_http_client.dart';

import '../../../infrastructures/resources/http_client_utils.dart';
import '../../../infrastructures/utils/constants/api_keys.dart';
import '../models/done_tasks_view_model.dart';

class BalancePageRepository {
  final _httpClient = httpClientUtils.httpClient();

  Future<Either<String, List<DoneTasksViewModel>>> getDoneTasks(
    final String query,
  ) async {
    final resultOrException = await _httpClient.get(
      apiKeys.getDoneTasks(
        query,
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
