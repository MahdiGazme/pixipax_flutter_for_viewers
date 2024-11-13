import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/enums/page_state_enum.dart';
import '../models/profile_view_model.dart';
import '../repository/edit_profile_page_repository.dart';

class EditProfilePageController extends GetxController {
  final EditProfilePageRepository _repository;

  EditProfilePageController(
    this._repository,
  );

  final state = PageStateEnum.loading.obs;

  final formKey = GlobalKey<FormState>();

  final fullName = TextEditingController() ,
   nationalId = TextEditingController() ,
   email = TextEditingController() ,
   password = TextEditingController();

  final Rxn<String> avatar = Rxn(null);

  @override
  void onInit() async {
    await getProfileData();
    super.onInit();
  }

  Future<void> getProfileData() async {
    state.value = PageStateEnum.loading;

    final resultOrException = await _repository.getProfile();

    resultOrException.fold(
      // TODO: Like Always
      // (final exception) => state.value = PageStateEnum.retry,
      (final exception) => _simulator(),
      (final result) {
        fullName.text = result.fullName;
        email.text = result.email;
        nationalId.text = result.socialSecurity;
        avatar.value = result.avatarId;
        state.value = PageStateEnum.success;
      },
    );
  }

  void _simulator() {
    final result = ProfileViewModel(
      fullName: 'Mahdi Gazme',
      email: 'mahdi@gmail.com',
      socialSecurity: '1101',
      avatarId:
          'https://i.pinimg.com/564x/64/22/f2/6422f2ddd48cf24f4fc8c5cd959f8d34.jpg',
    );
    fullName.text = result.fullName;
    email.text = result.email;
    nationalId.text = result.socialSecurity;
    avatar.value = result.avatarId;
    state.value = PageStateEnum.success;
  }
}
