import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infrastructures/utils/constants/nested_keys.dart';
import '../../../shared/widget/custom_scaffold.dart';
import '../controller/dashboard_page_controller.dart';
import 'widgets/bottom_navigation.dart';

class DashboardPage extends GetView<DashboardPageController> {
  const DashboardPage({super.key});

  @override
  Widget build(final BuildContext context) => CustomScaffold(
        hasTopSafeArea: false,
        contentPadding: EdgeInsets.zero,
        body: _body(),
        bottomNavigationBar: _bottomNavigation(),
      );

  Widget _body() => Obx(
        () => IndexedStack(
          index: controller.bottomNavigationIndex.value,
          children: [
            _account(),
            _jobs(),
            _balance(),
          ],
        ),
      );

  Widget _bottomNavigation() => Obx(
        () => CustomBottomNavigationBar(
          currentIndex: controller.bottomNavigationIndex.value,
          onTap: (final index) =>
              controller.bottomNavigationIndex.value = index,
        ),
      );

  Widget _account() => Navigator(
        key: Get.nestedKey(
          nestedKeys.accountNestedKey,
        ),
        //TODO: check what is the problem that when you give value it show error
        // initialRoute: 'routeNames.balance',
        onGenerateRoute: controller.accountRouteGenerator,
      );

  Widget _jobs() => Navigator(
        key: Get.nestedKey(
          nestedKeys.jobsListNestedKey,
        ),
        //TODO: check what is the problem that when you give value it show error
        // initialRoute: 'routeNames.jobList',
        onGenerateRoute: controller.jobsRouteGenerator,
      );

  Widget _balance() => Navigator(
        key: Get.nestedKey(
          nestedKeys.balanceNestedKey,
        ),
        //TODO: check what is the problem that when you give value it show error
        // initialRoute: 'routeNames.balance',
        onGenerateRoute: controller.balanceRouteGenerator,
      );
}
