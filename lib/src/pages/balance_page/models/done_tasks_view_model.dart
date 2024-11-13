class DoneTasksViewModel {
  final String description;
  final String companyName;
  final String address;
  final int subtasks;
  final String? avatarId;
  final double payment;

  DoneTasksViewModel({
    required this.description,
    required this.companyName,
    required this.address,
    required this.subtasks,
    required this.payment,
    this.avatarId,
  });

  factory DoneTasksViewModel.fromJson(final Map<String, dynamic> json) =>
      DoneTasksViewModel(
        description: json['description'],
        companyName: json['companyName'],
        address: json['address'],
        subtasks: json['subtasks'],
        payment: json['payment'],
        avatarId: json['avatarId'],
      );
}

