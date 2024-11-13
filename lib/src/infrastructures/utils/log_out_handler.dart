import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../router/route_names.dart';
import 'constants/storage_keys.dart';
import 'token/token_info.dart';

class LogOutHandler {
  final _storage = GetStorage();

  Future<void> logOut() async {
    await tokenInfo.clearToken();
    await _storage.remove(storageKeys.serverFcmToken);
    await _storage.remove(storageKeys.isRegistered);

    unawaited(
      Get.offAllNamed(
        routeNames.introduction,
      ),
    );
  }
}
