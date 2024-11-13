import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/widget/milky_list_view.dart';
import '../../controller/balance_page_controller.dart';
import '../../models/done_tasks_view_model.dart';
import 'balance_page_done_tasks_item.dart';

class BalancePageDoneTasksListView extends GetView<BalancePageController> {
  const BalancePageDoneTasksListView({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => Obx(
        () => MilkyListView<DoneTasksViewModel>(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          items: controller.listViewHandler.list,
          itemBuilder: (final context, final item, final index) =>
              _listViewItem(item),
          showLoading: controller.listViewHandler.showLoading.value,
          hasMoreData: controller.listViewHandler.hasMoreData.value,
        ),
      );

  Widget _listViewItem(
    final DoneTasksViewModel item,
  ) =>
      BalancePageDoneTaskItemWidget(
        item: item,
      );
}
