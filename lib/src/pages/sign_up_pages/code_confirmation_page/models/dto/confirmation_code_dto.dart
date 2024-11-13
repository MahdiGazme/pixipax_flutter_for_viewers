class ConfirmationCodeDto {
  final String code;

  ConfirmationCodeDto({
    required this.code,
  });

  Map<String, dynamic> toJson() => {
        'code': code,
      };
}
