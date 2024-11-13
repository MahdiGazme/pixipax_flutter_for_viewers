import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infrastructures/utils/constants/nested_keys.dart';
import '../../../infrastructures/utils/constants/utils.dart';
import '../../../shared/widget/custom_app_bar.dart';
import '../../../shared/widget/custom_scaffold.dart';
import '../../../shared/widget/email_text_field.dart';
import '../../../shared/widget/password_text_field.dart';
import '../../../shared/widget/phone_number_text_field.dart';
import '../controller/authentication_page_controller.dart';

class AuthenticationPage extends GetView<AuthenticationPageController> {
  const AuthenticationPage({super.key});

  @override
  Widget build(final BuildContext context) => CustomScaffold(
        appBar: _appBar(),
        body: _body(),
      );

  Widget _body() => SingleChildScrollView(
        child: Column(
          children: [
            utils.giantVerticalSpacer,
            _phoneNumber(),
            utils.largeVerticalSpacer,
            _emailAndButton(),
            utils.largeVerticalSpacer,
            _password()
          ],
        ),
      );

  Widget _password() => Obx(
        () => PasswordTextField(
          isHided: controller.isPassHided.value,
          onObscuredChanged: (final value) =>
              controller.isPassHided.value = value,
          controller: controller.password,
        ),
      );

  Widget _emailAndButton() => Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _email(),
          utils.smallHorizontalSpacer,
          _button(),
        ],
      );

  Widget _button() => ElevatedButton(
        onPressed: controller.onResendTap,
        child: const Text('Resend'),
      );

  Widget _email() => Expanded(
        child: EmailTextField(
          controller: controller.email,
          validator: controller.phoneNumberValidator,
        ),
      );

  Widget _phoneNumber() => PhoneNumberTextField(
        controller: controller.phoneNumber,
        //TODO: crate a global class and put shared validator on it
        //TODO: move the validator in its own the class
        validator: controller.phoneNumberValidator,
      );

  CustomAppBar _appBar() => CustomAppBar(
        title: const Text('AUTHENTICATION'),
        nestedKey: nestedKeys.accountNestedKey,
      );
}
