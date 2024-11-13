import 'package:flutter/material.dart';

import '../../../../infrastructures/themes/custom_theme.dart';

class BalancePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function() onHelpIconTap;
  final Widget flexibleSpace;
  final double? headerMaxHeight;
  final double? headerMinHeight;

  const BalancePageAppBar({
    required this.onHelpIconTap,
    required this.flexibleSpace,
    this.headerMaxHeight,
    this.headerMinHeight,
    this.preferredSize = const Size.fromHeight(kToolbarHeight),
    super.key,
  });

  @override
  final Size preferredSize;

  @override
  Widget build(final BuildContext context) => Theme(
        data: _theme(context),
        child: SliverAppBar(
          pinned: true,
          title: _title(),
          flexibleSpace: flexibleSpace,
          leading: _helpIcon(),
          collapsedHeight: headerMinHeight,
          expandedHeight: headerMaxHeight,
        ),
      );

  Widget _title() => const Text(
        'AVAILABLE JOBS',
      );

  IconButton _helpIcon() => IconButton(
        icon: const Icon(
          Icons.help_outline_rounded,
        ),
        onPressed: onHelpIconTap,
      );

  ThemeData _theme(final BuildContext context) => Theme.of(context).copyWith(
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
              iconTheme: _iconTheme(),
              titleTextStyle: _textStyle(context),
            ),
      );

  IconThemeData _iconTheme() => IconThemeData(
        color: customTheme.textColor.shade50,
      );

  TextStyle _textStyle(final BuildContext context) =>
      Theme.of(context).textTheme.titleSmall!.copyWith(
            color: customTheme.textColor.shade50,
          );
}
