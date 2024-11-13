import 'package:get/get.dart';

import '../../../infrastructures/router/route_names.dart';
import '../../../infrastructures/utils/constants/nested_keys.dart';
import '../../../infrastructures/utils/log_out_handler.dart';
import '../../../shared/enums/page_state_enum.dart';
import '../models/account_details_view_model.dart';
import '../repository/account_page_repository.dart';

class AccountPageController extends GetxController {
  final AccountPageRepository _repository;

  AccountPageController(this._repository);

  final state = PageStateEnum.loading.obs;

  late final AccountDetailsViewModel accountDetails;

  @override
  void onInit() async {
    await getAccountDetails();
    super.onInit();
  }

  Future<void> getAccountDetails() async {
    state.value = PageStateEnum.loading;

    final resultOrException = await _repository.getAccountDetails();

    resultOrException.fold(
      //TODO: Like Always
      // (final exception) => state.value = PageStateEnum.retry,
      (final exception) => _simulator(),
      (final result) {
        accountDetails = result;
        state.value = PageStateEnum.success;
      },
    );
  }

  void onProfileTap() => Get.toNamed(
        routeNames.editProfile,
        id: nestedKeys.accountNestedKey,
      );

  void onCardTap() => Get.toNamed(
        routeNames.cardPreview,
        id: nestedKeys.accountNestedKey,
      );

  void onTermsOfUseTap() {}

  void onAuthenticationTap() => Get.toNamed(
        routeNames.authentication,
        id: nestedKeys.accountNestedKey,
      );

  void onNotificationsTap() => Get.toNamed(
        routeNames.notificationSetting,
        id: nestedKeys.accountNestedKey,
      );

  void onLogOutTap() => LogOutHandler().logOut();

  void _simulator() {
    accountDetails = AccountDetailsViewModel(
      id: 'id',
      email: 'mahdigazme1382@gmail.com',
      fullName: 'Mahdi Gazme',
      avatarId:
          'https://i.pinimg.com/564x/64/22/f2/6422f2ddd48cf24f4fc8c5cd959f8d34.jpg',
    );
    state.value = PageStateEnum.success;
  }
}
