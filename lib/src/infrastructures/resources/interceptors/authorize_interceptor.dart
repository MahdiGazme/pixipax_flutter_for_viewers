import 'package:get_storage/get_storage.dart';
import 'package:milky_http_client/milky_http_client.dart';
import '../../../../flutter_booof_module.dart';
import '../../../shared/models/dto/refresh_token_dto.dart';
import '../../../shared/repository/refresh_token_repository.dart';
import '../../../shared/widget/custom_snack_bar.dart';
import '../../utils/constants/storage_keys.dart';
import '../../utils/constants/utils.dart';
import '../../utils/log_out_handler.dart';
import '../../utils/token/token_info.dart';
import 'token_interceptor.dart';

class AuthorizeInterceptor extends Interceptor {
  /// isRefreshing flag is used to control whether a token refresh is already
  /// in progress.
  /// If it's in progress, subsequent requests will skip the refresh attempt
  /// until the first one completes.
  bool _isRefreshing = false;
  final _refreshTokenRepository = RefreshTokenRepository();

  @override
  void onError(
    final DioException err,
    final ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      _logOut();
    } else if (err.response?.statusCode == 412) {
      // check if refreshing
      if (!_isRefreshing) {
        _isRefreshing = true;
        final refreshKey = await _readFromStorage();
        if (refreshKey != null) {
          final dto = RefreshTokenDto(refreshKey: refreshKey);
          await _refreshToken(dto);
          handler.resolve(
            await _retry(
              err.requestOptions,
            ),
          );
        } else {
          _logOut();
        }
      }
    }

    super.onError(err, handler);
  }

  Future<Response<dynamic>> _retry(final RequestOptions requestOptions) async {
    final httpClient = MilkyHttpClient(
      baseUrl: booofModuleParameters.fullBaseUrl,
      interceptors: [
        TokenInterceptor(),
      ],
      connectTimeout: utils.defaultTimeOutDuration,
      receiveTimeout: utils.defaultTimeOutDuration,
      sendTimeout: utils.defaultTimeOutDuration,
    );

    final resultOrException = await httpClient.request(
      requestOptions.uri.path,
      options: Options(
        method: requestOptions.method,
        responseType: requestOptions.responseType,
        contentType: requestOptions.contentType,
      ),
      data: requestOptions.data,
    );

    return Response(
      data: resultOrException,
      requestOptions: requestOptions,
    );
  }

  Future<dynamic> _readFromStorage() async {
    final storage = GetStorage();
    final refreshKey = await storage.read(storageKeys.refreshTokenKey);
    return refreshKey;
  }

  void _logOut() {
    LogOutHandler().logOut();
    CustomSnackBar.snackBar(
      'Warning',
      'New Log-in is needed',
      hasBottomMargin: false,
    );
  }

  Future<void> _refreshToken(final RefreshTokenDto data) async {
    final resultOrException = await _refreshTokenRepository.refreshToken(data);

    resultOrException.fold(
      (final exception) => _logOut(),
      (final result) => tokenInfo.initialize(
        result.token,
        result.refreshKey,
      ),
    );
  }
}
