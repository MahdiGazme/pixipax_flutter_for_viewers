import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/themes/custom_theme.dart';
import '../../../../infrastructures/utils/constants/nested_keys.dart';
import '../../../../infrastructures/utils/constants/utils.dart';
import '../../../../shared/widget/custom_app_bar.dart';
import '../../../../shared/widget/custom_scaffold.dart';
import '../controller/card_form_page_controller.dart';
import 'widget/card_form_page_form_widget.dart';

class CardFormPage extends GetView<CardFormPageController> {
  const CardFormPage({super.key});

  @override
  Widget build(final BuildContext context) => CustomScaffold(
        appBar: _appBar(),
        body: _body(context),
      );

  Widget _body(final BuildContext context) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            utils.largeVerticalSpacer,
            _title(context),
            utils.smallVerticalSpacer,
            _hint(context),
            utils.giantVerticalSpacer,
            const CardFormPageFormWidget(),
            utils.giantVerticalSpacer,
            _buttonAndDescription(context)
          ],
        ),
      );

  Widget _buttonAndDescription(final BuildContext context) => Row(
        children: [
          _lockIcon(),
          utils.tinyHorizontalSpacer,
          _securityDescription(context),
          _button()
        ],
      );

  Widget _button() => ElevatedButton(
        onPressed: controller.onAddCardTap,
        child: const Text('Add card'),
      );

  Widget _securityDescription(final BuildContext context) => Expanded(
        child: Text(
          'This form is secure and encrypted',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: customTheme.textColor.shade400,
              ),
        ),
      );

  Widget _lockIcon() => Icon(
        Icons.lock_outline_rounded,
        size: 15,
        color: customTheme.textColor.shade400,
      );

  Widget _hint(final BuildContext context) => Text(
        'Please enter your payment information',
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: customTheme.textColor.shade400,
            ),
      );

  Widget _title(final BuildContext context) => Text(
        'Payment Information',
        style: Theme.of(context).textTheme.displaySmall,
      );

  CustomAppBar _appBar() => CustomAppBar(
        title: const Text('CARD'),
        nestedKey: nestedKeys.accountNestedKey,
      );
}
