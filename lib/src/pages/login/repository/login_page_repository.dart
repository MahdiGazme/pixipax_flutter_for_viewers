import 'package:milky_http_client/milky_http_client.dart';

import '../../../infrastructures/resources/http_client_utils.dart';
import '../../../infrastructures/utils/constants/api_keys.dart';
import '../models/dto/login_information_dto.dart';
import '../models/login_response_view_model.dart';

class LoginPageRepository {
  final _httpClient = httpClientUtils.httpClient(
    cacheMode: true,
  );

  Future<Either<String, LoginResponseViewModel>> login(
      final LoginInformationDto dto) async {
    final resultOrException = await _httpClient.post(
      apiKeys.login,
      data: dto.toJson(),
    );

    return resultOrException.fold(
      Left.new,
      (final result) => Right(
        LoginResponseViewModel.fromJson(
          result.data,
        ),
      ),
    );
  }
}
