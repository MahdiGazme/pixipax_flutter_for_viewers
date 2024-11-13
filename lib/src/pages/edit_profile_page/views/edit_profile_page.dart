import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infrastructures/utils/constants/nested_keys.dart';
import '../../../infrastructures/utils/constants/utils.dart';
import '../../../shared/widget/custom_app_bar.dart';
import '../../../shared/widget/custom_date_picker.dart';
import '../../../shared/widget/custom_scaffold.dart';
import '../../../shared/widget/milky_avatar_selector.dart';
import '../../../shared/widget/page_state_provider.dart';
import '../../../shared/widget/password_text_field.dart';
import '../../../shared/widget/primary_text_field.dart';
import '../../../shared/widget/wide_elevated_button.dart';
import '../controller/edit_profile_page_controller.dart';

class EditProfilePage extends GetView<EditProfilePageController> {
  const EditProfilePage({super.key});

  @override
  Widget build(final BuildContext context) => CustomScaffold(
        appBar: _appBar(),
        body: _body(),
      );

  Widget _body() => PageStateProvider(
        state: controller.state,
        onRetry: controller.getProfileData,
        page: _content,
      );

  Widget _content() => Column(
        children: [
          _form(),
          _editButton(),
        ],
      );

  WideElevatedButton _editButton() =>
      WideElevatedButton(onPressed: () {}, title: 'Edit');

  Widget _form() => Expanded(
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _avatar(),
                utils.giantVerticalSpacer,
                _fullName(),
                utils.largeVerticalSpacer,
                _nationalId(),
                utils.largeVerticalSpacer,
                _email(),
                utils.largeVerticalSpacer,
                _password(),
              ],
            ),
          ),
        ),
      );

  Widget _fullName() => PrimaryTextField(
        topLabel: 'Full Name',
        controller: controller.fullName,
      );

  Widget _nationalId() => PrimaryTextField(
        topLabel: 'National id',
        controller: controller.nationalId,
      );

  Widget _email() => PrimaryTextField(
        topLabel: 'Email',
        controller: controller.email,
      );

  Widget _password() => PasswordTextField(
        controller: controller.password,
      );

  Widget _avatar() => Obx(
        () => CustomAvatarSelector(
          src: controller.avatar.value,
          selectorMode: true,
          size: 110,
          onUploadDone: (final avatarId) => controller.avatar.value = avatarId,
        ),
      );

  CustomAppBar _appBar() => CustomAppBar(
        title: const Text('Edit Profile'),
        nestedKey: nestedKeys.accountNestedKey,
      );
}
