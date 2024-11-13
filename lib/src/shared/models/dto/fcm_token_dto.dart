class FcmTokenDto {
  final String token;
  final String os;
  final String version;

  FcmTokenDto({
    required this.token,
    required this.os,
    required this.version,
  });

  Map<String , dynamic> toJson() => {
    'token' : token,
    'os' : os,
    'version' : version,
  };
}
