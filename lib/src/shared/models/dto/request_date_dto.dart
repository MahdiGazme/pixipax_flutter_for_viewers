import '../../enums/cached_apis_status_enum.dart';

class RequestDateDto {
  final CachedApisStatusEnum status;
  final String method;
  final String url;
  final dynamic data;

  RequestDateDto({
    required this.data,
    required this.status,
    required this.method,
    required this.url,
  });

  Map<String, dynamic> toJson() => {
        'data': data,
        'method': method,
        'status': status.status,
        'url': url,
      };
}
