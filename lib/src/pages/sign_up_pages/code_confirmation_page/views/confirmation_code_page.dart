import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/utils/constants/utils.dart';
import '../../../../shared/widget/app_slogan_widget.dart';
import '../../../../shared/widget/custom_app_bar.dart';
import '../../../../shared/widget/custom_scaffold.dart';
import '../../../../shared/widget/otp_text_field/otp_text_field.dart';
import '../../../../shared/widget/secondary_logo_widget.dart';
import '../../../../shared/widget/wide_elevated_button.dart';
import '../controller/confirmation_code_page_controller.dart';

class ConfirmationCodePage extends GetView<ConfirmationCodePageController> {
  const ConfirmationCodePage({super.key});

  @override
  Widget build(final BuildContext context) => CustomScaffold(
        appBar: _appBar(),
        body: Column(
          children: [
            _content(),
            utils.smallVerticalSpacer,
            _confirmButton(),
          ],
        ),
      );

  Widget _content() => Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AppSloganWidget(),
              _otpTextField(),
              // OtpTextFieldItem(controller: TextEditingController()),
            ],
          ),
        ),
      );

  Widget _otpTextField() => OtpTextField(
        length: 6,
        onCompleted: controller.onOtpCompleted,
        formKey: controller.formKey,
        validator: (final value) => controller.otpValidator(value!),
        hint: 'We\'ve sent a code to your number.',
      );

  Widget _confirmButton() => Obx(
        () => WideElevatedButton(
          showLoading: controller.showLoading.value,
          onPressed: controller.onConfirmButtonTep,
          title: 'Confirm',
        ),
      );

  CustomAppBar _appBar() => const CustomAppBar(
    title: SecondaryLogoWidget(),
  );
}
