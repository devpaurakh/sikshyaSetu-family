import 'package:flutter/material.dart';
import 'package:school360/core/theme/color.theme.dart';

class AppDialog {
  AppDialog._();

  static Future<T?> show<T>(
    BuildContext context, {
    required String title,
    required String message,
    IconData? icon,
    Color? iconColor,
    String buttonText = 'OK',
    Color? buttonColor,
    VoidCallback? onPressed,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: [
              if (icon != null) ...[
                Icon(icon, color: iconColor, size: 28),
                const SizedBox(width: 10),
              ],
              Expanded(child: Text(title)),
            ],
          ),
          content: Text(message),
          actions: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  onPressed?.call();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  foregroundColor: AppColors.background,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(buttonText),
              ),
            ),
          ],
        );
      },
    );
  }

  static Future<void> success(
    BuildContext context, {
    required String title,
    required String message,
    String buttonText = 'OK',
    VoidCallback? onPressed,
  }) {
    return show(
      context,
      title: title,
      message: message,
      icon: Icons.check_circle_outline,
      iconColor: AppColors.success,
      buttonColor: AppColors.success,
      buttonText: buttonText,
      onPressed: onPressed,
    );
  }

  static Future<void> error(
    BuildContext context, {
    required String title,
    required String message,
    String buttonText = 'OK',
    VoidCallback? onPressed,
  }) {
    return show(
      context,
      title: title,
      message: message,
      icon: Icons.error_outline,
      iconColor: AppColors.danger,
      buttonColor: AppColors.danger,
      buttonText: buttonText,
      onPressed: onPressed,
    );
  }

  static Future<void> warning(
    BuildContext context, {
    required String title,
    required String message,
    String buttonText = 'OK',
    VoidCallback? onPressed,
  }) {
    return show(
      context,
      title: title,
      message: message,
      icon: Icons.warning_amber_outlined,
      iconColor: AppColors.accentSoft,
      buttonColor: AppColors.accentSoft,
      buttonText: buttonText,
      onPressed: onPressed,
    );
  }

  static Future<void> info(
    BuildContext context, {
    required String title,
    required String message,
    String buttonText = 'OK',
    VoidCallback? onPressed,
  }) {
    return show(
      context,
      title: title,
      message: message,
      icon: Icons.info_outline,
      iconColor: Colors.blue,
      buttonColor: Colors.blue,
      buttonText: buttonText,
      onPressed: onPressed,
    );
  }

  static Future<bool> confirm(
    BuildContext context, {
    required String title,
    required String message,
    String cancelText = 'Cancel',
    String confirmText = 'Confirm',
    Color? confirmColor,
    IconData? icon,
    Color? iconColor,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: [
              if (icon != null) ...[
                Icon(icon, color: iconColor, size: 28),
                const SizedBox(width: 10),
              ],
              Expanded(child: Text(title)),
            ],
          ),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(cancelText),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    confirmColor ?? Theme.of(context).colorScheme.primary,
                foregroundColor: AppColors.background,
              ),
              child: Text(confirmText),
            ),
          ],
        );
      },
    );

    return result ?? false;
  }
}
