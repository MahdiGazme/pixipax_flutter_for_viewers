class ActiveJobViewModel {
  final String storeName;
  final int totalSubtasks;
  final int doneSubtasks;
  final String location;
  final num latitude;
  final num longitude;

  ActiveJobViewModel({
    required this.storeName,
    required this.totalSubtasks,
    required this.doneSubtasks,
    required this.location,
    required this.latitude,
    required this.longitude,
  });

  factory ActiveJobViewModel.fromJson(
    final Map<String, dynamic> json,
  ) =>
      ActiveJobViewModel(
          storeName: json['storeName'],
          totalSubtasks: json['totalSubtasks'],
          doneSubtasks: json['doneSubtasks'],
          location: json['location'],
          latitude: json['latitude'],
          longitude: json['longitude']);
}
