import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/router/route_names.dart';
import '../../../../infrastructures/utils/constants/regex_patterns.dart';
import '../../../../infrastructures/utils/token/token_info.dart';
import '../models/dto/phone_confirmation_dto.dart';
import '../repository/phone_confirmation_page_repository.dart';

class PhoneConfirmationPageController extends GetxController {
  final PhoneConfirmationPageRepository _repository;

  final formKey = GlobalKey<FormState>();

  final phoneNumberText = TextEditingController();

  final showLoading = false.obs;

  PhoneConfirmationPageController(
    this._repository,
  );

  void onSendButtonTep() async {
    if (formKey.currentState!.validate()) {
      final dto = _createDto();
      await _postPhoneNumber(dto);
    }
  }

  Future<void> _postPhoneNumber(final PhoneConfirmationDto dto) async {
    showLoading.value = true;
    final resultOrException = await _repository.postPhoneNumber(dto);

    resultOrException.fold(
      (final exception) => showLoading.value = false,
      (final result) async {
        showLoading.value = false;
        await tokenInfo.initialize(
          result.token,
          result.refreshKey,
        );
        //TODO: remove code from view model after sms is provided
        Get.snackbar(
          'Your verification code (Temporary)',
          result.code.toString(),
          duration: const Duration(
            seconds: 4,
          ),
        );
        _navigateToNextPage(
          result.phoneVerified,
        );
      },
    );
  }

  String? phoneNumberValidator(final String value) {
    final regex = RegExp(regexPatterns.phoneNumber);
    if (regex.firstMatch(value) == null) {
      //TODO: create a class for all validation errors
      return 'Phone number is not valid';
    }
    return null;
  }

  void _navigateToNextPage(final bool isConfirmed) {
    if (isConfirmed) {
      Get.toNamed(
        routeNames.signUp,
      );
    } else {
      Get.toNamed(
        routeNames.confirmationCode,
      );
    }
  }

  PhoneConfirmationDto _createDto() => PhoneConfirmationDto(
        phoneNumber: phoneNumberText.text,
      );
}
