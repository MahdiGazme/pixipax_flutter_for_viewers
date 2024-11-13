import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/router/route_names.dart';
import '../models/dto/confirmation_code_dto.dart';
import '../repository/confirmation_code_page_repository.dart';

class ConfirmationCodePageController extends GetxController {
  final ConfirmationCodePageRepository _repository;

  final formKey = GlobalKey<FormState>();

  final codeText = StringBuffer();

  final showLoading = false.obs;

  ConfirmationCodePageController(
    this._repository,
  );

  void onConfirmButtonTep() async {
    if (formKey.currentState!.validate()) {
      final dto = _createDto();
      await _postCode(dto);
    }
  }

  String? otpValidator(final String value) {
    if (value.isEmpty) {
      return '';
    }

    return null;
  }

  void onOtpCompleted(final String value) => codeText.write(value);

  Future<void> _postCode(final ConfirmationCodeDto dto) async {
    showLoading.value = true;
    final resultOrException = await _repository.postConfirmationCode(dto);

    resultOrException.fold(
      (final exception) => showLoading.value = false,
      (final result) {
        showLoading.value = false;
        _navigateToNextPage();
      },
    );
  }

  void _navigateToNextPage() => Get.toNamed(
        routeNames.signUp,
      );

  ConfirmationCodeDto _createDto() => ConfirmationCodeDto(
        code: codeText.toString(),
      );
}
