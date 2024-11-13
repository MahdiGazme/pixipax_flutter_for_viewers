import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/utils/constants/nested_keys.dart';
import '../../../../infrastructures/utils/constants/regex_patterns.dart';
import '../models/dto/card_information_dto.dart';
import '../repository/card_form_page_repository.dart';

class CardFormPageController extends GetxController {
  final CardFormPageRepository _repository;

  CardFormPageController(
    this._repository,
  );

  final isLoading = false.obs;

  final formKey = GlobalKey<FormState>();

  final cardNumber = TextEditingController(),
      expireDate = TextEditingController(),
      cvc = TextEditingController(),
      zipCode = TextEditingController();

  void onAddCardTap() async {
    if (formKey.currentState!.validate()) {
      final dto = _createDto();
      await _patchCardInfo(dto);
    }
  }

  Future<void> _patchCardInfo(final CardInformationDto dto) async {
    isLoading.value = true;
    final resultOrException = await _repository.patchCardInfo(dto);

    resultOrException.fold(
      //TODO: Like always
      // (final exception) => isLoading.value = false,
      (final exception) => isLoading.value = false,
      (final result) => Get.back(
        id: nestedKeys.accountNestedKey,
      ),
    );
  }

  //TODO: share validator in a global class
  String? cardNumberValidator(final String? value) {
    if (value == null || value.isEmpty) {
      return 'Can not be empty';
    }

    final regex = RegExp(regexPatterns.creditCardNumber);

    final pureCardNumber = value.trim();

    final match = regex.firstMatch(pureCardNumber);

    if (match == null) {
      return 'Card number is not valid';
    }
    return null;
  }

  //TODO: share validator in a global class
  String? expireDateValidator(final String? value) {
    if (value == null || value.isEmpty) {
      return 'Can not be empty';
    }

    final regex = RegExp(regexPatterns.cardExpireDate);

    final match = regex.firstMatch(value);

    if (match == null) {
      return 'Expiration is not valid';
    }
    return null;
  }

  //TODO: share validator in a global class

  String? cvcValidator(final String? value) {
    if (value == null || value.isEmpty) {
      return 'Can not be empty';
    }

    final regex = RegExp(regexPatterns.cvv);

    final match = regex.firstMatch(value);

    if (match == null) {
      return 'CVV is not valid';
    }
    return null;
  }

  //TODO: share validator in a global class
  String? zipCodeValidator(final String? value) {
    if (value == null || value.isEmpty) {
      return 'Can not be empty';
    }

    final regex = RegExp(regexPatterns.zipCode);

    final match = regex.firstMatch(value);

    if (match == null) {
      return 'Zip is not valid';
    }
    return null;
  }

  CardInformationDto _createDto() => CardInformationDto(
        cardNumber: cardNumber.text,
        expireDate: expireDate.text,
        cvc: cvc.text,
        zipCode: zipCode.text,
      );
}
