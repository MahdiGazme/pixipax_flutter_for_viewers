import 'package:milky_http_client/milky_http_client.dart';

import '../../../infrastructures/resources/http_client_utils.dart';
import '../../../infrastructures/utils/constants/api_keys.dart';
import '../models/profile_view_model.dart';

class EditProfilePageRepository {
  final _httpClient = httpClientUtils.httpClient();

  Future<Either<String, ProfileViewModel>> getProfile() async {
    final resultOrException = await _httpClient.get(
      apiKeys.getProfile,
    );

    return resultOrException.fold(
      Left.new,
      (final result) => Right(
        ProfileViewModel.fromJson(
          result.data,
        ),
      ),
    );
  }
}
