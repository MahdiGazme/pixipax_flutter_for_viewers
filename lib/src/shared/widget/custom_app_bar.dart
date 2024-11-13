import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final int? nestedKey;
  @override
  final Size preferredSize;

  const CustomAppBar({
    this.title,
    this.nestedKey,
    this.preferredSize = const Size.fromHeight(kToolbarHeight),
    super.key,
  });

  @override
  Widget build(final BuildContext context) => AppBar(
        title: title,
        leadingWidth: 90,
        leading: Navigator.of(context).canPop() ? _leading() : null,
      );

  Widget _leading() => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _backButton(),
          const Text(
            'back',
          ),
        ],
      );

  Widget _backButton() => IconButton(
        onPressed: () => Get.back(id: nestedKey),
        padding: EdgeInsets.zero,
        iconSize: 20,
        icon: const Icon(
          Icons.arrow_back_ios_rounded,
        ),
      );
}
