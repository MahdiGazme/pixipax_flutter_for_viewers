import 'package:milky_http_client/milky_http_client.dart';
import '../../infrastructures/resources/http_client_utils.dart';
import '../../infrastructures/utils/constants/api_keys.dart';

import '../../infrastructures/utils/constants/utils.dart';
import '../models/avatar_view_model.dart';

class AvatarRepository {
  final _httpClient = httpClientUtils.httpClient();

  Future<Either<String, AvatarViewModel>> uploadAvatar(
      final FormData avatar) async {

    final resultOrException = await _httpClient.patch(apiKeys.uploadAvatar,
        data: avatar,
        options: Options(
          headers: {'Content-Type': utils.formDataContentType},
        ));

    return resultOrException.fold(
      Left.new,
      (final result) => Right(
        AvatarViewModel.fromJson(result.data),
      ),
    );
  }
}
