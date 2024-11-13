import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../infrastructures/utils/constants/regex_patterns.dart';

class AuthenticationPageController extends GetxController {
  final phoneNumber = TextEditingController(),
      email = TextEditingController(),
      password = TextEditingController();

  final isPassHided = true.obs;

  void onResendTap() {}

  //TODO: share validator in a global class

  String? phoneNumberValidator(final String? value) {
    if (value == null || value.isEmpty) {
      return 'Can not be empty';
    }

    final regex = RegExp(regexPatterns.phoneNumber);

    final match = regex.firstMatch(value);

    if (match == null) {
      return 'Phone number is not valid';
    }

    return null;
  }

  //TODO: share validator in a global class
  String? emailValidator(final String? value) {
    if (value == null || value.isEmpty) {
      return 'Can not be empty';
    }

    final regex = RegExp(regexPatterns.phoneNumber);

    final match = regex.firstMatch(value);

    if (match == null) {
      return 'Phone number is not valid';
    }

    return null;
  }
}
