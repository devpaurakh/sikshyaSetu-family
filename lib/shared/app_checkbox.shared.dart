import 'package:flutter/material.dart';

class AppCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String text;
  final Color color;
  final Color activeColor;

  const AppCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.text = 'Remember me',
    this.color = Colors.black87,
    this.activeColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(value: value, onChanged: onChanged, activeColor: activeColor),
        Text(text, style: TextStyle(color: color, fontSize: 14)),
      ],
    );
  }
}
