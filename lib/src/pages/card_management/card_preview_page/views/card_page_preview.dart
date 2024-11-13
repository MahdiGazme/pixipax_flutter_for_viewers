import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/utils/constants/nested_keys.dart';
import '../../../../shared/widget/custom_app_bar.dart';
import '../../../../shared/widget/custom_scaffold.dart';
import '../../../../shared/widget/page_state_provider.dart';
import '../controller/card_preview_page_controller.dart';
import 'widget/card_preview_page_card_widget.dart';

class CardPreviewPage extends GetView<CardPreviewPageController> {
  const CardPreviewPage({super.key});

  @override
  Widget build(final BuildContext context) => CustomScaffold(
        appBar: _appBar(),
        body: _body(),
      );

  Widget _body() => PageStateProvider(
        state: controller.state,
        onRetry: controller.getCardPreview,
        page: _content,
      );

  Widget _content() => _cardPreviewWidget();

  Widget _cardPreviewWidget() => CardPreviewPageCardWidget(
        item: controller.cardPreview!,
        onChangeCardTap: controller.onChangeCardTap,
      );

  CustomAppBar _appBar() => CustomAppBar(
        title: const Text('CARD'),
        nestedKey: nestedKeys.accountNestedKey,
      );
}
