enum BooofRoleEnum {
  normal('normal');

  const BooofRoleEnum(this.value);

  final String value;

  factory BooofRoleEnum.fromValue(final String value) {
    switch (value) {
      case 'normal':
        return BooofRoleEnum.normal;
      default:
        return BooofRoleEnum.normal;
    }
  }
}
