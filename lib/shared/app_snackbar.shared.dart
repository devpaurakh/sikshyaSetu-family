import 'package:flutter/material.dart';
import 'package:school360/core/theme/color.theme.dart';

class AppSnackBar {
  AppSnackBar._();

  static void show(
    BuildContext context, {
    required String message,
    Color? backgroundColor,
    Color? foregroundColor,
    IconData? icon,
    Duration duration = const Duration(seconds: 3),
  }) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, color: foregroundColor ?? Colors.white),
            const SizedBox(width: 12),
          ],
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: foregroundColor ?? Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      duration: duration,
      behavior: SnackBarBehavior.fixed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  // SUCCESS
  static void success(BuildContext context, String message) {
    show(
      context,
      message: message,
      backgroundColor: AppColors.success,
      icon: Icons.check_circle_outline,
    );
  }

  // ERROR
  static void error(BuildContext context, String message) {
    show(
      context,
      message: message,
      backgroundColor: AppColors.danger,
      icon: Icons.error_outline,
    );
  }

  // WARNING
  static void warning(BuildContext context, String message) {
    show(
      context,
      message: message,
      backgroundColor: AppColors.accentSoft,
      icon: Icons.warning_amber_outlined,
    );
  }

  // INFO
  static void info(BuildContext context, String message) {
    show(
      context,
      message: message,
      backgroundColor: Colors.blue,
      icon: Icons.info_outline,
    );
  }
}
