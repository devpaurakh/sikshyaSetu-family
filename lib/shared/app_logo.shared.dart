import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school360/core/theme/color.theme.dart';

class School360Logo extends StatelessWidget {
  const School360Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Sikshya',
            style: GoogleFonts.outfit(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              letterSpacing: -1.5,
              color: AppColors.textPrimary,
            ),
          ),
          TextSpan(
            text: 'Setu',
            style: GoogleFonts.outfit(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              letterSpacing: -1.5,
              color: AppColors.student,
            ),
          ),
        ],
      ),
    );
  }
}
