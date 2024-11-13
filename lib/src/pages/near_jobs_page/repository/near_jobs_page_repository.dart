import 'package:milky_http_client/milky_http_client.dart';

import '../../../infrastructures/resources/http_client_utils.dart';
import '../../../infrastructures/utils/constants/api_keys.dart';
import '../models/near_jobs_view_model.dart';

class NearJobsPageRepository {
  final _httpClient = httpClientUtils.httpClient();

  Future<Either<String, List<NearJobsViewModel>>> getAllNearJobs() async {
    final resultOrException = await _httpClient.get(
      apiKeys.nearJobs('query'),
    );

    return resultOrException.fold(
      Left.new,
      (final result) => Right(
        result.data,
      ),
    );
  }
}
