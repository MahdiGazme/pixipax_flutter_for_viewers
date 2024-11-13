class LoginResponseViewModel {
  final String token;
  final String refreshKey;

  LoginResponseViewModel({
    required this.token,
    required this.refreshKey,
  });

  factory LoginResponseViewModel.fromJson(
    final Map<String, dynamic> json,
  ) =>
      LoginResponseViewModel(
        token: json['token'],
        refreshKey: json['refresh'],
      );
}
