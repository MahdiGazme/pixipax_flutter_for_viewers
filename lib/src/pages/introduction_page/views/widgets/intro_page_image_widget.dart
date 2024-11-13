import 'package:flutter/material.dart';

import '../../../../infrastructures/utils/constants/asset_paths.dart';
import '../../../../shared/widget/custom_asset_image.dart';

class IntroPageImageWidget extends StatelessWidget {
  const IntroPageImageWidget({super.key});

  @override
  Widget build(final BuildContext context) => Expanded(
        child: LayoutBuilder(
          builder: (final context, final constraints) => CustomAssetImage(
            path: assetPaths.introductionImage,
            height: constraints.maxHeight,
          ),
        ),
      );
}
