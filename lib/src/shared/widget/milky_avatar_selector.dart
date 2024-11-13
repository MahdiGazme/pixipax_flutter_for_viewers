import 'package:flutter/material.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;

import 'package:milky_avatar_selector/milky_avatar_selector.dart';
import 'package:milky_http_client/milky_http_client.dart';
import '../../infrastructures/themes/custom_theme.dart';
import '../../infrastructures/utils/avatar_selector_handler.dart';
import '../../infrastructures/utils/token/token_info.dart';
import 'animated_loading_indicator.dart';

class CustomAvatarSelector extends StatelessWidget {
  final void Function(String avatarId)? onUploadDone;
  final void Function()? onDelete;
  final double size;
  final double? selectorIconSize;
  final double? borderRadios;
  final bool selectorMode;
  final BoxFit? fit;

  final AvatarSelectorHandler _handler;

  //TODO: refactor this for selector mode and package
  CustomAvatarSelector({
    final String? src,
    this.selectorMode = false,
    this.onDelete,
    this.fit = BoxFit.cover,
    this.onUploadDone,
    this.size = 50,
    this.selectorIconSize = 15,
    this.borderRadios,
    super.key,
  }) : _handler = AvatarSelectorHandler(avatarId: src);

  @override
  Widget build(final BuildContext context) => Obx(
        () => MilkyAvatarSelector.network(
          src: _handler.src,
          headers: tokenInfo.header(),
          onDelete: onDelete,
          size: size,
          fit: fit,
          maxWidth: 836,
          maxHeight: 675,
          imageQuality: 25,
          showLoading: _handler.showLoading.value,
          loadingWidget:  AnimatedLoadingIndicator(
            color: customTheme.textColor.shade50,
            size: 30,
          ),
          badgeIconSize: selectorIconSize!,
          selectorMode: selectorMode,
          onImageSelected: (final image) async {
            final bytes = await image.readAsBytes();
            final MultipartFile multipartFile = MultipartFile.fromBytes(
              bytes,
              filename: image.name,
            );
            final formData = FormData.fromMap(
              {
                'image': multipartFile,
              },
            );

            final avatarId = await _handler.onAvatarSelected(formData);

            if (avatarId != null) {
              onUploadDone?.call(avatarId);
            }
          },
          borderRadios: borderRadios ?? customTheme.borderRadiusCircular,
        ),
      );
}
