import 'package:flutter/material.dart';

import '../../infrastructures/utils/constants/utils.dart';

class AppSloganWidget extends StatelessWidget {
  const AppSloganWidget({super.key});

  @override
  Widget build(final BuildContext context) => Column(
        children: [
          //TODO: fix this
          utils.giantVerticalSpacer,
          utils.giantVerticalSpacer,
          _title(context),
          utils.giantVerticalSpacer,
          utils.giantVerticalSpacer,
        ],
      );

  Widget _title(final BuildContext context) => Text(
        'An expert in capturing people\'s expressions.',
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
      );
}
