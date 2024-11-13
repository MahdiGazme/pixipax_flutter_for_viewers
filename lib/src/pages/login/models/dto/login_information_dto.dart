class LoginInformationDto {
  final String username;
  final String password;

  LoginInformationDto({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };
}
