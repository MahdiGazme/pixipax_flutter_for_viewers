import 'package:flutter/material.dart';

import '../../../infrastructures/themes/custom_theme.dart';
import '../custom_asset_image.dart';

class BooofAssetSvgIcon extends StatelessWidget {
  final String path;
  final Color? color;
  final double? size;

  const BooofAssetSvgIcon({
    required this.path,
    this.size,
    this.color,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => CustomAssetImage(
        path: path,
        width: size,
        color: color ?? customTheme.textColor,
        height: size,
      );
}
