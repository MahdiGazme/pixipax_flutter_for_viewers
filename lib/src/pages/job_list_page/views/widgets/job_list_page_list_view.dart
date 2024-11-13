import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/widget/milky_list_view.dart';
import '../../controller/job_list_page_controller.dart';
import '../../models/job_list_item_view_model.dart';
import 'job_list_page_list_item_widget.dart';

class JobListPageListView extends GetView<JobListPageController> {
  const JobListPageListView({
    super.key,
  });

  @override
  Widget build(final BuildContext context) =>
      MilkyListView<AvailableJobsViewModel>(
        itemBuilder: (
          final context,
          final item,
          final index,
        ) =>
            _listItem(item),
        items: controller.listViewHandler.list,
        showLoading: controller.listViewHandler.showLoading.value,
        hasMoreData: controller.listViewHandler.hasPagination,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
      );

  Widget _listItem(
    final AvailableJobsViewModel item,
  ) =>
      JobListPageListItemWidget(
        onTap: () {},
        hasActiveJob: controller.activeJob != null,
        item: item,
      );
}
