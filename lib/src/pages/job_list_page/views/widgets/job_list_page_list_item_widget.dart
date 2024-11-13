import 'package:flutter/material.dart';

import '../../../../infrastructures/themes/custom_theme.dart';
import '../../../../infrastructures/utils/constants/utils.dart';
import '../../../../shared/widget/dead_line_day_widget.dart';
import '../../../../shared/widget/jobs_estimate_widget.dart';
import '../../../../shared/widget/jobs_subtasks_and_location_widget.dart';
import '../../models/job_list_item_view_model.dart';

class JobListPageListItemWidget extends StatelessWidget {
  final AvailableJobsViewModel item;
  final void Function() onTap;
  final bool hasActiveJob;

  const JobListPageListItemWidget({
    required this.item,
    required this.onTap,
    required this.hasActiveJob,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(
          vertical: utils.smallSpace,
        ),
        child: DecoratedBox(
          decoration: _decoration(),
          child: _body(context),
        ),
      );

  Widget _body(final BuildContext context) => Padding(
        padding: utils.mediumPadding,
        child: Column(
          children: [
            _profileAndPayment(context),
            utils.mediumVerticalSpacer,
            _descriptionAndDeadLine(context),
            _divider(),
            _buttonAndDetails(context),
          ],
        ),
      );

  Widget _divider() => Divider(
        height: 30,
        color: customTheme.disabledColor,
      );

  Widget _descriptionAndDeadLine(final BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _description(context),
          utils.mediumHorizontalSpacer,
          DeadLineDayWidget(time: item.deadLine),
        ],
      );

  Widget _description(final BuildContext context) => Expanded(
        child: Text(
          item.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      );

  Widget _buttonAndDetails(final BuildContext context) => Row(
        children: [
          _locationAndSubtasks(context),
          utils.smallHorizontalSpacer,
          _button(context),
        ],
      );

  Widget _button(final BuildContext context) => ElevatedButton(
        onPressed: hasActiveJob ? null : onTap,
        child: const Text(
          'Look at Job',
        ),
      );

  Widget _locationAndSubtasks(final BuildContext context) =>
      JobsSubtasksAndLocationWidget(
        subtasks: item.subtasks,
        location: item.location,
        iconSize: 20,
        textStyle: Theme.of(context).textTheme.bodyMedium,
      );

  Widget _profileAndPayment(final BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _storeInfo(context),
          _payment(context),
        ],
      );

  Widget _storeInfo(final BuildContext context) => Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _storeName(context),
            JobsEstimateWidget(estimate: item.estimate),
          ],
        ),
      );

  Widget _storeName(final BuildContext context) => Text(
        item.storeName,
        style: Theme.of(context).textTheme.headlineMedium,
      );

  Widget _payment(final BuildContext context) => Text(
        '\$${item.payment.toInt()}',
        style: Theme.of(context).textTheme.headlineSmall,
      );

  BoxDecoration _decoration() => BoxDecoration(
        color: customTheme.textColor.shade100,
        borderRadius: BorderRadius.circular(
          customTheme.borderRadiusSemiRound,
        ),
      );
}
