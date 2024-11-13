import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infrastructures/utils/constants/utils.dart';
import '../../../shared/enums/widget_state_enum.dart';
import '../../../shared/widget/custom_scaffold.dart';
import '../../../shared/widget/secondary_logo_widget.dart';
import '../../../shared/widget/wide_elevated_button.dart';
import '../controller/introduction_page_controller.dart';
import 'widgets/intro_page_image_widget.dart';

class IntroductionPage extends GetView<IntroductionPageController> {
  const IntroductionPage({super.key});

  @override
  Widget build(final BuildContext context) => CustomScaffold(
        body: _body(context),
      );

  Align _body(final BuildContext context) => Align(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SecondaryLogoWidget(),
            utils.largeVerticalSpacer,
            _title(context),
            utils.giantVerticalSpacer,
            const IntroPageImageWidget(),
            utils.smallVerticalSpacer,
            _createAccountButton(),
            utils.mediumVerticalSpacer,
            _loginButton(),
          ],
        ),
      );

  Widget _title(
    final BuildContext context,
  ) =>
      Text(
        'It\'s time to make\n money smarter.',
        style: Theme.of(context).textTheme.displayMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      );

  Widget _loginButton() => WideElevatedButton(
        onPressed: controller.onLoginTap,
        state: WidgetStateEnum.secondary,
        title: 'Login',
      );

  Widget _createAccountButton() => WideElevatedButton(
        onPressed: controller.onCreateAnAccountTap,
        title: 'Create an account',
      );
}
