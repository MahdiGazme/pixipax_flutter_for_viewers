import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../infrastructures/router/route_names.dart';
import '../../../../infrastructures/utils/constants/storage_keys.dart';
import '../models/dto/sign_up_dto.dart';
import '../repository/sign_up_page_repository.dart';

class SignUpPageController extends GetxController {
  final SignUpPageRepository _repository;

  final fullNameText = TextEditingController(),
      nationalIdText = TextEditingController(),
      emailText = TextEditingController(),
      passwordText = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final showLoading = false.obs, passwordHided = true.obs;

  final isAgreedToTermsAndConditions = false.obs;

  SignUpPageController(
    this._repository,
  );


  void onJoinButtonTap() async {
    if (formKey.currentState!.validate()) {
      if (isAgreedToTermsAndConditions.value == true) {
        final dto = _createDto();
        await _signUp(dto);
      } else {
        //TODO: ask amir to how should we mange this
      }
    }
  }

  SignUpDto _createDto() => SignUpDto(
        fullName: fullNameText.text,
        socialSecurity: nationalIdText.text,
        email: emailText.text,
        password: passwordText.text,
      );

  Future<void> _signUp(final SignUpDto dto) async {
    showLoading.value = true;
    final resultOrException = await _repository.signUp(dto);

    resultOrException.fold(
      (final exception) => showLoading.value = false,
      (final result) async {
        await _storeLoginData();
        _navigateToNextPage();
      },
    );
  }

  Future<void> _storeLoginData() async {
    final storage = GetStorage();
    await storage.write(storageKeys.isRegistered, true);
  }

  void _navigateToNextPage() => Get.offAllNamed(
        routeNames.dashboard,
      );
}
