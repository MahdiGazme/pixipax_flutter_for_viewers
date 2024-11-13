import 'package:milky_http_client/milky_http_client.dart';
import '../../utils/constants/utils.dart';
import '../../utils/token/token_info.dart';

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(
    final RequestOptions options,
    final RequestInterceptorHandler handler,
  ) async {
    // await persistToken;

    if (options.responseType != ResponseType.bytes) {
      options.headers[Headers.contentTypeHeader] = utils.jsonContentType;
    }

    options.headers.addAll(tokenInfo.header());

    super.onRequest(options, handler);
  }
}
