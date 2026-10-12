import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school360/core/constant/app_route.constant.dart';
import 'package:school360/core/theme/color.theme.dart';
import 'package:school360/features/dashboard/parents/bloc/parentNavBloc/parent_nav.bloc.dart';
import 'package:school360/features/dashboard/students/bloc/studentNavBloc/student_nav.bloc.dart';
import 'package:school360/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final String? savedRole = await _readSavedRole();

  final initialLocation = switch (savedRole) {
    'student' => AppRoutes.student,
    'parent' => AppRoutes.parent,
    _ => AppRoutes.login,
  };
  runApp(MyApp(router: createRouter(initialLocation: initialLocation)));
}

Future<String?> _readSavedRole() async {
  return null; // not logged in yet
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.router});

  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<StudentNavBloc>(create: (_) => StudentNavBloc()),
        BlocProvider<ParentNavBloc>(create: (_)=> ParentNavBloc())
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          //this is appbar theme i dont need to add theme in every UI page
          appBarTheme: AppBarTheme(
            surfaceTintColor: Colors.transparent,
            backgroundColor: AppColors.background,
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
              borderSide: BorderSide(color: AppColors.student, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.danger),
            ),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.student),
          scaffoldBackgroundColor: AppColors.background,
          primaryColor: AppColors.student,
          textTheme: GoogleFonts.poppinsTextTheme().apply(
            bodyColor: AppColors.textPrimary,
            displayColor: AppColors.textSecondary,
          ),
        ),
        routerConfig: router,
      ),
    );
  }
}
