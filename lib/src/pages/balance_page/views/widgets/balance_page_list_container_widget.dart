import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/themes/custom_theme.dart';
import '../../../../infrastructures/utils/constants/utils.dart';
import '../../controller/balance_page_controller.dart';
import 'balance_page_add_credit_card_widget.dart';
import 'balance_page_done_tasks_list_view.dart';
import 'balance_page_withdraw_widget.dart';

class BalancePageListContainerWidget extends GetView<BalancePageController> {
  const BalancePageListContainerWidget({
    super.key,
  });

  @override
  Widget build(final BuildContext context) => Column(
        children: [
          _creditCardAndWithdraw(),
          _listContainer(context),
        ],
      );

  Widget _listContainer(final BuildContext context) => Expanded(
        child: Container(
          decoration: _bodyDecoration(),
          child: Padding(
            padding: _contentPadding(),
            child: _contents(context),
          ),
        ),
      );

  EdgeInsets _contentPadding() => EdgeInsets.fromLTRB(
        utils.mediumSpace,
        utils.mediumSpace,
        utils.mediumSpace,
        0,
      );

  Widget _creditCardAndWithdraw() => SizedBox(
        height: 110,
        child: Obx(
          () => Opacity(
            opacity: Tween<double>(begin: 0.0, end: 1.0).evaluate(
              controller.withdrawAnimation.value,
            ),
            child: controller.hasCreditCard.value ? _addCard() : _withdraw(),
          ),
        ),
      );

  Widget _withdraw() => BalancePageWithdrawWidget(
        onTap: controller.onWithdrawTap,
      );

  Widget _addCard() => BalancePageAddCreditCardWidget(
        onTap: controller.onAddCardTap,
      );

  Widget _contents(final BuildContext context) => Column(
        children: [
          _doneTasksNumber(context),
          utils.mediumVerticalSpacer,
          _listView(),
        ],
      );

  Widget _listView() => const Expanded(
        child: BalancePageDoneTasksListView(),
      );

  Widget _doneTasksNumber(final BuildContext context) => Text(
        // TODO: fix this this is not a good way to get total tasks number
        '${controller.listViewHandler.list.length} Done Tasks',
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: customTheme.textColor.shade300,
            ),
      );

  BoxDecoration _bodyDecoration() => BoxDecoration(
        color: customTheme.bottomSheetBackgroundColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            customTheme.borderRadiusRound,
          ),
        ),
      );
}
