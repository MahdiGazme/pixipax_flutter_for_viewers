import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../infrastructures/firebase/fire_base_notification_handler.dart';
import '../../../infrastructures/router/route_names.dart';
import '../../../infrastructures/utils/constants/storage_keys.dart';
import '../../../infrastructures/utils/constants/utils.dart';
import '../../../infrastructures/utils/token/token_info.dart';
import '../view/widgets/splash_connection_dialog.dart';

class SplashController extends GetxController {
  final GetStorage _storage = GetStorage();

  final needToCheckConnection = false.obs;

  @override
  void onInit() async {
    await prepare();
    super.onInit();
  }

  Future<void> _checkLoggedIn() async {
    await fireBaseNotificationHandler.initNotifications();
    final isRegistered = await _storage.read(storageKeys.isRegistered);
    final token = await _storage.read(storageKeys.token);
    final refreshKey = await _storage.read(storageKeys.refreshTokenKey);

    if (token != null && refreshKey != null) {
      await tokenInfo.initialize(
        token,
        refreshKey,
      );
    }

    //Creates a Delay for splash page
    await Future.delayed(const Duration(seconds: 2));

    if (isRegistered != null) {
      _navigateToDashboard();
    } else {
      _navigationToIntro();
    }
  }

  void _navigationToIntro() => Get.offAndToNamed(
    routeNames.introduction,
  );

  void _navigateToDashboard() => Get.offAndToNamed(
    routeNames.dashboard,
  );

  Future<void> prepare() async {
    needToCheckConnection.value = false;
    try {
      await _checkConnection();
    } on SocketException catch (_) {
      await _onNoConnection();
    } catch (_) {
      print(_);
    }
  }

  Future<void> _checkConnection() async {
    final result = await InternetAddress.lookup(
      utils.connectionLookupUrl,
    );
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      await _checkLoggedIn();
    }
  }

  Future<void> _onNoConnection() async {
    needToCheckConnection.value = true;
    await Get.dialog(
      const SplashConnectionDialog(),
    );
  }
}