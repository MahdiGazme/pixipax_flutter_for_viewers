import 'package:milky_http_client/milky_http_client.dart';

import '../../../infrastructures/resources/http_client_utils.dart';
import '../../../infrastructures/utils/constants/api_keys.dart';
import '../models/active_job_view_model.dart';
import '../models/job_list_item_view_model.dart';

class JobListPageRepository {
  final _httpClient = httpClientUtils.httpClient();

  Future<Either<String, List<AvailableJobsViewModel>>> getJobs(
    final String query,
  ) async {
    final resultOrException = await _httpClient.get(
      apiKeys.jobsList(
        query,
      ),
    );

    return resultOrException.fold(
      Left.new,
      (final result) => Right(
        AvailableJobsViewModel.fromJson(
          result.data,
        ) as List<AvailableJobsViewModel>,
      ),
    );
  }

  Future<Either<String, ActiveJobViewModel>> getActiveJob() async {
    final resultOrException = await _httpClient.get(
      apiKeys.activeJob,
    );

    return resultOrException.fold(
      Left.new,
      (final result) => Right(
        ActiveJobViewModel.fromJson(
          result.data,
        ),
      ),
    );
  }
}
