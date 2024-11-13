import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashConnectionDialog extends StatelessWidget {
  const SplashConnectionDialog({
    super.key,
  });

  @override
  Widget build(final BuildContext context) => CupertinoAlertDialog(
        title: const Text('Turn on Network'),
        content: const Text(
            'Please turn on your Network or Wi-Fi to connect to Booof servers'),
        actions: [
          TextButton(
            onPressed: Get.back,
            child: const Text('OK'),
          ),
        ],
      );
}
