import 'package:flutter/material.dart';

import '../../infrastructures/themes/custom_theme.dart';
import '../../infrastructures/utils/constants/utils.dart';

class JobPagesAppBarLocationWidget extends StatelessWidget {
  final String location;

  const JobPagesAppBarLocationWidget({
    required this.location,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _titleText(context),
          utils.tinyVerticalSpacer,
          _location(context),
        ],
      );

  Widget _titleText(final BuildContext context) => const Text(
        'AVAILABLE JOBS',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );

  Widget _location(final BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _locationIcon(),
          _locationText(context),
        ],
      );

  Widget _locationText(final BuildContext context) => Text(
        location,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: customTheme.textColor.shade400,
              fontSize: 9,
            ),
      );

  Widget _locationIcon() => const Icon(
        Icons.location_on_outlined,
        size: 12,
      );
}
