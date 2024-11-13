import 'package:get_storage/get_storage.dart';

import '../constants/storage_keys.dart';
import '../constants/utils.dart';
import 'session_model.dart';
import 'token_utils.dart';

class TokenInfo {
  SessionModel? _sessionModel;
  GetStorage? _storage;

  String get token =>
      isLoggedIn ? _storage!.read(storageKeys.token)! : throw _exceptionError;

  String get refreshKey => isLoggedIn
      ? _storage!.read(storageKeys.refreshTokenKey)!
      : throw _exceptionError;

  String get id => isLoggedIn ? _sessionModel!.id : throw _exceptionError;

  //  List<BooofRoleEnum> get roles =>
  //     isLoggedIn ? _sessionModel!.roles : throw _exceptionError;

  bool get isTokenExpired => isLoggedIn
      ? tokenUtils.isTokenExpired(_sessionModel!.expireDate, 60)
      : throw _exceptionError;

  bool get isLoggedIn => _sessionModel != null;

  Map<String, String> header() => {
        if (isLoggedIn) utils.authorization: '${utils.bearer} $token',
      };

  Future<void> clearToken() async {
    _sessionModel = null;
    await _storage?.remove(storageKeys.token);
    await _storage?.remove(storageKeys.refreshTokenKey);
  }

  /// call this after get token from response
  Future<void> initialize(final String token, final String refresh) async {
    _storage = GetStorage();
    await _storage!.write(storageKeys.token, token);
    await _storage!.write(storageKeys.refreshTokenKey, refresh);
    _sessionModel = SessionModel.fromJson(
      tokenUtils.parseToken(token),
    );
  }

  final _exceptionError = Exception('user is not logged in\n'
      'Check TokenInfo.isLoggedIn before calling this');
}

final tokenInfo = TokenInfo();
