class AccountDetailsViewModel {
  final String id;
  final String? avatarId;
  final String fullName;
  final String email;

  AccountDetailsViewModel({
    required this.id,
    required this.fullName,
    required this.email,
    this.avatarId,
  });

  factory AccountDetailsViewModel.fromJson(
    final Map<String, dynamic> json,
  ) =>
      AccountDetailsViewModel(
        id: json['id'],
        fullName: json['fullName'],
        avatarId: json['avatarId'],
        email: json['email'],
      );
}
