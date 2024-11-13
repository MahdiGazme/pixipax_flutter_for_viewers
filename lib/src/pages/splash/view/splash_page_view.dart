import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infrastructures/utils/constants/asset_paths.dart';
import '../../../infrastructures/utils/constants/utils.dart';
import '../../../shared/widget/custom_asset_image.dart';
import '../../../shared/widget/custom_scaffold.dart';
import '../controller/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(final BuildContext context) => CustomScaffold(
        body: _body(context),
      );

  Column _body(final BuildContext context) => Column(
        children: [
          _logo(context),
          _retryButton(),
        ],
      );

  Widget _logo(final BuildContext context) => Expanded(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _image(),
              utils.tinyVerticalSpacer,
              _name(context),
            ],
          ),
        ),
      );

  Widget _retryButton() => Align(
        child: Obx(
          () => controller.needToCheckConnection.value
              ? TextButton(
                  onPressed: controller.prepare,
                  child: const Text(
                    'Retry',
                  ),
                )
              : const SizedBox(),
        ),
      );

  Widget _name(final BuildContext context) => Text(
        'PixiPax',
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w600,
            ),
      );

  Widget _image() => CustomAssetImage(
        path: assetPaths.primaryLogo,
        height: utils.primaryLogoSize,
      );
}
