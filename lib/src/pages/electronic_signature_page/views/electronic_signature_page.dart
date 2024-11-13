import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infrastructures/utils/constants/nested_keys.dart';
import '../../../infrastructures/utils/constants/utils.dart';
import '../../../shared/widget/custom_app_bar.dart';
import '../../../shared/widget/custom_scaffold.dart';
import '../controller/electronic_signature_page_controller.dart';
import 'widget/electronic_signature_sketch_pad_widget.dart';

class ElectronicSignaturePage
    extends GetView<ElectronicSignaturePageController> {
  const ElectronicSignaturePage({super.key});

  @override
  Widget build(final BuildContext context) => CustomScaffold(
        appBar: _appBar(),
        body: _body(context),
      );

  Widget _body(final BuildContext context) => Column(
        children: [
          _sketchPad(context),
          utils.smallVerticalSpacer,
          _buttons(),
        ],
      );

  Widget _sketchPad(final BuildContext context) => Expanded(
        child: LayoutBuilder(
          builder: (final context, final constraints) {
            controller.padSize = constraints.maxWidth;
            return SignaturePadWidget(
              size: controller.padSize,
              onInitState: (final signatureController) =>
                  controller.signatureController = signatureController,
            );
          },
        ),
      );

  Widget _buttons() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: controller.onSketchClear,
            icon: const Icon(
              Icons.clear,
            ),
          ),
          IconButton(
            onPressed: controller.onSignatureCompleted,
            icon: const Icon(
              Icons.done,
            ),
          ),
        ],
      );

  CustomAppBar _appBar() => CustomAppBar(
        title: const Text('Electronic Signature'),
        nestedKey: nestedKeys.jobsListNestedKey,
      );
}
