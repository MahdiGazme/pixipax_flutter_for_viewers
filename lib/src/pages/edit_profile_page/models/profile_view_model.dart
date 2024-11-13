class ProfileViewModel {
  final String? avatarId;
  final String fullName;
  final String socialSecurity;
  final String email;

  ProfileViewModel({
    required this.fullName,
    required this.email,
    required this.socialSecurity,
    this.avatarId,
  });

  factory ProfileViewModel.fromJson(final Map<String, dynamic> json) =>
      ProfileViewModel(
        fullName: json['fullname'],
        email: json['email'],
        socialSecurity: json['social_security'],
        avatarId: json['avatar'],
      );
}
