import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../infrastructures/firebase/firebase_fcm_token_handler.dart';
import '../../../infrastructures/router/nested_navigation_handler.dart';

import '../../../infrastructures/router/nested_route_pages.dart';
import '../../../infrastructures/utils/constants/nested_keys.dart';
import '../../../infrastructures/utils/constants/storage_keys.dart';
import '../../../infrastructures/utils/offline_api_enqueue_service.dart';
import '../../account_page/view/account_page.dart';
import '../../balance_page/views/balance_page.dart';
import '../../job_list_page/views/job_list_page.dart';

class DashboardPageController extends GetxController {
  // commented due to security reasons
  // final _fcmTokenHandler = FirebaseFcmTokenHandler();

  final _storage = GetStorage();

  late final StreamSubscription<ConnectivityResult> subscription;

  @override
  void onInit() {
    _checkForRefreshFcmToken();
    _offlineServiceStart();
    super.onInit();
  }

  Future<void> _offlineServiceStart() async {
    offlineEnqueueService.startService();
    subscription = Connectivity().onConnectivityChanged.listen((
      final connection,
    ) async {
      if (connection != ConnectivityResult.none) {
        offlineEnqueueService.startService();
      }
    });
  }

  void _checkForRefreshFcmToken() async {
    final serverFcmToken = await _storage.read(storageKeys.serverFcmToken);
    final currentFcmToken = await _storage.read(storageKeys.currentFcmToken);

    if (currentFcmToken != null && serverFcmToken == null ||
        serverFcmToken != currentFcmToken) {
      // commented due to security reasons
      // await _fcmTokenHandler.refreshToken(currentFcmToken!);
    }
  }

  final _nestedNavigationHandler = NestedNavigationHandler();

  final RxInt bottomNavigationIndex = 1.obs;

  // ---> Route Generators <---

  Route<dynamic>? balanceRouteGenerator(final RouteSettings settings) {
    final model = _createBalanceNavigationModel(settings);

    return _nestedNavigationHandler.generator(model);
  }

  Route<dynamic>? accountRouteGenerator(final RouteSettings settings) {
    final model = _createAccountNavigationModel(settings);

    return _nestedNavigationHandler.generator(model);
  }

  Route<dynamic>? jobsRouteGenerator(final RouteSettings settings) {
    final model = _createJobListNavigationModel(settings);

    return _nestedNavigationHandler.generator(model);
  }

  // ---> Nested Navigation Models <---

  NestedNavigationModel _createAccountNavigationModel(
    final RouteSettings settings,
  ) =>
      NestedNavigationModel(
        mainPage: const AccountPage(),
        initialRoute: '/',
        settings: settings,
        nestedPages: nestedRoutePages.nestedPages[nestedKeys.accountNestedKey]!,
      );

  NestedNavigationModel _createBalanceNavigationModel(
    final RouteSettings settings,
  ) =>
      NestedNavigationModel(
        mainPage: const BalancePage(),
        initialRoute: '/',
        settings: settings,
        nestedPages: [],
      );

  NestedNavigationModel _createJobListNavigationModel(
    final RouteSettings settings,
  ) =>
      NestedNavigationModel(
        mainPage: const JobListPage(),
        initialRoute: '/',
        settings: settings,
        nestedPages:
            nestedRoutePages.nestedPages[nestedKeys.jobsListNestedKey]!,
      );

  @override
  void onClose() {
    // TODO: implement onClose
    subscription.cancel();
    super.onClose();
  }
}
