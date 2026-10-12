import 'package:go_router/go_router.dart';
import 'package:school360/core/constant/app_route.constant.dart';
import 'package:school360/features/auth/login/login.ui.dart';
import 'package:school360/features/dashboard/parents/parents_main.nav.dart';
import 'package:school360/features/dashboard/students/students_main.nav.dart';

GoRouter createRouter({String initialLocation = AppRoutes.login}) {
  return GoRouter(
    initialLocation: initialLocation,
    routes: [
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.student,
        builder: (context, state) => const StudentMainNavigation(),
      ),
      GoRoute(
        path: AppRoutes.parent,
        builder: (context, state) => const ParentsMainNavigation(),
      ),
    ],
  );
}
