import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/utils/constants/utils.dart';
import '../../../../shared/widget/app_slogan_widget.dart';
import '../../../../shared/widget/custom_app_bar.dart';
import '../../../../shared/widget/custom_scaffold.dart';
import '../../../../shared/widget/secondary_logo_widget.dart';
import '../../../../shared/widget/wide_elevated_button.dart';
import '../controller/sign_up_page_controller.dart';
import 'widget/sign_up_page_form.dart';

class SignUpPage extends GetView<SignUpPageController> {
  const SignUpPage({super.key});

  @override
  Widget build(final BuildContext context) => CustomScaffold(
        appBar: _appBar(),
        body: Column(
          children: [
            _content(),
            utils.smallVerticalSpacer,
            _button(),
          ],
        ),
      );

  Widget _content() => const Expanded(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppSloganWidget(),
              SignUPPageForm(),
            ],
          ),
        ),
      );

  Widget _button() => Obx(
        () => WideElevatedButton(
          onPressed: controller.onJoinButtonTap,
          showLoading: controller.showLoading.value,
          title: 'Join',
        ),
      );

  CustomAppBar _appBar() => const CustomAppBar(
    title: SecondaryLogoWidget(),
  );
}
