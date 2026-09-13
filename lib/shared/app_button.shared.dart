import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final Widget text;
  final VoidCallback? onPressed;

  final double height;
  final double borderRadius;

  final Color? backgroundColor;
  final Color? foregroundColor;

  final Widget? icon;
  final bool isLoading;
  final bool expanded;

  const AppElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 52,
    this.borderRadius = 12,
    this.backgroundColor,
    this.foregroundColor,
    this.icon,
    this.isLoading = false,
    this.expanded = true,
  });

  @override
  Widget build(BuildContext context) {
    final button = SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,

        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,

          disabledBackgroundColor: backgroundColor?.withValues(alpha: 0.5),

          disabledForegroundColor: foregroundColor?.withValues(alpha: 0.7),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),

        child: isLoading
            ? SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: foregroundColor,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[icon!, const SizedBox(width: 8)],
                  text,
                ],
              ),
      ),
    );

    if (expanded) {
      return SizedBox(width: double.infinity, child: button);
    }

    return button;
  }
}
