import 'package:flutter/material.dart';

import '../../infrastructures/themes/custom_theme.dart';

class JobsEstimateWidget extends StatelessWidget {
  final int estimate;

  const JobsEstimateWidget({
    required this.estimate,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => Text(
        'About $estimate hour${estimate > 1 ? '\'s' : ''} of work',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: customTheme.textColor.shade400,
            ),
      );
}
