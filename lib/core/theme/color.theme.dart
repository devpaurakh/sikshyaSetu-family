import 'package:flutter/material.dart';


class AppColors {
  AppColors._();

  // Role colors
  static const Color student = Color(0xFF3338C8); 
  static const Color studentDark = Color(0xFF23278F); // login header, text on tint
  static const Color studentTint = Color(0xFFE8E9FB); 

  static const Color parent = Color(0xFF0B6B63); // teal
  static const Color parentDark = Color(0xFF084F49);
  static const Color parentTint = Color(0xFFDDF1EE);

  // Shared accent (deadlines, "Next" badges, highlights)
  static const Color accent = Color(0xFFFF8A1F);
  static const Color accentSoft = Color(0xFFFFB347);
  static const Color accentTint = Color(0xFFFFF1DE);
  static const Color accentText = Color(0xFF9A4B00);

  // Backgrounds and surfaces
  static const Color background = Color(0xFFF4F5FA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color border = Color(0xFFE4E6F0);
  static const Color inputBorder = Color(0xFFD5D8E8);
  static const Color divider = Color(0xFFEEF0F6);

  // Text
  static const Color textPrimary = Color(0xFF141833);
  static const Color textSecondary = Color(0xFF4A506B);
  static const Color textMuted = Color(0xFF5B6178);
  static const Color onDark = Color(0xFFFFFFFF);

  // Status colors
  static const Color success = Color(0xFF0E7A53);
  static const Color successText = Color(0xFF0A6444);
  static const Color successTint = Color(0xFFDDF3EA);

  static const Color warning = Color(0xFF9A4B00);
  static const Color warningTint = Color(0xFFFFF1DE);

  static const Color danger = Color(0xFFB4231B);
  static const Color dangerTint = Color(0xFFFCE5E3);
}
