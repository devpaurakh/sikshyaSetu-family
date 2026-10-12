import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school360/core/constant/enums.constant.dart';
import 'package:school360/features/dashboard/parents/bloc/parentNavBloc/parent_nav.bloc.dart';
import 'package:school360/features/dashboard/parents/ui/parent_attendance.ui.dart';
import 'package:school360/features/dashboard/parents/ui/parent_fees.ui.dart';
import 'package:school360/features/dashboard/parents/ui/parent_home.ui.dart';
import 'package:school360/features/dashboard/parents/ui/parent_notices.ui.dart';
import 'package:school360/features/dashboard/parents/ui/parent_profile.ui.dart';
import 'package:school360/features/dashboard/parents/ui/widget/parent_nav.widget.dart';

class ParentsMainNavigation extends StatelessWidget {
  const ParentsMainNavigation({super.key});

  static const _pages = <Widget>[
    ParentHomePage(),
    ParentAttendancePage(),
    ParentFeesPage(),
    ParentNoticePage(),
    ParentProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ParentNavBloc, ParentNavState>(
      builder: (context, navstate) {
        return PopScope(
          canPop: navstate.isHome,
          onPopInvokedWithResult: (didPop, result) {
            if (!didPop) {
              context.read<ParentNavBloc>().add(
                const ParentTabSelected(ParentTab.home),
              );
            }
          },
          child: Scaffold(
            body: IndexedStack(index: navstate.tab.index, children: _pages),
            bottomNavigationBar: ParentBottomNav(
              currentTab: navstate.tab,
              onTabSelected: (tab) =>
                  context.read<ParentNavBloc>().add(ParentTabSelected(tab)),
            ),
          ),
        );
      },
    );
  }
}
