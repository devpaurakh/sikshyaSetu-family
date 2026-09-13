import 'package:flutter/material.dart';
import 'package:school360/core/theme/color.theme.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputAction textInputAction;
  final bool enabled;

  const AppTextFormField({
    super.key,
    this.controller,
    required this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.onChanged,
    this.textInputAction = TextInputAction.next,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      textInputAction: textInputAction,
      enabled: enabled,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: AppColors.primaryColor)
            : null,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
