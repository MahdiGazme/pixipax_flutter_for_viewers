
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../infrastructures/utils/constants/utils.dart';

class CustomSnackBar {
  CustomSnackBar._();

  static SnackbarController snackBar(
    final String title,
    final String message, {
    final bool hasBottomMargin = true,
    final Widget? messageText,
  }) =>
      Get.snackbar(
        title,
        message,
        margin: hasBottomMargin
            ? EdgeInsets.only(
                bottom:utils.navigationBarSpace,
              )
            : null,
        messageText: messageText,
        snackPosition: SnackPosition.BOTTOM,
      );
}
