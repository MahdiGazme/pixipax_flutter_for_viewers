class NearJobsViewModel {
  final String id;
  final int estimate;
  final String storeName;
  final double payment;
  final String address;
  final int subtasks;
  final DateTime deadLine;
  final double latitude;
  final double longitude;

  NearJobsViewModel({
    required this.id,
    required this.estimate,
    required this.storeName,
    required this.payment,
    required this.address,
    required this.subtasks,
    required this.deadLine,
    required this.latitude,
    required this.longitude,
  });

  factory NearJobsViewModel.fromJson(
    final Map<String, dynamic> json,
  ) =>
      NearJobsViewModel(
        id: json['id'],
        estimate: json['estimate'],
        storeName: json['storeName'],
        payment: json['payment'],
        address: json['address'],
        subtasks: json['subtasks'],
        deadLine: json['deadLine'],
        latitude: json['latitude'],
        longitude: json['latitude'],
      );
}
