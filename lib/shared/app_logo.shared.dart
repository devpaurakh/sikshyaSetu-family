import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class School360Logo extends StatelessWidget {
  const School360Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'School',
            style: GoogleFonts.outfit(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              letterSpacing: -1.5,
              color: Colors.black87,
            ),
          ),
          TextSpan(
            text: '360',
            style: GoogleFonts.outfit(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              letterSpacing: -1.5,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
