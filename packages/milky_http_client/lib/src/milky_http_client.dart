import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'either.dart';
import 'logger_interceptor.dart';
import 'milky_http_client_resp.dart';

// Must be top-level function
dynamic _parseAndDecode(final String response) => json.decode(response);

Future<dynamic> parseJson(final String jsonString) =>
    compute(_parseAndDecode, jsonString);

const String exceptionTypeCancel = 'cancel';

const String exceptionTypeConnectTimeout = 'connectTimeout';

const String exceptionTypeSendTimeout = 'sendTimeout';

const String exceptionTypeReceiveTimeout = 'receiveTimeout';

const String exceptionTypeBadCertificate = 'badCertificate';

const String exceptionTypeConnectionError = 'badConnection';

const String exceptionTypeOther = 'other';

class MilkyHttpClient {
  final Duration? connectTimeout;
  final Duration? receiveTimeout;
  final Duration? sendTimeout;
  final String baseUrl;
  final List<Interceptor>? interceptors;
  final String? exceptionPrefix;
  final void Function(String exceptionKey)? handleExceptionCallBack;
  final Dio _dio;
  final CancelToken? cancelToken;

  MilkyHttpClient({
    required this.baseUrl,
    this.connectTimeout,
    this.receiveTimeout,
    this.sendTimeout,
    this.interceptors,
    this.handleExceptionCallBack,
    this.exceptionPrefix,
    final Map<String, dynamic>? headers,
    this.cancelToken,
  }) : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: connectTimeout,
            receiveTimeout: receiveTimeout,
            sendTimeout: sendTimeout,
            maxRedirects: 4,
            headers: headers,
          ),
        ) {
    (_dio.transformer as BackgroundTransformer).jsonDecodeCallback = parseJson;
    if (interceptors != null) {
      _dio.interceptors.addAll(interceptors!);
    }
    if (!kReleaseMode) {
      _dio.interceptors.add(LoggerInterceptor());
    }
  }

  Future<Either<String, MilkyHttpClientResponse<T>>> get<T>(
    final String url, {
    final bool disableHandleException = false,
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final CancelToken? cancelToken,
    final ProgressCallback? onReceiveProgress,
    final bool enableCancelToken = true,
  }) =>
      _run<T>(
        disableHandleException,
        () => _dio.get(
          '$baseUrl$url',
          queryParameters: queryParameters,
          options: options,
          cancelToken:
              cancelToken ?? (enableCancelToken ? this.cancelToken : null),
          onReceiveProgress: onReceiveProgress,
        ),
      );

  Future<Either<String, MilkyHttpClientResponse<T>>> request<T>(
    final String url, {
    final bool disableHandleException = false,
    final Map<String, dynamic>? queryParameters,
    final dynamic data,
    final Options? options,
    final CancelToken? cancelToken,
    final ProgressCallback? onReceiveProgress,
    final bool enableCancelToken = true,
  }) =>
      _run<T>(
        disableHandleException,
        () => _dio.request(
          '$baseUrl$url',
          queryParameters: queryParameters,
          options: options,
          cancelToken:
              cancelToken ?? (enableCancelToken ? this.cancelToken : null),
          data: data,
          onReceiveProgress: onReceiveProgress,
        ),
      );

  Future<Either<String, MilkyHttpClientResponse<T>>> post<T>(
    final String url, {
    final bool disableHandleException = false,
    final dynamic data,
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final CancelToken? cancelToken,
    final ProgressCallback? onSendProgress,
    final ProgressCallback? onReceiveProgress,
    final bool enableCancelToken = true,
  }) =>
      _run<T>(
        disableHandleException,
        () => _dio.post(
          '$baseUrl$url',
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken:
              cancelToken ?? (enableCancelToken ? this.cancelToken : null),
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
        ),
      );

  Future<Either<String, MilkyHttpClientResponse<T>>> put<T>(
    final String url, {
    final bool disableHandleException = false,
    final dynamic data,
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final CancelToken? cancelToken,
    final ProgressCallback? onSendProgress,
    final ProgressCallback? onReceiveProgress,
    final bool enableCancelToken = true,
  }) =>
      _run<T>(
        disableHandleException,
        () => _dio.put(
          '$baseUrl$url',
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken:
              cancelToken ?? (enableCancelToken ? this.cancelToken : null),
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
        ),
      );

  Future<Either<String, MilkyHttpClientResponse<T>>> patch<T>(
    final String url, {
    final bool disableHandleException = false,
    final dynamic data,
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final CancelToken? cancelToken,
    final ProgressCallback? onSendProgress,
    final ProgressCallback? onReceiveProgress,
    final bool enableCancelToken = true,
  }) =>
      _run<T>(
        disableHandleException,
        () => _dio.patch(
          '$baseUrl$url',
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken:
              cancelToken ?? (enableCancelToken ? this.cancelToken : null),
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
        ),
      );

  Future<Either<String, MilkyHttpClientResponse<T>>> delete<T>(
    final String url, {
    final bool disableHandleException = false,
    final dynamic data,
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final CancelToken? cancelToken,
    final bool enableCancelToken = true,
  }) =>
      _run<T>(
        disableHandleException,
        () => _dio.delete(
          '$baseUrl$url',
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken:
              cancelToken ?? (enableCancelToken ? this.cancelToken : null),
        ),
      );

  Future<Either<String, MilkyHttpClientResponse<dynamic>>> download(
    final String url,
    final String savePath, {
    final bool disableHandleException = false,
    final dynamic data,
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final CancelToken? cancelToken,
    final bool enableCancelToken = true,
    final void Function(int, int)? onReceiveProgress,
  }) =>
      _run<dynamic>(
        disableHandleException,
        () => _dio.download(
          url,
          savePath,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken:
              cancelToken ?? (enableCancelToken ? this.cancelToken : null),
          onReceiveProgress: onReceiveProgress,
        ),
      );

  Future<Either<String, MilkyHttpClientResponse<T>>> _run<T>(
    final bool disableHandleException,
    final Future<Response<T>> Function() requestCallback,
  ) async {
    try {
      final Response<T> response = await requestCallback();

      return Right(_toMilkyHttpClientResponse(response));
      //TODO: if you get errors or code does not work properly check dioError on catch
    } on DioException catch (dioError) {
      _logError(dioError.message);

      return _onDioError(dioError, disableHandleException);
    } catch (e, s) {
      _logError('$e\n$s');
      if (!disableHandleException) {
        handleExceptionCallBack?.call(exceptionTypeOther);
      }

      return const Left(exceptionTypeOther);
    }
  }

  MilkyHttpClientResponse<T> _toMilkyHttpClientResponse<T>(
    final Response<T> response,
  ) =>
      MilkyHttpClientResponse(
        data: response.data as T,
        headers: response.headers.map,
        statusCode: response.statusCode,
      );

  Left<String, T> _onDioError<T>(
    final DioException dioException,
    final bool disableHandleException,
  ) {
    final String exception = _getErrorKey(dioException);
    if (!disableHandleException) {
      handleExceptionCallBack?.call(exception);
    }

    return Left(exception);
  }

  String _getDioErrorResponseKey(final Response<dynamic>? response) {
    if (response?.statusCode == 500 && response!.data is Map) {
      return (response.data as Map?)?['error'] ?? exceptionTypeOther;
    }

    return '${exceptionPrefix ?? ''}${response?.statusCode ?? exceptionTypeOther}';
  }

  String _getErrorKey(final DioException dioException) {
    String exceptionKey;
    switch (dioException.type) {
      case DioExceptionType.badResponse:
        return _getDioErrorResponseKey(dioException.response);
      case DioExceptionType.cancel:
        exceptionKey = exceptionTypeCancel;
        break;
      case DioExceptionType.connectionTimeout:
        exceptionKey = exceptionTypeConnectTimeout;
        break;
      case DioExceptionType.sendTimeout:
        exceptionKey = exceptionTypeSendTimeout;
        break;
      case DioExceptionType.receiveTimeout:
        exceptionKey = exceptionTypeReceiveTimeout;
        break;
      case DioExceptionType.badCertificate:
        exceptionKey = exceptionTypeBadCertificate;
        break;
      case DioExceptionType.connectionError:
        exceptionKey = exceptionTypeConnectionError;
        break;
      case DioExceptionType.unknown:
        exceptionKey = exceptionTypeOther;
        break;
    }

    return '${exceptionPrefix ?? ''}$exceptionKey';
  }

  void _logError(final String? error) {
    if ((error?.isNotEmpty ?? false)) {
      if (kDebugMode) {
        print('\x1B[91m MilkyHttpClient - $error \x1B[0m');
      }
    }
  }
}

extension EitherExtensions<T> on Either<String, T> {
  Either<String, T>? get orNullOnCancel {
    if (left == exceptionTypeCancel) {
      return null;
    }

    return this;
  }
}
