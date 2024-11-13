import 'package:get/get.dart';

import '../../../../infrastructures/router/route_names.dart';
import '../../../../infrastructures/utils/constants/nested_keys.dart';
import '../../../../shared/enums/page_state_enum.dart';
import '../models/card_preview_view_model.dart';
import '../repository/card_preview_page_repository.dart';

class CardPreviewPageController extends GetxController {
  final CardPreviewPageRepository _repository;

  CardPreviewPageController(this._repository);

  final state = PageStateEnum.loading.obs;

  CardPreviewViewModel? cardPreview;

  @override
  void onInit() async {
    await getCardPreview();
    super.onInit();
  }

  Future<void> getCardPreview() async {
    state.value = PageStateEnum.loading;
    final resultOrException = await _repository.getCardInfo();

    resultOrException.fold(
      //TODO: Like always
      // (final exception) => state.value = PageStateEnum.retry,
      (final exception) => _simulator(),
      (final result) {
        cardPreview = result;
        state.value = PageStateEnum.success;
      },
    );
  }

  void _simulator() {
    cardPreview = CardPreviewViewModel(
      expireDate: '11/01',
      shortCardNumber: '1101',
    );
    state.value = PageStateEnum.success;
  }

  void onChangeCardTap() => Get.toNamed(
        routeNames.cardForm,
        id: nestedKeys.accountNestedKey,
      );
}
