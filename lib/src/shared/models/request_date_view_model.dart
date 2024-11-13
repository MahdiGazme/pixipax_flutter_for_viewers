import '../enums/cached_apis_status_enum.dart';

class RequestDateViewModel {
  final int id;
  final CachedApisStatusEnum status;
  final String method;
  final String url;
  final dynamic data;

  RequestDateViewModel({
    required this.id,
    required this.data,
    required this.method,
    required this.status,
    required this.url,
  });

  factory RequestDateViewModel.fromJson({
    required final int id,
    required final Map<String, dynamic> json,
  }) =>
      RequestDateViewModel(
        id: id,
        method: json['method'],
        data: json['data'],
        status: CachedApisStatusEnum.fromStatus(
          json['status'],
        ),
        url: json['url'],
      );

  RequestDateViewModel copyWith({
    final int? id,
    final CachedApisStatusEnum? status,
    final String? method,
    final String? url,
    final dynamic data,
  }) =>
      RequestDateViewModel(
        id: id ?? this.id,
        data: data ?? this.data,
        method: method ?? this.method,
        status: status ?? this.status,
        url: url ?? this.url,
      );
}
