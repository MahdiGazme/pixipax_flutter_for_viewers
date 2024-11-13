import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../infrastructures/utils/constants/utils.dart';
import '../../../../../infrastructures/utils/credit_card_input_formatter.dart';
import '../../../../../shared/widget/primary_text_field.dart';
import '../../controller/card_form_page_controller.dart';

class CardFormPageFormWidget extends GetView<CardFormPageController> {
  const CardFormPageFormWidget({super.key});

  @override
  Widget build(final BuildContext context) => Form(
        key: controller.formKey,
        child: Column(
          children: [
            _creditCard(),
            utils.largeVerticalSpacer,
            _expireDateAndCvv(),
            utils.largeVerticalSpacer,
            zipCode(),
          ],
        ),
      );

  Widget zipCode() => PrimaryTextField(
        topLabel: 'Zip',
        validator: controller.zipCodeValidator,
        keyboardType: TextInputType.streetAddress,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        controller: controller.zipCode,
        prefixIcon: const Icon(
          Icons.map_outlined,
        ),
      );

  Widget _expireDateAndCvv() => Row(
        children: [
          _expireDate(),
          utils.smallHorizontalSpacer,
          _cvv(),
        ],
      );

  Widget _cvv() => Expanded(
        child: PrimaryTextField(
          topLabel: 'CVV',
          controller: controller.cvc,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          keyboardType: TextInputType.number,
          validator: controller.cvcValidator,
          prefixIcon: const Icon(
            Icons.lock_outline_rounded,
          ),
        ),
      );

  Widget _expireDate() => Expanded(
        child: PrimaryTextField(
          topLabel: 'Expiration',
          maxLength: 5,
          keyboardType: TextInputType.datetime,
          controller: controller.expireDate,
          validator: controller.expireDateValidator,
          counter: const SizedBox(),
          prefixIcon: const Icon(
            Icons.calendar_today_outlined,
          ),
          hint: 'YY/MM',
        ),
      );

  Widget _creditCard() => PrimaryTextField(
        topLabel: 'Credit Card Number',
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          CreditCardInputFormatter(),
        ],
        //16 digits for card number and 3 spaces
        maxLength: 19,
        counter: const SizedBox(),
        controller: controller.cardNumber,
        keyboardType: TextInputType.number,
        validator: controller.cardNumberValidator,
        prefixIcon: const Icon(
          Icons.credit_card_rounded,
        ),
      );
}
