import 'package:flutter/material.dart';

import '../../infrastructures/utils/constants/utils.dart';

class CustomScaffold extends StatelessWidget {
  final bool extendBodyBehindAppBar;
  final bool extendBody;
  final bool hasTopSafeArea;
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final EdgeInsetsGeometry? contentPadding;

  const CustomScaffold({
    this.floatingActionButton,
    this.appBar,
    this.hasTopSafeArea = true,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.body,
    this.bottomNavigationBar,
    this.contentPadding,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => Scaffold(
        extendBody: extendBody,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        appBar: appBar,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        body: _body(),
      );

  Widget _body() => SafeArea(
        top: hasTopSafeArea,
        child: Padding(
          padding: contentPadding ??
              EdgeInsets.symmetric(
                horizontal: utils.mediumSpace,
                vertical: utils.smallSpace,
              ),
          child: body,
        ),
      );
}
