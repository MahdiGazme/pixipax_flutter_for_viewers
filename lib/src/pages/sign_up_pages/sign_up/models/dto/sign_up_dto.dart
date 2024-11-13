class SignUpDto {
  final String fullName;
  final String socialSecurity;
  final String email;
  final String password;

  SignUpDto({
    required this.fullName,
    required this.socialSecurity,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'social_security': socialSecurity,
        'email': email,
        'password': password,
      };
}
