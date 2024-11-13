class PhoneConfirmationResponseModel {
  final String token;
  final String refreshKey;
  final bool phoneVerified;
  final int? code;

  PhoneConfirmationResponseModel({
    required this.token,
    required this.refreshKey,
    required this.code,
    required this.phoneVerified,
  });

  factory PhoneConfirmationResponseModel.fromJson(
          final Map<String, dynamic> json) =>
      PhoneConfirmationResponseModel(
        code: json['code'],
        token: json['token'],
        //TODO: fix this after problem is fixed from back
        refreshKey: 'json[refresh]',
        phoneVerified: json['phone_verify'],
      );
}
