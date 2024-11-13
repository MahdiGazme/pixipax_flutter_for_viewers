import 'package:flutter/material.dart';

import '../../infrastructures/themes/custom_theme.dart';
import '../../infrastructures/utils/constants/asset_paths.dart';
import '../../infrastructures/utils/constants/utils.dart';
import 'custom_asset_image.dart';

class SecondaryLogoWidget extends StatelessWidget {
  const SecondaryLogoWidget({super.key});

  @override
  Widget build(final BuildContext context) => CustomAssetImage(
        width: utils.secondaryLogoSize,
        color: customTheme.primaryColor,
        path: assetPaths.secondaryLogo,
      );
}
