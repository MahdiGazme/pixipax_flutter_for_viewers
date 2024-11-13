import 'package:flutter/material.dart';

import 'primary_text_field.dart';

class CustomDatePicker extends StatefulWidget {
  final String topLabel;
  final DateTime firstDate;
  final DateTime lastDate;
  final DateTime? currentDate;
  final IconData? prefixIcon;
  final void Function(DateTime date)? onDatePicked;

  const CustomDatePicker({
    required this.topLabel,
    required this.firstDate,
    required this.lastDate,
    this.prefixIcon,
    this.onDatePicked,
    super.key,
    this.currentDate,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  final _controller = TextEditingController();

  @override
  void initState() {
    _initialDate();
    super.initState();
  }

  void _initialDate() {
    if (widget.currentDate != null) {
      _formatDate(widget.currentDate!);
    }
  }

  @override
  Widget build(final BuildContext context) => PrimaryTextField(
        topLabel: widget.topLabel,
        readOnly: true,
        controller: _controller,
        prefixIcon: Icon(
          widget.prefixIcon ?? Icons.calendar_month_outlined,
        ),
        onTap: () async {
          await _pickDate(context);
        },
      );

  Future<DateTime?> _datePicker(final BuildContext context) => showDatePicker(
        context: context,
        firstDate: widget.firstDate,
        lastDate: widget.lastDate,
        currentDate: widget.currentDate ?? DateTime.now(),
      );

  Future<void> _pickDate(final BuildContext context) async {
    final pickedDate = await _datePicker(context);
    if (pickedDate != null) {
      setState(() {
        _formatDate(pickedDate);
      });
      widget.onDatePicked?.call(pickedDate);
    }
  }

  void _formatDate(final DateTime pickedDate) {
    final date = pickedDate.toString().split(' ')[0];
    _controller.text = date.replaceAll('-', '/');
  }
}
