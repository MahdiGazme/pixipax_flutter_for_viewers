import 'package:flutter/material.dart';

import '../../../../infrastructures/themes/custom_theme.dart';
import '../../../../infrastructures/utils/constants/utils.dart';
import '../../../../shared/widget/milky_avatar_selector.dart';
import '../../../../shared/widget/jobs_subtasks_and_location_widget.dart';
import '../../models/done_tasks_view_model.dart';

class BalancePageDoneTaskItemWidget extends StatelessWidget {
  final DoneTasksViewModel item;

  const BalancePageDoneTaskItemWidget({
    required this.item,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => Container(
        margin: EdgeInsets.symmetric(
          vertical: utils.tinySpace,
        ),
        decoration: _bodyDecoration(),
        child: Padding(
          padding: utils.smallPadding,
          child: _contents(context),
        ),
      );

  Widget _contents(final BuildContext context) => Column(
        children: [
          _descriptionAndCompany(context),
          utils.largeVerticalSpacer,
          _details(context),
        ],
      );

  Widget _details(final BuildContext context) => Row(
        children: [
          _addressAndSubtask(context),
          _payment(context),
          utils.tinyHorizontalSpacer,
          _paymentLabel(context)
        ],
      );

  Widget _paymentLabel(final BuildContext context) => Text(
        'AUD total',
        style: _detailsTextStyle(context),
      );

  Widget _payment(final BuildContext context) => Text(
        '\$${item.payment.toInt()}',
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
              fontSize: 9,
            ),
      );

  Widget _addressAndSubtask(final BuildContext context) =>
      JobsSubtasksAndLocationWidget(
        iconSize: 10,
        textStyle: _detailsTextStyle(context),
        color: customTheme.textColor.shade600,
        subtasks: item.subtasks,
        location: item.address,
      );

  Widget _descriptionAndCompany(final BuildContext context) => Row(
        children: [
          _description(context),
          utils.mediumHorizontalSpacer,
          _companyWidget(context),
        ],
      );

  Widget _companyWidget(final BuildContext context) => DecoratedBox(
        decoration: _companyBadgeDecoration(),
        child: Padding(
          padding: utils.tinyPadding,
          child: Row(
            children: [
              _avatar(),
              utils.smallHorizontalSpacer,
              _companyName(context)
            ],
          ),
        ),
      );

  Widget _companyName(final BuildContext context) => Text(
        item.companyName,
        maxLines: 1,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: customTheme.primaryColor,
            ),
      );

  Widget _avatar() => CustomAvatarSelector(
        src: item.avatarId,
        size: 16,
      );

  BoxDecoration _companyBadgeDecoration() => BoxDecoration(
        color: customTheme.primaryColor.shade50,
        borderRadius: BorderRadius.circular(
          customTheme.borderRadiusCircular,
        ),
      );

  Widget _description(final BuildContext context) => Expanded(
        child: Text(
          'These are the base components that are not published.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      );

  BoxDecoration _bodyDecoration() => BoxDecoration(
        color: customTheme.backgroundColor,
        borderRadius: BorderRadius.circular(
          customTheme.borderRadiusSemiRound,
        ),
      );

  TextStyle _detailsTextStyle(final BuildContext context) =>
      Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 7,
          );
}
