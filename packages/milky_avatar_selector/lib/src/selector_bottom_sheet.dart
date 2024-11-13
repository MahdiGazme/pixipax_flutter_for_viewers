import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SelectorBottomSheet extends StatelessWidget {
  final double? maxHeight;
  final double? maxWidth;
  final int? imageQuality;
  final Color? galleryButtonIconColor;
  final double? bottomSheetIconSize;
  final String? bottomSheetTitle;
  final Color? cameraButtonIconColor;
  final bool showDeleteButton;
  final IconData cameraButtonIcon;
  final IconData galleryButtonIcon;
  final IconData deleteButtonIcon;
  final Color? deleteButtonIconColor;
  final Color? buttonBorderColor;
  final void Function(XFile avatar)? onImageSelected;
  final void Function()? onDelete;
  final TextStyle? bottomSheetLabelStyle;

  const SelectorBottomSheet({
    required this.cameraButtonIcon,
    required this.galleryButtonIcon,
    required this.deleteButtonIcon,
    required this.showDeleteButton,
    super.key,
    this.maxHeight,
    this.maxWidth,
    this.imageQuality,
    this.galleryButtonIconColor,
    this.bottomSheetIconSize,
    this.bottomSheetTitle,
    this.cameraButtonIconColor,
    this.deleteButtonIconColor,
    this.buttonBorderColor,
    this.onImageSelected,
    this.onDelete,
    this.bottomSheetLabelStyle,
  });

  @override
  Widget build(final BuildContext context) => BottomSheet(
        onClosing: () {},
        builder: _bottomSheetContent,
        backgroundColor: Theme.of(context).colorScheme.background,
      );

  Padding _bottomSheetContent(final BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _labelAndDelete(context),
            const SizedBox(
              height: 10,
            ),
            _buttons(context),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      );

  void _onGalleryTap() async {
    final imagePicker = ImagePicker();
    final selectedImage = await imagePicker.pickImage(
      source: ImageSource.gallery,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
      imageQuality: imageQuality,
    );
    if (selectedImage != null) {
      onImageSelected?.call(selectedImage);
      Get.back();
    }
  }

  Widget _buttons(final BuildContext context) => Row(
        children: [
          _camera(context),
          _gallery(context),
        ],
      );

  Widget _gallery(final BuildContext context) => _bottomSheetButtons(
        context,
        icon: Icon(
          galleryButtonIcon,
          size: bottomSheetIconSize,
          color:
              galleryButtonIconColor ?? Theme.of(context).colorScheme.primary,
        ),
        label: 'Gallery',
        onTap: _onGalleryTap,
      );

  Widget _camera(final BuildContext context) => _bottomSheetButtons(
        context,
        icon: Icon(
          cameraButtonIcon,
          size: bottomSheetIconSize,
          color: cameraButtonIconColor ?? Theme.of(context).colorScheme.primary,
        ),
        label: 'Camera',
        onTap: _onCameraTap,
      );

  void _onCameraTap() async {
    final imagePicker = ImagePicker();
    final selectedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
      imageQuality: imageQuality,
    );
    if (selectedImage != null) {
      onImageSelected!.call(selectedImage);
      Get.back();
    }
  }

  Widget _labelAndDelete(final BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            bottomSheetTitle ?? 'Profile picture',
            style:
                bottomSheetLabelStyle ?? Theme.of(context).textTheme.titleLarge,
          ),
          if (showDeleteButton) _deleteIcon(context),
        ],
      );

  Widget _deleteIcon(final BuildContext context) => IconButton(
        onPressed: () {
          onDelete?.call();
          Get.back();
        },
        icon: Icon(
          CupertinoIcons.delete_solid,
          color: deleteButtonIconColor ??
              Theme.of(context).colorScheme.primary.withOpacity(0.7),
        ),
        padding: EdgeInsets.zero,
      );

  Widget _bottomSheetButtons(
    final BuildContext context, {
    required final Widget icon,
    required final String label,
    required final Function() onTap,
  }) =>
      Column(
        children: [
          _sourceButton(onTap, context, icon),
          _sourceButtonLabel(label),
        ],
      );

  Widget _sourceButton(
    final Function() onTap,
    final BuildContext context,
    final Widget icon,
  ) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
          onTap: onTap,
          focusColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          overlayColor: MaterialStateProperty.all(
            Theme.of(context).colorScheme.primary.withOpacity(0.1),
          ),
          hoverColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          highlightColor:
              Theme.of(context).colorScheme.primary.withOpacity(0.1),
          child: _sourceButtonsContainer(context, icon),
        ),
      );

  Widget _sourceButtonLabel(final String label) => Text(
        label,
      );

  Widget _sourceButtonsContainer(
          final BuildContext context, final Widget icon) =>
      DecoratedBox(
        decoration: _sourceButtonsDecoration(context),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: icon,
        ),
      );

  BoxDecoration _sourceButtonsDecoration(final BuildContext context) =>
      BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(
            color: buttonBorderColor ??
                Theme.of(context).colorScheme.primary.withOpacity(0.5),
            width: 2,
          ),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      );
}
