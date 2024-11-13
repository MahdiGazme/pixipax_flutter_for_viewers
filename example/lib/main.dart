import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_booof_module/flutter_booof_module.dart';
import 'package:get_storage/get_storage.dart';

import 'my_app.dart';

void main() async {
  _initUrl(
    Flavor.prod,
    'api',
  );

  WidgetsFlutterBinding.ensureInitialized();

  // commented due to security reasons
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  await GetStorage.init();

  runApp(const MyApp());
}

void _initUrl(
  final Flavor flavor,
  final String suffix,
) {
  final String baseUrl = _getBaseUrl(flavor);

  booofModuleParameters.baseUrl = baseUrl;
  booofModuleParameters.fullBaseUrl = '$baseUrl/$suffix';
}

String _getBaseUrl(final Flavor flavor) {
  if (flavor == Flavor.prod) {
    return 'https://pixipax.com';
  } else if (flavor == Flavor.stage) {
    return '';
  } else {
    return 'https://pixipax.com';
  }
}

enum Flavor {
  stage,
  prod,
}
