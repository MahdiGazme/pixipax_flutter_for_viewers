import 'dart:io';

import 'package:get/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../shared/models/dto/fcm_token_dto.dart';
import '../../shared/repository/fcm_token_repository.dart';
import '../utils/constants/storage_keys.dart';

class FirebaseFcmTokenHandler {
  final _repository = FcmTokenRepository();
  final _storage = GetStorage();

  Future<void> refreshToken(final String fcmToken) async {
    final data = await _createDto(fcmToken);
    final resultOrException = await _repository.refreshToken(data);

    resultOrException.fold(
      (final exception) => printError(
        info: exception,
      ),
      (final result) async {
        await _storage.write(
          storageKeys.serverFcmToken,
          fcmToken,
        );
      },
    );
  }

  Future<FcmTokenDto> _createDto(final String fcmToken) async {
    final packageInfo = await PackageInfo.fromPlatform();
    return FcmTokenDto(
      token: fcmToken,
      os: Platform.operatingSystem,
      version: packageInfo.version,
    );
  }
}
