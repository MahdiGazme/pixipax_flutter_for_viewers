import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/widget/custom_scaffold.dart';
import '../../../shared/widget/page_state_provider.dart';
import '../controller/balance_page_controller.dart';
import 'widgets/balance_page_app_bar.dart';
import 'widgets/balance_page_app_bar_heather_widget.dart';
import 'widgets/balance_page_list_container_widget.dart';

class BalancePage extends GetView<BalancePageController> {
  const BalancePage({super.key});

  @override
  Widget build(final BuildContext context) => CustomScaffold(
        contentPadding: EdgeInsets.zero,
        extendBodyBehindAppBar: true,
        hasTopSafeArea: false,
        body: _body(context),
      );

  Widget _body(final BuildContext context) => PageStateProvider(
        state: controller.state,
        onRetry: controller.onRetry,
        page: () => _content(context),
      );

  Widget _content(final BuildContext context) => DecoratedBox(
        decoration: _decoration(),
        child: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (
              final context,
              final b,
            ) =>
                [
              _appBar(),
            ],
            body: const BalancePageListContainerWidget(),
          ),
        ),
      );

  BalancePageAppBar _appBar() => BalancePageAppBar(
        onHelpIconTap: controller.onHelpButtonTap,
        headerMaxHeight: controller.headerMaxHeight,
        headerMinHeight: controller.headerMinHeight,
        flexibleSpace: _appBarHeather(),
      );

  BalancePageAppBarHeader _appBarHeather() => BalancePageAppBarHeader(
        maxHeight: controller.headerMaxHeight,
        minHeight: controller.headerMinHeight,
        totalBalance: controller.totalBalance.value,
        calculateExpandRatio: controller.calculateHeatherExpandRatio,
      );

  BoxDecoration _decoration() => BoxDecoration(
        gradient: _backgroundGradient(),
      );

  LinearGradient _backgroundGradient() => const LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        stops: [
          0.5,
          0.6,
          0.8,
          1,
        ],
        colors: [
          Color(0xff123583),
          Color(0xff572b82),
          Color(0xffbd477c),
          Color(0xfffec1a4),
        ],
      );
}
