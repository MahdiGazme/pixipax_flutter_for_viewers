import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/constants/storage_keys.dart';
import '../utils/token/token_info.dart';
import 'firebase_fcm_token_handler.dart';

class FirebaseNotificationHandler {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final _storage = GetStorage();

  final _tokenHandler = FirebaseFcmTokenHandler();

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();

    final fcmToken = await _firebaseMessaging.getToken();
    print('FCM TOKEN =======> $fcmToken');
    await _storage.write(storageKeys.currentFcmToken, fcmToken);

    FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);

    _firebaseMessaging.onTokenRefresh.listen((final newToken) async {
      if (tokenInfo.isLoggedIn) {
        await _storage.write(
          storageKeys.currentFcmToken,
          newToken,
        );
        await _tokenHandler.refreshToken(newToken);
      }
    });
  }
}

// This function handles the background notification services should be a
// Global Function
Future<void> _handleBackgroundMessage(
  final RemoteMessage message,
) async {
  //TODO: implement on background notification tap
}

final fireBaseNotificationHandler = FirebaseNotificationHandler();
