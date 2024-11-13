import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infrastructures/themes/custom_theme.dart';
import '../../../infrastructures/utils/constants/asset_paths.dart';
import '../../../infrastructures/utils/constants/utils.dart';
import '../../../shared/widget/app_slogan_widget.dart';
import '../../../shared/widget/custom_app_bar.dart';
import '../../../shared/widget/custom_asset_image.dart';
import '../../../shared/widget/custom_scaffold.dart';
import '../../../shared/widget/password_text_field.dart';
import '../../../shared/widget/primary_text_field.dart';
import '../../../shared/widget/secondary_logo_widget.dart';
import '../../../shared/widget/wide_elevated_button.dart';
import '../controller/login_page_controller.dart';

class LoginPage extends GetView<LoginPageController> {
  const LoginPage({super.key});

  @override
  Widget build(final BuildContext context) => CustomScaffold(
        appBar: _appBar(),
        body: Column(
          children: [
            _form(context),
            _sendButton(),
          ],
        ),
      );

  Widget _form(final BuildContext context) => Expanded(
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                const AppSloganWidget(),
                _phoneNumberOrEmail(),
                utils.mediumVerticalSpacer,
                _password(),
              ],
            ),
          ),
        ),
      );

  Widget _sendButton() => Obx(
        () => WideElevatedButton(
          showLoading: controller.showLoading.value,
          onPressed: controller.onSendButtonTap,
          title: 'Send',
        ),
      );

  Widget _password() => Obx(
        () => PasswordTextField(
          controller: controller.passwordTextController,
          isHided: controller.isPasswordHided.value,
          onObscuredChanged: (
            final value,
          ) =>
              controller.isPasswordHided.value = value,
        ),
      );

  Widget _phoneNumberOrEmail() => PrimaryTextField(
        topLabel: 'Email / Phone Number',
        controller: controller.phoneNumberOrEmailTextController,
        validator: controller.phoneNumberAndEmailTextFieldValidator,
      );

  CustomAppBar _appBar() => const CustomAppBar(
        title: SecondaryLogoWidget(),
      );
}
