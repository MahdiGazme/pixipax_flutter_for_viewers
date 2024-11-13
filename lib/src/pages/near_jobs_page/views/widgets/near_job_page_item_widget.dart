import 'package:flutter/material.dart';

import '../../../../infrastructures/themes/custom_theme.dart';
import '../../../../infrastructures/utils/constants/utils.dart';
import '../../../../shared/widget/dead_line_day_widget.dart';
import '../../../../shared/widget/jobs_estimate_widget.dart';
import '../../../../shared/widget/jobs_subtasks_and_location_widget.dart';
import '../../models/near_jobs_view_model.dart';

class NearJobPageItemWidget extends StatelessWidget {
  final NearJobsViewModel item;
  final void Function(String id) onTap;

  const NearJobPageItemWidget({
    required this.item,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => _body(context);

  Widget _body(final BuildContext context) => Padding(
        padding: utils.smallPadding,
        child: InkWell(
          onTap: () => onTap.call(item.address),
          borderRadius: _borderRadius(),
          child: _container(context),
        ),
      );

  Widget _container(final BuildContext context) => Material(
        borderRadius: _borderRadius(),
        elevation: 5,
        child: _contents(context),
      );

  Widget _contents(final BuildContext context) => Padding(
        padding: utils.smallPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _jobInfo(context),
            const Divider(),
            _details(context),
          ],
        ),
      );

  Widget _details(final BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _subtasksAndAddress(context),
          utils.tinyHorizontalSpacer,
          DeadLineDayWidget(time: item.deadLine),
        ],
      );

  Widget _subtasksAndAddress(final BuildContext context) =>
      JobsSubtasksAndLocationWidget(
        location: item.address,
        subtasks: item.subtasks,
        iconSize: 16,
        textStyle: Theme.of(context).textTheme.labelMedium,
      );

  Widget _jobInfo(final BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _storeNameAndEstimate(context),
          _payment(context),
        ],
      );

  Widget _storeNameAndEstimate(final BuildContext context) => Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _storeName(context),
            _estimate(context),
          ],
        ),
      );

  Widget _storeName(final BuildContext context) => Text(
        item.storeName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.headlineSmall,
      );

  Widget _estimate(final BuildContext context) => JobsEstimateWidget(
        estimate: item.estimate,
      );

  Widget _payment(final BuildContext context) => Text(
        '\$${item.payment.toInt()}',
        style: Theme.of(context).textTheme.headlineSmall,
      );

  BorderRadius _borderRadius() => BorderRadius.circular(
        customTheme.borderRadiusSemiRound,
      );
}
