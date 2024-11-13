import 'package:signature/signature.dart';

class SignaturePointsDto {
  final double padSize;
  final List<Point> points;

  SignaturePointsDto({
    required this.points,
    required this.padSize,
  });

  Map<String, dynamic> toJson() => {
        'padSize': padSize,
        'points': points
            .map(
              (final element) => {
                'dx': element.offset.dx,
                'dy': element.offset.dy,
                'pressure': element.pressure,
                'type': element.type.index,
              },
            )
            .toList(),
      };
}
