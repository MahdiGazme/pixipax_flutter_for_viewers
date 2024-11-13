import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart' hide Badge;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'selector_bottom_sheet.dart';

class MilkyAvatarSelector extends StatelessWidget {
  final void Function(XFile avatar)? onImageSelected;
  final void Function()? onDelete;
  final void Function()? onImageTap;
  final double size;
  final double badgeIconSize;
  final bool showLoading;
  final double borderRadios;
  final double? maxHeight;
  final double? maxWidth;
  final IconData? badgeIcon;
  final int? imageQuality;
  final Color? backgroundColor;
  final Color? badgeColor;
  final Color? emptyIconColor;
  final Color? badgeIconColor;
  final Color? galleryButtonIconColor;
  final double? bottomSheetIconSize;
  final String? bottomSheetTitle;
  final Color? cameraButtonIconColor;
  final IconData cameraButtonIcon;
  final IconData galleryButtonIcon;
  final IconData deleteButtonIcon;
  final Color? deleteButtonIconColor;
  final Color? slectorButtonsBorderColor;
  final BorderSide? badgeBorderSide;
  final TextStyle? bottomSheetLabelStyle;
  final IconData? emptyIcon;
  final bool selectorMode;
  final int? cacheWidth;
  final int? cacheHeight;
  final Widget? loadingWidget;
  final BoxFit? fit;

  const MilkyAvatarSelector({
    required this.image,
    required this.size,
    required this.badgeIconSize,
    this.showLoading = false,
    this.onDelete,
    this.galleryButtonIconColor,
    this.cameraButtonIconColor,
    this.deleteButtonIconColor,
    this.slectorButtonsBorderColor,
    this.badgeColor,
    this.bottomSheetLabelStyle,
    this.onImageSelected,
    this.loadingWidget,
    this.fit,
    this.selectorMode = false,
    this.maxHeight,
    this.maxWidth,
    this.imageQuality,
    this.backgroundColor,
    this.borderRadios = 0,
    this.emptyIcon,
    this.emptyIconColor,
    this.cacheHeight,
    this.cacheWidth,
    this.onImageTap,
    final Key? key,
    this.badgeBorderSide,
    this.badgeIcon,
    this.badgeIconColor,
    this.bottomSheetIconSize,
    this.cameraButtonIcon = CupertinoIcons.camera_fill,
    this.galleryButtonIcon = CupertinoIcons.photo,
    this.deleteButtonIcon = CupertinoIcons.delete,
    this.bottomSheetTitle,
  }) : super(key: key);

  MilkyAvatarSelector.network({
    required this.size,
    required this.badgeIconSize,
    final String? src,
    this.showLoading = false,
    this.badgeColor,
    this.onDelete,
    this.loadingWidget,
    this.onImageSelected,
    this.galleryButtonIconColor,
    this.cameraButtonIconColor,
    this.deleteButtonIconColor,
    this.slectorButtonsBorderColor,
    this.maxHeight,
    this.maxWidth,
    this.imageQuality,
    this.bottomSheetLabelStyle,
    this.fit,
    final Widget? errorWidget,
    this.selectorMode = false,
    this.backgroundColor,
    this.borderRadios = 0,
    this.emptyIcon,
    this.emptyIconColor,
    this.cacheHeight,
    this.cacheWidth,
    this.onImageTap,
    final Map<String, String>? headers,
    final double scale = 1.0,
    final Key? key,
    this.badgeBorderSide,
    this.badgeIcon,
    this.badgeIconColor,
    this.bottomSheetIconSize,
    this.cameraButtonIcon = CupertinoIcons.camera_fill,
    this.galleryButtonIcon = CupertinoIcons.photo,
    this.deleteButtonIcon = CupertinoIcons.delete,
    this.bottomSheetTitle,
  })  : image = src == null
            ? null
            : Image.network(
                src,
                cacheWidth: cacheWidth,
                cacheHeight: cacheHeight,
                fit: fit,
                width: size,
                height: size,
                frameBuilder: (final context, final child, final frame,
                        final wasSynchronouslyLoaded) =>
                    child,
                loadingBuilder: loadingWidget != null
                    ? (final context, final widget, final event) =>
                        event == null ? widget : loadingWidget
                    : null,
                errorBuilder: (final context, final widget, final event) =>
                    errorWidget ??
                    _defaultErrorWidget(
                        emptyIcon, size, emptyIconColor, context),
                scale: scale,
                headers: headers,
              ),
        super(key: key);

  final Image? image;

  @override
  Widget build(final BuildContext context) => _body(context);

  Widget _body(final BuildContext context) => GestureDetector(
        child: _badge(context),
      );

  Widget _badge(final BuildContext context) => Badge(
        badgeStyle: _badgeStyle(context),
        position: _badgePosition(),
        showBadge: selectorMode && image != null,
        badgeContent: _selectorIcon(context),
        child: _avatarBody(context),
      );

  BadgeStyle _badgeStyle(final BuildContext context) => BadgeStyle(
        badgeColor: badgeColor ?? Theme.of(context).colorScheme.primary,
        borderSide: badgeBorderSide ?? BorderSide.none,
      );

  BadgePosition _badgePosition() => BadgePosition.bottomEnd(
        bottom: selectorButtonPosition(
            size: size, radios: borderRadios, selectorIconSize: badgeIconSize),
        end: selectorButtonPosition(
          size: size,
          radios: borderRadios,
          selectorIconSize: badgeIconSize,
        ),
      );

  Widget _selectorIcon(final BuildContext context) => Align(
        child: GestureDetector(
          onTap: () => _showBottomSheet(context),
          child: Icon(
            badgeIcon ?? Icons.camera_alt_rounded,
            size: badgeIconSize,
            color: badgeIconColor ?? Theme.of(context).colorScheme.background,
          ),
        ),
      );

  Widget _avatarBody(final BuildContext context) => GestureDetector(
        onTap: () => _onProfilePictureTap(context),
        child: Container(
          height: size,
          width: size,
          decoration: _avatarBodyDecoration(context),
          child: showLoading
              ? loadingWidget
              : image == null
                  ? _emptyIcon(context)
                  : _avatarImage(),
        ),
      );

  BoxDecoration _avatarBodyDecoration(final BuildContext context) =>
      BoxDecoration(
        color: backgroundColor ?? Theme.of(context).colorScheme.primary,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 1,
            offset: Offset(1, 2),
          )
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(
            borderRadios,
          ),
        ),
      );

  Widget _emptyIcon(final BuildContext context) => Icon(
        emptyIcon ?? Icons.person_outline_rounded,
        size: size * 0.5,
        color: emptyIconColor ?? Theme.of(context).colorScheme.background,
      );

  static Icon _defaultErrorWidget(final IconData? emptyIcon, final double size,
          final Color? emptyIconColor, final BuildContext context) =>
      Icon(
        emptyIcon ?? Icons.error_outline_rounded,
        size: size * 0.5,
        color: emptyIconColor ?? Theme.of(context).colorScheme.onError,
      );

  double selectorButtonPosition(
      {required final double size,
      required final double radios,
      required final double selectorIconSize}) {
    if (size / 2 > radios) {
      return radios / 4 - selectorIconSize / 2;
    } else {
      return size / 8 - selectorIconSize / 2;
    }
  }

  Widget _avatarImage() => ClipRRect(
        borderRadius: BorderRadius.circular(borderRadios),
        clipBehavior: Clip.hardEdge,
        child: image,
      );

  void _onProfilePictureTap(final BuildContext context) {
    if (image != null) {
      onImageTap?.call();
    } else if (selectorMode) {
      _showBottomSheet(context);
    }
  }

  void _showBottomSheet(final BuildContext context) {
    Get.bottomSheet(
      SelectorBottomSheet(
        cameraButtonIcon: cameraButtonIcon,
        deleteButtonIcon: deleteButtonIcon,
        galleryButtonIcon: galleryButtonIcon,
        bottomSheetIconSize: bottomSheetIconSize,
        bottomSheetLabelStyle: bottomSheetLabelStyle,
        bottomSheetTitle: bottomSheetTitle,
        buttonBorderColor: slectorButtonsBorderColor,
        onDelete: onDelete,
        onImageSelected: onImageSelected,
        maxHeight: maxHeight,
        maxWidth: maxWidth,
        imageQuality: imageQuality,
        showDeleteButton: onDelete != null,
        cameraButtonIconColor: cameraButtonIconColor,
        galleryButtonIconColor: galleryButtonIconColor,
        deleteButtonIconColor: deleteButtonIconColor,
      ),
    );
  }
}
