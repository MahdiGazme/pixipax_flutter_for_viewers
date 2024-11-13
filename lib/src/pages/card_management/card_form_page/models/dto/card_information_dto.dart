class CardInformationDto {
  final String cardNumber;
  final String expireDate;
  final String cvc;
  final String zipCode;

  CardInformationDto({
    required this.cardNumber,
    required this.expireDate,
    required this.cvc,
    required this.zipCode,
  });

  Map<String, dynamic> toJson() => {
        'cardNumber': cardNumber,
        'expiration': expireDate,
        'cvc': cvc,
        'zipCode': zipCode,
      };
}
