import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../infrastructures/router/route_names.dart';
import '../../../infrastructures/utils/constants/regex_patterns.dart';
import '../../../infrastructures/utils/constants/storage_keys.dart';
import '../../../infrastructures/utils/token/token_info.dart';
import '../models/dto/login_information_dto.dart';
import '../repository/login_page_repository.dart';

class LoginPageController extends GetxController {
  final showLoading = false.obs;
  final LoginPageRepository _repository;

  final isPasswordHided = true.obs;

  final phoneNumberOrEmailTextController = TextEditingController(),
      passwordTextController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  LoginPageController(this._repository);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> onSendButtonTap() async {
    if (formKey.currentState!.validate()) {
      final dto = _createDTO();
      await _postLoginInformation(dto);
    }
  }

  LoginInformationDto _createDTO() => LoginInformationDto(
        username: phoneNumberOrEmailTextController.text,
        password: passwordTextController.text,
      );

  Future<void> _postLoginInformation(final LoginInformationDto dto) async {
    showLoading.value = true;
    final resultOrException = await _repository.login(dto);

    resultOrException.fold(
      (final exception) => showLoading.value = false,
      (final result) async {
        //todo: remove testing token and uncomment the piece of code blow
        // await tokenInfo.initialize(
        //   result.token,
        //   result.refreshKey,
        // );
        await tokenInfo.initialize(
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjUiLCJpYXQiOjE3MDcxMTkyOTgsImV4cCI6MTcwNzE1NTI5OH0.RYVTmjimxWChIzIKpaSht75X1HH2UMKt3_yURhkAt_U',
          result.refreshKey,
        );

        await _storeLoginData();
        navigateToNextPage();
      },
    );
  }

  Future<void> _storeLoginData() async {
    final storage = GetStorage();
    await storage.write(storageKeys.isRegistered, true);
  }

  void navigateToNextPage() => Get.offAllNamed(routeNames.dashboard);

  String? phoneNumberAndEmailTextFieldValidator(final String? value) {
    final phoneNumberRegex = RegExp(regexPatterns.phoneNumber);
    final emailRegex = RegExp(regexPatterns.email);

    if (value == null) {
      return 'This field can not be empty';
    } else if (phoneNumberRegex.firstMatch(value) == null &&
        emailRegex.firstMatch(value) == null) {
      return 'Phone number or email is not valid';
    }

    return null;
  }

  String? passwordTextFieldValidator(final String? value) {
    final regex = RegExp(regexPatterns.password);

    if (value == null || regex.firstMatch(value) == null) {
      return 'Password must have at least 8 characters with '
          'numbers and letters';
    }

    return null;
  }
}
