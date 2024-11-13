class AvatarViewModel {
  final String avatarUrl;

  AvatarViewModel({
    required this.avatarUrl,
  });

  factory AvatarViewModel.fromJson(
    final Map<String, dynamic> json,
  ) =>
      AvatarViewModel(
        avatarUrl: json['avatar'],
      );
}
