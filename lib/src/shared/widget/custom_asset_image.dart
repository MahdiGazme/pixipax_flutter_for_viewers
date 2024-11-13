import 'package:flutter/material.dart';

class CustomAssetImage extends StatelessWidget {
  final String path;
  final double? height;
  final double? width;
  final Color? color;

  const CustomAssetImage({
    required this.path,
    this.height,
    this.color,
    this.width,
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => Image.asset(
        path,
        fit: BoxFit.fill,
        color: color,
        package: 'flutter_booof_module',
        height: height,
        width: width,
      );
}
