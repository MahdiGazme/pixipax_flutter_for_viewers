class AvailableJobsViewModel {
  final String storeName;
  final String location;
  final String description;
  final int estimate;
  final DateTime deadLine;
  final double payment;
  final int subtasks;

  AvailableJobsViewModel({
    required this.storeName,
    required this.deadLine,
    required this.location,
    required this.description,
    required this.estimate,
    required this.payment,
    required this.subtasks,
  });

  factory AvailableJobsViewModel.fromJson(final Map<String, dynamic> json) =>
      AvailableJobsViewModel(
        deadLine: json['deadLine'],
        storeName: json['companyName'],
        location: json['location'],
        description: json['description'],
        estimate: json['estimate'],
        payment: json['payment'],
        subtasks: json['subtasks'],
      );
}
