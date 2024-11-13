import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infrastructures/utils/constants/nested_keys.dart';
import '../../../infrastructures/utils/constants/utils.dart';
import '../../../shared/widget/custom_app_bar.dart';
import '../../../shared/widget/custom_scaffold.dart';
import '../../../shared/widget/job_pages_app_bar_location_widget.dart';
import '../../../shared/widget/page_state_provider.dart';
import '../../../shared/widget/search_text_field.dart';
import '../controller/near_jobs_page_controller.dart';
import '../models/jobs_marker_view_model.dart';
import 'widgets/near_jobs_page_map_marker_widget.dart';
import 'widgets/near_jobs_page_map_widget.dart';
import 'widgets/near_jobs_page_view.dart';

class NearJobsPage extends GetView<NearJobsPageController> {
  const NearJobsPage({super.key});

  @override
  Widget build(final BuildContext context) => CustomScaffold(
        contentPadding: EdgeInsets.zero,
        appBar: _appBar(),
        body: _body(context),
      );

  PageStateProvider _body(final BuildContext context) => PageStateProvider(
        state: controller.state,
        onRetry: controller.getJobs,
        page: () => _content(context),
      );

  Widget _content(final BuildContext context) => Stack(
        clipBehavior: Clip.none,
        children: [
          const NearJobsPageMapWidget(),
          ..._markerGenerator(),
          _searchTextField(),
          const NearJobsPageView(),
        ],
      );

  List<Widget> _markerGenerator() => controller.markers
      .map(
        _marker,
      )
      .toList();

  Widget _marker(final JobMarkersViewModel item) => NearJobsPageMapMarkerWidget(
        isSelected: controller.selectedJobId.value == item.id,
        item: item,
        onTap: controller.onMarkerTaped,
      );

  Widget _searchTextField() => SizedBox(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: utils.mediumSpace,
            vertical: utils.smallSpace,
          ),
          child: SearchTextField(
            controller: controller.searchText,
            hintText: 'Search job in location',
          ),
        ),
      );

  CustomAppBar _appBar() => CustomAppBar(
        nestedKey: nestedKeys.jobsListNestedKey,
        title: const JobPagesAppBarLocationWidget(
          location: 'Collingwood VIC',
        ),
      );
}
