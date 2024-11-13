class PhoneConfirmationDto {
  final String phoneNumber;

  PhoneConfirmationDto({
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() => {
        'phone': phoneNumber,
      };
}
