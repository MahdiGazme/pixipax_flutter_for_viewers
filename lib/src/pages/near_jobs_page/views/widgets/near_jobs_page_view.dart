import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/utils/constants/utils.dart';
import '../../controller/near_jobs_page_controller.dart';
import 'near_job_page_item_widget.dart';

class NearJobsPageView extends GetView<NearJobsPageController> {
  const NearJobsPageView({super.key});

  @override
  Widget build(final BuildContext context) => Positioned(
        bottom: utils.mediumSpace,
        child: SizedBox(
          // Because item has a vertical padding == utils.smallSpace
          height: 135 + (utils.smallSpace * 2),
          width: MediaQuery.of(context).size.width,
          child: _pageView(),
        ),
      );

  PageView _pageView() => PageView.builder(
        controller: controller.pageViewController,
        onPageChanged: controller.onPageChanged,
        itemCount: controller.jobList.length,
        itemBuilder: (final context, final index) => _item(index),
      );

  dynamic _item(final int index) => NearJobPageItemWidget(
        onTap: controller.onJobListItemTap,
        item: controller.jobList[index],
      );
}
