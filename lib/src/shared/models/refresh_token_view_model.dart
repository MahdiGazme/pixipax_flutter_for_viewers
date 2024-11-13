class RefreshTokenViewModel {
  final String token;
  final String refreshKey;

  RefreshTokenViewModel({
    required this.token,
    required this.refreshKey,
  });

  factory RefreshTokenViewModel.fromJson(
    final Map<String, dynamic> json,
  ) =>
      RefreshTokenViewModel(
        token: json['token'],
        refreshKey: json['refreshKey'],
      );
}
