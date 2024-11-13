class RefreshTokenDto {
  final String refreshKey;

  RefreshTokenDto({
    required this.refreshKey,
  });

  Map<String, dynamic> toJson() => {
        'refresh': refreshKey,
      };
}
