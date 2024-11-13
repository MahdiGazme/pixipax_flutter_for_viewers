import 'package:flutter/material.dart';

import '../../infrastructures/themes/custom_theme.dart';

class DeadLineDayWidget extends StatelessWidget {
  final DateTime time;

  const DeadLineDayWidget({
    required this.time,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => Text(
        //TODO: use date time formatter
        'Until ${time.day} Nov',
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: customTheme.textColor.shade400,
            ),
      );
}
