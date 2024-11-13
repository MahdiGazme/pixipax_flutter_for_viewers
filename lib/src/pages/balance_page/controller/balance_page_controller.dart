import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infrastructures/utils/constants/api_keys.dart';
import '../../../infrastructures/utils/list_view_handler.dart';
import '../../../shared/enums/page_state_enum.dart';
import '../models/done_tasks_view_model.dart';
import '../repository/balance_page_repository.dart';

class BalancePageController extends GetxController {
  final BalancePageRepository _repository;

  BalancePageController(this._repository);

  final state = PageStateEnum.loading.obs;

  final hasCreditCard = false.obs;

  final RxDouble totalBalance = 1319.50.obs;

  final Rx<Animation<double>> withdrawAnimation =
      const AlwaysStoppedAnimation(1.0).obs;

  final double headerMaxHeight = 180.0;
  final double headerMinHeight = 100.0;

  final listViewHandler = ListViewHandler<DoneTasksViewModel>(
    hasPagination: true,
  );

  @override
  void onInit() async {
    await _getAllDoneTasks();
    super.onInit();
  }

  void onRetry() async {
    state.value = PageStateEnum.loading;
    await _getAllDoneTasks();
  }

  Future<void> _getAllDoneTasks() async {
    final resultOrException = await _repository.getDoneTasks(
      apiKeys.getDoneTasks(
        listViewHandler.query,
      ),
    );

    resultOrException.fold(
      //TODO: as always
      // (final exception) => state.value = PageStateEnum.retry,
      (final exception) => _simulator(),
      (final result) {
        listViewHandler.onSuccess(items: result);
        state.value = PageStateEnum.success;
      },
    );
  }

  double calculateHeatherExpandRatio(final BoxConstraints constraints) {
    double expandRatio = (constraints.maxHeight - headerMinHeight) /
        (headerMaxHeight - headerMinHeight);
    if (expandRatio > 1.0) {
      expandRatio = 1.0;
    }
    if (expandRatio < 0.0) {
      expandRatio = 0.0;
    }

    WidgetsBinding.instance.addPostFrameCallback((final _) {
      withdrawAnimation.value = AlwaysStoppedAnimation(expandRatio);
    });

    return expandRatio;
  }

  void onHelpButtonTap() {}

  void onAddCardTap() {}

  void onWithdrawTap() {}

  //TODO: remove simulator after api is provided

  void _simulator() {
    listViewHandler.onSuccess(items: [
      DoneTasksViewModel(
        description: 'These are the base components that are not published.',
        companyName: 'Coca Cola',
        address: 'Collingwood VIC',
        subtasks: 5,
        payment: 540,
        avatarId:
            'https://i.pinimg.com/736x/1e/c1/d2/1ec1d2ce366d1f603b1bde70ae508063.jpg',
      ),
      DoneTasksViewModel(
        description: 'These are the base components that are not published.',
        companyName: 'Coca Cola',
        address: 'Collingwood VIC',
        subtasks: 5,
        payment: 540,
        avatarId:
            'https://i.pinimg.com/736x/1e/c1/d2/1ec1d2ce366d1f603b1bde70ae508063.jpg',
      ),
      DoneTasksViewModel(
        description: 'These are the base components that are not published.',
        companyName: 'Coca Cola',
        address: 'Collingwood VIC',
        subtasks: 5,
        payment: 540,
        avatarId:
            'https://i.pinimg.com/736x/1e/c1/d2/1ec1d2ce366d1f603b1bde70ae508063.jpg',
      ),
      DoneTasksViewModel(
        description: 'These are the base components that are not published.',
        companyName: 'Coca Cola',
        address: 'Collingwood VIC',
        subtasks: 5,
        payment: 540,
        avatarId:
            'https://i.pinimg.com/736x/1e/c1/d2/1ec1d2ce366d1f603b1bde70ae508063.jpg',
      ),
      DoneTasksViewModel(
        description: 'These are the base components that are not published.',
        companyName: 'Coca Cola',
        address: 'Collingwood VIC',
        subtasks: 5,
        payment: 540,
        avatarId:
            'https://i.pinimg.com/736x/1e/c1/d2/1ec1d2ce366d1f603b1bde70ae508063.jpg',
      ),
      DoneTasksViewModel(
        description: 'These are the base components that are not published.',
        companyName: 'Coca Cola',
        address: 'Collingwood VIC',
        subtasks: 5,
        payment: 540,
        avatarId:
            'https://i.pinimg.com/736x/1e/c1/d2/1ec1d2ce366d1f603b1bde70ae508063.jpg',
      ),
      DoneTasksViewModel(
        description: 'These are the base components that are not published.',
        companyName: 'Coca Cola',
        address: 'Collingwood VIC',
        subtasks: 5,
        payment: 540,
        avatarId:
            'https://i.pinimg.com/736x/1e/c1/d2/1ec1d2ce366d1f603b1bde70ae508063.jpg',
      ),
      DoneTasksViewModel(
        description: 'These are the base components that are not published.',
        companyName: 'Coca Cola',
        address: 'Collingwood VIC',
        subtasks: 5,
        payment: 540,
        avatarId:
            'https://i.pinimg.com/736x/1e/c1/d2/1ec1d2ce366d1f603b1bde70ae508063.jpg',
      ),
      DoneTasksViewModel(
        description: 'These are the base components that are not published.',
        companyName: 'Coca Cola',
        address: 'Collingwood VIC',
        subtasks: 5,
        payment: 540,
        avatarId:
            'https://i.pinimg.com/736x/1e/c1/d2/1ec1d2ce366d1f603b1bde70ae508063.jpg',
      ),
      DoneTasksViewModel(
        description: 'These are the base components that are not published.',
        companyName: 'Coca Cola',
        address: 'Collingwood VIC',
        subtasks: 5,
        payment: 540,
        avatarId:
            'https://i.pinimg.com/736x/1e/c1/d2/1ec1d2ce366d1f603b1bde70ae508063.jpg',
      ),
    ]);
    state.value = PageStateEnum.success;
  }
}
