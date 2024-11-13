import 'package:milky_http_client/milky_http_client.dart';

import '../../../../infrastructures/resources/http_client_utils.dart';
import '../../../../infrastructures/utils/constants/api_keys.dart';

import '../models/dto/sign_up_dto.dart';
import '../models/sign_up_response_view_model.dart';

class SignUpPageRepository {
  final _httpClient = httpClientUtils.httpClient();

  Future<Either<String, SignUpResponseViewModel>> signUp(
      final SignUpDto dto) async {
    final resultOrException = await _httpClient.patch(
      apiKeys.dataConfirm,
      data: dto,
    );

    return resultOrException.fold(
      Left.new,
      (final result) => Right(
        SignUpResponseViewModel.fromJson(result.data),
      ),
    );
  }
}
