import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  final double height;
  final double borderRadius;
  final double borderWidth;

  final Color? foregroundColor;
  final Color? borderColor;

  final Widget? icon;
  final bool isLoading;
  final bool expanded;

  const CustomOutlineButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 52,
    this.borderRadius = 12,
    this.borderWidth = 1.5,
    this.foregroundColor,
    this.borderColor,
    this.icon,
    this.isLoading = false,
    this.expanded = true,
  });

  @override
  Widget build(BuildContext context) {
    final color = foregroundColor ?? Theme.of(context).colorScheme.primary;

    final button = SizedBox(
      height: height,
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: color,

          side: BorderSide(color: borderColor ?? color, width: borderWidth),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: isLoading
            ? SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(strokeWidth: 2, color: color),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[icon!, const SizedBox(width: 8)],
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
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
