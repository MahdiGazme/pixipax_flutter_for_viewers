import 'package:flutter/material.dart';

import '../../infrastructures/themes/custom_theme.dart';
import '../../infrastructures/themes/styles/search_text_field_style.dart';

class SearchTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController controller;
  final double elevation;
  final Color? shadowColor;

  const SearchTextField({
    required this.controller,
    this.elevation = 5,
    this.shadowColor,
    this.hintText,
    super.key,
  });

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final FocusNode _focusNode = FocusNode();
  Color _fillColor = customTheme.textColor.shade100;

  @override
  void initState() {
    _focusNode.addListener(_listener);
    super.initState();
  }

  void _listener() {
    if (_focusNode.hasFocus) {
      setState(() {
        _fillColor = customTheme.backgroundColor;
      });
    } else {
      setState(() {
        _fillColor = customTheme.textColor.shade100;
      });
    }
  }

  @override
  Widget build(final BuildContext context) => Theme(
        data: Theme.of(context).copyWith(
          inputDecorationTheme: SearchTextFieldStyle.getStyle(context),
        ),
        child: Material(
          borderRadius: BorderRadius.circular(
            customTheme.borderRadiusCircular,
          ),
          elevation: widget.elevation,
          shadowColor: widget.shadowColor,
          child: TextFormField(
            controller: widget.controller,
            focusNode: _focusNode,
            decoration: InputDecoration(
              fillColor: _fillColor,
              hintText: widget.hintText,
              prefixIcon: const Icon(
                Icons.search,
              ),
            ),
          ),
        ),
      );

  @override
  void dispose() {
    _focusNode.removeListener(_listener);
    super.dispose();
  }
}
