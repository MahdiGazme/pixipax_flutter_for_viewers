import 'package:flutter/material.dart';
import 'package:milky_http_client/milky_http_client.dart';

import '../../../flutter_booof_module.dart';
import '../../shared/widget/custom_snack_bar.dart';
import '../utils/constants/utils.dart';
import 'interceptors/authorize_interceptor.dart';
import 'interceptors/offline_caching_interceptor.dart';
import 'interceptors/token_interceptor.dart';

class HttpClientUtils {
  MilkyHttpClient httpClient({
    final String? baseUrl,
    final Map<String, dynamic>? headers,
    final bool showError = true,
    final bool cacheMode = false,
  }) =>
      MilkyHttpClient(
        baseUrl: baseUrl ?? booofModuleParameters.fullBaseUrl,
        headers: headers,
        handleExceptionCallBack: (final exception) =>
            handleException(exception, showError: showError),
        sendTimeout: utils.defaultTimeOutDuration,
        connectTimeout: utils.defaultTimeOutDuration,
        receiveTimeout: utils.defaultTimeOutDuration,
        interceptors: [
          TokenInterceptor(),
          if(cacheMode) OfflineCachingInterceptor(),
          AuthorizeInterceptor(),
        ],
      );

  void handleException(
    final String exceptionKey, {
    final bool showError = true,
  }) {
    if (exceptionKey == 'cancel') {
      return;
    }

    if (showError) {
      // shows snack bar with translated exception if translate exists
      CustomSnackBar.snackBar(
        'Error',
        '',
        messageText: Text(
          _translateException(
            exceptionKey,
          ),
        ),
      );
    }
  }

  String _translateException(final String exceptionKey) {
    const String prefix = 'flutter_sample_app_exceptions';
    final String key = '$prefix$exceptionKey';
    return 'Other - $exceptionKey';

    // return _isKnownException(key) ? key.tr : 'Other - $exceptionKey';
  }
//
// bool _isKnownException(final String exceptionKey) =>
//     Locales.fa_IR.containsKey(exceptionKey);
}

final httpClientUtils = HttpClientUtils();
