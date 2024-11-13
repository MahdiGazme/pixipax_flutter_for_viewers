import 'package:flutter/material.dart';

import '../../infrastructures/themes/custom_theme.dart';
import '../../infrastructures/utils/constants/utils.dart';

class CustomTimeLine extends StatefulWidget {
  final int doneSubtasks;
  final int totalSubtasks;
  final double height;

  const CustomTimeLine({
    required this.doneSubtasks,
    required this.totalSubtasks,
    this.height = 6.0,
    super.key,
  });

  @override
  State<CustomTimeLine> createState() => _CustomTimeLineState();
}

class _CustomTimeLineState extends State<CustomTimeLine> {
  double singleWidgetWidth = 0.0;

  @override
  Widget build(final BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _title(context),
          utils.smallVerticalSpacer,
          _timeLineWidget()
        ],
      );

  Widget _timeLineWidget() => LayoutBuilder(
        builder: (final context, final constraints) {
          singleWidgetWidth = constraints.maxWidth / widget.totalSubtasks;
          return Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              _connectors(context),
              ..._generateIndicators(context),
            ],
          );
        },
      );

  Widget _connectors(
    final BuildContext context,
  ) =>
      Row(
        children: _generateConnectors(context),
      );

  Widget _title(final BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _label(context),
          _subtaskDetails(context),
        ],
      );

  Widget _subtaskDetails(final BuildContext context) => Text(
        '${widget.doneSubtasks} of ${widget.totalSubtasks}',
        style: _textStyle(context),
      );

  Widget _label(final BuildContext context) => Text(
        'Task Process',
        style: _textStyle(context),
      );

  TextStyle _textStyle(final BuildContext context) =>
      Theme.of(context).textTheme.bodySmall!.copyWith(
            color: customTheme.textColor.shade50,
            //TODO: handle from theme after talking with amin
            fontSize: 9.5,
            fontWeight: FontWeight.w600,
          );

  List<Widget> _generateIndicators(
    final BuildContext context,
  ) {
    final indicators = <Widget>[];

    for (int i = 0; i < widget.totalSubtasks; i++) {
      indicators.add(
        _indicator(i),
      );
    }

    return indicators;
  }

  Widget _indicator(final int i) => PositionedDirectional(
        start: (i + 1) * singleWidgetWidth - (widget.height / 2),
        child: Container(
          height: widget.height,
          width: widget.height,
          decoration: _indicatorDecoration(i),
        ),
      );

  BoxDecoration _indicatorDecoration(final int i) => BoxDecoration(
        shape: BoxShape.circle,
        color: i < widget.doneSubtasks
            ? customTheme.primaryColor.shade200
            : customTheme.textColor.shade50,
      );

  List<Widget> _generateConnectors(
    final BuildContext context,
  ) {
    final connectors = <Widget>[];

    for (int i = 0; i < widget.totalSubtasks; i++) {
      connectors.add(
        _connector(
          context,
          i,
          i == 0,
          i == widget.totalSubtasks - 1,
        ),
      );
    }

    return connectors;
  }

  Widget _connector(
    final BuildContext context,
    final int index,
    final bool isFirst,
    final bool isLast,
  ) =>
      Container(
        height: widget.height,
        width: singleWidgetWidth,
        decoration: _connectorsDecoration(
          index,
          isFirst,
          isLast,
        ),
      );

  BoxDecoration _connectorsDecoration(
    final int index,
    final bool isFirst,
    final bool isLast,
  ) =>
      BoxDecoration(
        color: index < widget.doneSubtasks
            ? customTheme.textColor.shade50
            : customTheme.textColor.shade50.withOpacity(0.4),
        borderRadius: BorderRadiusDirectional.horizontal(
          start: isFirst
              ? Radius.circular(
                  customTheme.borderRadiusRound,
                )
              : Radius.zero,
          end: isLast
              ? Radius.circular(
                  customTheme.borderRadiusRound,
                )
              : Radius.zero,
        ),
      );
}
