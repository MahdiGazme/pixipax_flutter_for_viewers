class CardPreviewViewModel {
  final String shortCardNumber;
  final String expireDate;

  CardPreviewViewModel({
    required this.expireDate,
    required this.shortCardNumber,
  });

  factory CardPreviewViewModel.fromJson(final Map<String, dynamic> json) =>
      CardPreviewViewModel(
        expireDate: json['expireDate'],
        shortCardNumber: json['shortCardNumber'],
      );
}
