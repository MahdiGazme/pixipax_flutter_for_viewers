enum CachedApisStatusEnum {
  pending(_pending),
  failed(_failed),
  ;

  const CachedApisStatusEnum(this.status);

  static const String _pending = 'PENDING';
  static const String _failed = 'FAILED';

  final String status;

  factory CachedApisStatusEnum.fromStatus(final String value) {
    switch (value) {
      case _failed:
        return CachedApisStatusEnum.failed;
      case _pending:
        return CachedApisStatusEnum.pending;

      default:
        return CachedApisStatusEnum.pending;
    }
  }
}
