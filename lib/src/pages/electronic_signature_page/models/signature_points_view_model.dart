import 'dart:ui';

import 'package:signature/signature.dart';

class SignatureViewModel {
  final double padSize;
  final List<PointViewModel> points;

  SignatureViewModel({
    required this.points,
    required this.padSize,
  });

  factory SignatureViewModel.fromJson(
    final Map<String, dynamic> json,
  ) =>
      SignatureViewModel(
        points: List<PointViewModel>.from(
          (json['points'] as List).map(
            (final point) => PointViewModel.fromJson(
              point as Map<String, dynamic>,
            ),
          ),
        ),
        padSize: json['padSize'],
      );

  List<Point> toPoints() =>
      points.map((final point) => point.toPoint()).toList();
}

class PointViewModel {
  final double dx;
  final double dy;
  final PointType type;
  final double pressure;

  PointViewModel({
    required this.type,
    required this.dx,
    required this.dy,
    required this.pressure,
  });

  factory PointViewModel.fromJson(final Map<String, dynamic> json) =>
      PointViewModel(
        type: PointType.values[json['type']],
        dx: json['dx'],
        dy: json['dy'],
        pressure: json['pressure'],
      );

  PointViewModel copyWith({
    final double? dx,
    final double? dy,
    final PointType? type,
    final double? pressure,
  }) =>
      PointViewModel(
        type: type ?? this.type,
        dx: dx ?? this.dx,
        dy: dy ?? this.dy,
        pressure: pressure ?? this.pressure,
      );

  Point toPoint() => Point(
    Offset(
      dx,
      dy,
    ),
    type,
    pressure,
  );
}
