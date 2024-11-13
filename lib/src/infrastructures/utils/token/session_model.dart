
class SessionModel {
  final String id;
  final DateTime expireDate;

  SessionModel({
    required this.id,
    required this.expireDate,
  });

  factory SessionModel.fromJson(final Map<String, dynamic> json) =>
      SessionModel(
          id: json['id'],
          expireDate:
              DateTime.fromMillisecondsSinceEpoch((json['exp'] as int) * 1000));
}
