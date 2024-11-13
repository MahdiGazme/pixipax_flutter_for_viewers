import 'package:flutter/material.dart';

import '../../../../infrastructures/themes/custom_theme.dart';
import '../../../../infrastructures/utils/constants/utils.dart';

class NotificationSettingSwitchWidget extends StatelessWidget {
  final bool value;

  final void Function({required bool value}) onChanged;

  final IconData icon;
  final String title;
  final String description;

  const NotificationSettingSwitchWidget({
    required this.value,
    required this.onChanged,
    required this.icon,
    required this.title,
    required this.description,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _action(context),
          const Divider(),
          _description(context),
        ],
      );

  Widget _description(final BuildContext context) => Text(
        description,
        maxLines: 2,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: customTheme.textColor.shade400,
            ),
      );

  Widget _action(final BuildContext context) => Row(
        children: [
          _icon(),
          utils.smallHorizontalSpacer,
          _title(context),
          _switch(),
        ],
      );

  Widget _switch() => Switch(
        value: value,
        onChanged: (final value) => onChanged(value: value),
      );

  Widget _title(final BuildContext context) => Expanded(
        child: Text(
          title,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      );

  Widget _icon() => Icon(
        icon,
        size: 27,
      );
}
