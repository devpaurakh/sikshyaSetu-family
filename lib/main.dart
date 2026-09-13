import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school360/core/theme/color.theme.dart';
import 'package:school360/features/auth/login/login.ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //this is appbar theme i dont need to add theme in every UI page
        appBarTheme: AppBarTheme(
          surfaceTintColor: Colors.transparent,
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: false,
        ),

        //input therem here
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[50],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.dangerColor),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        scaffoldBackgroundColor: AppColors.backgroundColor,
        primaryColor: AppColors.primaryColor,
        textTheme: GoogleFonts.poppinsTextTheme().apply(
          bodyColor: AppColors.textColor,
          displayColor: AppColors.textColor,
        ),
      ),
      home: const LoginPage(),
    );
  }
}
