import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infrastructures/utils/constants/utils.dart';
import '../../../shared/widget/custom_scaffold.dart';
import '../../../shared/widget/page_state_provider.dart';
import '../controller/job_list_page_controller.dart';
import 'widgets/job_list_page_active_job_widget.dart';
import 'widgets/job_list_page_app_bar.dart';
import 'widgets/job_list_page_list_view.dart';

class JobListPage extends GetView<JobListPageController> {
  const JobListPage({super.key});

  @override
  Widget build(final BuildContext context) => CustomScaffold(
        appBar: _appBar(),
        body: _body(context),
      );

  Widget _body(final BuildContext context) => PageStateProvider(
        onRetry: () {},
        state: controller.state,
        page: () => _content(context),
      );

  Widget _content(final BuildContext context) => NestedScrollView(
        headerSliverBuilder: (
          final context,
          final b,
        ) =>
            [
          if (controller.activeJob != null) _activeJob(),
          SliverToBoxAdapter(
            child: utils.giantVerticalSpacer,
          ),
          _jobStatusMessage(context),
          SliverToBoxAdapter(
            child: utils.mediumVerticalSpacer,
          ),
        ],
        body: const JobListPageListView(),
      );

  Widget _jobStatusMessage(final BuildContext context) => SliverToBoxAdapter(
        child: controller.activeJob != null
            ? _textMessage(
                context,
                'You have already accepted a job',
              )
            : _textMessage(
                context,
                //TODO: this can go wrong if pagination have been added
                '${controller.listViewHandler.list.length}'
                ' jobs found near to you',
              ),
      );

  Widget _textMessage(
    final BuildContext context,
    final String text,
  ) =>
      Text(
        text,
        style: Theme.of(context).textTheme.titleSmall,
        textAlign: TextAlign.center,
      );

  Widget _activeJob() => SliverPersistentHeader(
        delegate: PersistentHeaderDelegate(
          item: controller.activeJob!,
          onContinueTap: controller.onJobContinueTap,
        ),
        pinned: true,
      );

  JobListPageAppBar _appBar() => JobListPageAppBar(
        onNotificationsTap: controller.onNotificationsTap,
        location: 'Collingwood VIC',
      );
}
