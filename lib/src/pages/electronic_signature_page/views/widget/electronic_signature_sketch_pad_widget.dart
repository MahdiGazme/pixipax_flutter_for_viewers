import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

import '../../../../infrastructures/themes/custom_theme.dart';
import '../../models/signature_points_view_model.dart';

class SignaturePadWidget extends StatefulWidget {
  final bool disabled;
  final SignatureViewModel? points;
  final Color? backgroundColor;
  final Color? penColor;
  final double size;
  final double penStrokeWidth;
  final void Function(SignatureController controller)? onInitState;

  const SignaturePadWidget({
    required this.size,
    this.penStrokeWidth = 1.0,
    this.onInitState,
    this.penColor,
    this.disabled = false,
    this.backgroundColor,
    this.points,
    super.key,
  });

  @override
  State<SignaturePadWidget> createState() => _SignaturePadWidgetState();
}

class _SignaturePadWidgetState extends State<SignaturePadWidget> {
  late SignatureController controller;

  @override
  Widget build(final BuildContext context) {
    controller = _createController();
    widget.onInitState?.call(controller);
    return Signature(
        width: widget.size,
        height: widget.size,
        controller: controller,
        backgroundColor: widget.backgroundColor ?? customTheme.textColor.shade100,
      );
  }

  SignatureController _createController() => SignatureController(
        penColor: widget.penColor ?? customTheme.textColor,
        disabled: widget.disabled,
        penStrokeWidth: 1.0,
        strokeCap: StrokeCap.round,
        points: _generatePoints(),
      );

  List<Point>? _generatePoints() {
    if (widget.points == null) {
      return null;
    }

    if (widget.points!.padSize == widget.size) {
      return widget.points!.toPoints();
    }

    final points = <Point>[];

    final sizeRatio = widget.size / widget.points!.padSize;

    for (final element in widget.points!.points) {
      points.add(
        element
            .copyWith(
              dx: element.dx * sizeRatio,
              dy: element.dy * sizeRatio,
            )
            .toPoint(),
      );
    }

    return points;
  }

  @override
  void dispose() {
    /// always dispose SignatureController
    controller.dispose();
    super.dispose();
  }

}
