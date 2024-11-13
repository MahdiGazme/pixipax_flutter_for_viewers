class SignUpResponseViewModel {
  //TODO: clarify why sign up has a response but until then use this model
  final int role;

  SignUpResponseViewModel({
    required this.role,
  });

  factory SignUpResponseViewModel.fromJson(final Map<String, dynamic> json) =>
      SignUpResponseViewModel(
        role: json['role'],
      );
}
