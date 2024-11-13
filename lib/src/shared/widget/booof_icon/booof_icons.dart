import 'package:flutter/material.dart';

import '../../../infrastructures/utils/constants/icon_asset_paths.dart';
import 'booof_asset_svg_icon.dart';

class BooofIcons {
  BooofIcons._();

  static BooofAssetSvgIcon downloads({
    final Color? color,
    final double? size,
  }) =>
      BooofAssetSvgIcon(
        path: iconAssetPaths.download,
        color: color,
        size: size,
      );

  static BooofAssetSvgIcon eye({
    final Color? color,
    final double? size,
  }) =>
      BooofAssetSvgIcon(
        path: iconAssetPaths.eye,
        color: color,
        size: size,
      );

  static BooofAssetSvgIcon eyeOff({
    final Color? color,
    final double? size,
  }) =>
      BooofAssetSvgIcon(
        path: iconAssetPaths.eyeOff,
        color: color,
        size: size,
      );

  static BooofAssetSvgIcon helpCircle({
    final Color? color,
    final double? size,
  }) =>
      BooofAssetSvgIcon(
        path: iconAssetPaths.helpCircle,
        color: color,
        size: size,
      );

  static BooofAssetSvgIcon user({
    final Color? color,
    final double? size,
  }) =>
      BooofAssetSvgIcon(
        path: iconAssetPaths.user,
        color: color,
        size: size,
      );

  static BooofAssetSvgIcon search({
    final Color? color,
    final double? size,
  }) =>
      BooofAssetSvgIcon(
        path: iconAssetPaths.search,
        color: color,
        size: size,
      );

  static BooofAssetSvgIcon briefcase({
    final Color? color,
    final double? size,
  }) =>
      BooofAssetSvgIcon(
        path: iconAssetPaths.briefcase,
        color: color,
        size: size,
      );

  static BooofAssetSvgIcon bell({
    final Color? color,
    final double? size,
  }) =>
      BooofAssetSvgIcon(
        path: iconAssetPaths.bell,
        color: color,
        size: size,
      );

  static BooofAssetSvgIcon mapPin({
    final Color? color,
    final double? size,
  }) =>
      BooofAssetSvgIcon(
        path: iconAssetPaths.mapPin,
        color: color,
        size: size,
      );

  static BooofAssetSvgIcon layers({
    final Color? color,
    final double? size,
  }) =>
      BooofAssetSvgIcon(
        path: iconAssetPaths.layers,
        color: color,
        size: size,
      );
}
