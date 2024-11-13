import 'package:flutter/material.dart';

import '../../../infrastructures/themes/custom_theme.dart';
import '../../../infrastructures/utils/constants/utils.dart';
import 'otp_text_field_item.dart';

class OtpTextField extends StatefulWidget {
  final GlobalKey formKey;
  final String? Function(String? value)? validator;
  final int length;
  final String? hint;
  final void Function(String value)? onCompleted;

  const OtpTextField({
    required this.formKey,
    required this.length,
    this.validator,
    this.hint,
    this.onCompleted,
    super.key,
  });

  @override
  State<OtpTextField> createState() => _OtpTextFieldState();
}

class _OtpTextFieldState extends State<OtpTextField> {
  final List<TextEditingController> _controllers = [];
  final List<FocusNode> _focusNodes = [];

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  void _initialize() {
    for (var i = 1; i <= widget.length; i++) {
      final focusNode = FocusNode();
      final controller = TextEditingController();

      focusNode.addListener(() {
        _focusListener(focusNode, controller);
      });

      _controllers.add(controller);
      _focusNodes.add(focusNode);
    }
  }

  @override
  void dispose() {
    _removeListeners();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _label(context),
          utils.smallVerticalSpacer,
          _textFields(),
          if (widget.hint != null) _hintText(context),
        ],
      );

  Widget _textFields() => Form(
        key: widget.formKey,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: _generateOTPs(),
        ),
      );

  Widget _otherOTPs(
    final TextEditingController controller,
    final FocusNode focusNode,
  ) =>
      OtpTextFieldItem(
        focusNode: focusNode,
        controller: controller,
        decoration: _decoration(),
        validator: widget.validator,
        onTap: () => _setCursorPosition,
        onChanged: (
          final context,
          final value,
        ) =>
            _onChanged(
          context,
          value,
          controller,
        ),
      );

  Widget _lastOtp(
    final TextEditingController controller,
    final FocusNode focusNode,
  ) =>
      OtpTextFieldItem(
        controller: controller,
        validator: widget.validator,
        decoration: _decoration(),
        isLastItem: true,
        focusNode: focusNode,
        onTap: () => _setCursorPosition,
        onChanged: (final context, final value) {
          _onChanged(
            context,
            value,
            controller,
            isLastItem: true,
          );
          widget.onCompleted?.call(
            _summery(),
          );
        },
      );

  Widget _firstOtp(
    final TextEditingController controller,
    final FocusNode focusNode,
  ) =>
      OtpTextFieldItem(
        autoFocus: true,
        focusNode: focusNode,
        decoration: _decoration(),
        controller: controller,
        validator: widget.validator,
        onTap: () => _setCursorPosition,
        onChanged: (
          final context,
          final value,
        ) =>
            _onChanged(
          context,
          value,
          controller,
        ),
      );

  InputDecoration _decoration() => const InputDecoration(
        constraints: BoxConstraints(
          // maxWidth: 64,
          //TODO find a way to change this by changing the length
          maxWidth: 44,
        ),
        hintText: '0',
        counter: SizedBox(),
      );

  Widget _label(final BuildContext context) => Text(
        'Secure Text',
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: customTheme.textColor.shade500,
            ),
      );

  Widget _hintText(final BuildContext context) => Text(
        widget.hint!,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: customTheme.textColor.shade400,
            ),
      );

  // ---------> Logic <---------

  void _focusListener(
    final FocusNode focusNode,
    final TextEditingController controller,
  ) {
    if (focusNode.hasFocus && controller.text.isEmpty) {
      controller.text = '\u200b';
    } else if (!focusNode.hasFocus && controller.text == '\u200b') {
      controller.clear();
    }
  }

  void _removeListeners() {
    for (int i = 0; i < _focusNodes.length; i++) {
      _focusNodes[i].removeListener(() {
        _focusNodes[i].removeListener(() {
          _focusListener(_focusNodes[i], _controllers[i]);
        });
      });
    }
  }

  List<Widget> _generateOTPs() {
    final textFields = <Widget>[];

    for (var i = 0; i < _controllers.length; i++) {
      if (i == 0) {
        textFields.add(
          _firstOtp(
            _controllers[i],
            _focusNodes[i],
          ),
        );
      } else if (i < _controllers.length - 1) {
        textFields.add(
          _otherOTPs(
            _controllers[i],
            _focusNodes[i],
          ),
        );
      } else {
        textFields.add(
          _lastOtp(
            _controllers[i],
            _focusNodes[i],
          ),
        );
      }
    }

    return textFields;
  }

  String _summery() {
    final summery = StringBuffer();
    for (final element in _controllers) {
      summery.write(element.text);
    }

    return summery.toString();
  }

  void _onChanged(
    final BuildContext context,
    final String value,
    final TextEditingController controller, {
    final bool isLastItem = false,
  }) {
    _mangeInputValue(value, controller);
    _manageFocus(isLastItem, controller, context);
  }

  void _manageFocus(
    final bool isLastItem,
    final TextEditingController controller,
    final BuildContext context,
  ) {
    if (isLastItem && controller.text.isNotEmpty) {
      FocusScope.of(context).unfocus();
    } else if (controller.text.length == 1) {
      FocusScope.of(context).nextFocus();
    } else if (controller.text.isEmpty) {
      FocusScope.of(context).previousFocus();
    }
  }

  void _mangeInputValue(
    final String value,
    final TextEditingController controller,
  ) {
    //removes zero-space character and replaces new character
    controller.clear();
    if (value.isEmpty || value.length == 1) {
      controller.text = value;
    } else {
      final newValue = value[value.length - 1];
      controller.text = newValue;
    }
  }

  void _setCursorPosition(
    final TextEditingController controller,
  ) {
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );
  }
}
