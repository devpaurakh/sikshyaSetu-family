import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school360/core/constant/enums.constant.dart';
import 'package:school360/core/theme/color.theme.dart';
import 'package:school360/features/dashboard/students/bloc/studentNavBloc/student_nav.bloc.dart';
import 'package:school360/features/dashboard/students/ui/assignments.ui.dart';
import 'package:school360/features/dashboard/students/ui/home.ui.dart';
import 'package:school360/features/dashboard/students/ui/profile.ui.dart';
import 'package:school360/features/dashboard/students/ui/results.ui.dart';
import 'package:school360/features/dashboard/students/ui/timetable.ui.dart';
import 'package:school360/features/dashboard/students/ui/widgets/student_nav.widget.dart';

class StudentMainNavigation extends StatelessWidget {
  const StudentMainNavigation({super.key});

  static const _pages = <Widget>[
    StudentHomePage(),
    StudentTimeTablePage(),
    StudentTaskPage(),
    StudentResultPage(),
    StudentProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentNavBloc, StudentNavState>(
      builder: (context, navState) {
        return PopScope(
          canPop: navState.isHome,
          onPopInvokedWithResult: (didPop, _) {
            if (!didPop) {
              context.read<StudentNavBloc>().add(
                const StudentTabSelection(StudentTab.home),
              );
            }
          },
          child: Scaffold(
            backgroundColor: AppColors.background,
            body: IndexedStack(index: navState.tab.index, children: _pages),
            bottomNavigationBar: StudentBottomNav(
              currentTab: navState.tab,
              onTabSelected: (tab) =>
                  context.read<StudentNavBloc>().add(StudentTabSelection(tab)),
            ),
          ),
        );
      },
    );
  }
}
