import 'package:flutter/material.dart';
import 'package:school360/core/constant/enums.constant.dart';
import 'package:school360/core/theme/color.theme.dart';

class StudentBottomNav extends StatelessWidget {
  const StudentBottomNav({
    super.key,
    required this.currentTab,
    required this.onTabSelected,
  });

  final StudentTab currentTab;
  final ValueChanged<StudentTab> onTabSelected;

  static const _items = <StudentTab, _StudentNavItem>{
    StudentTab.home: _StudentNavItem(
      'Home',
      Icons.home_outlined,
      Icons.home_rounded,
    ),
    StudentTab.timetable: _StudentNavItem(
      'Timetable',
      Icons.calendar_month_outlined,
      Icons.calendar_month_rounded,
    ),
    StudentTab.tasks: _StudentNavItem(
      'Tasks',
      Icons.assignment_turned_in_outlined,
      Icons.assignment_turned_in_rounded,
    ),
    StudentTab.results: _StudentNavItem(
      'Results',
      Icons.bar_chart_outlined,
      Icons.bar_chart_rounded,
    ),
    StudentTab.profile: _StudentNavItem(
      'Profile',
      Icons.person_outline_rounded,
      Icons.person_rounded,
    ),
  };

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          child: SizedBox(
            height: 60,
            child: Row(
              children: [
                for (final tab in StudentTab.values)
                  Expanded(
                    child: _StudentNavButton(
                      item: _items[tab]!,
                      selected: tab == currentTab,
                      onTap: () => onTabSelected(tab),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StudentNavItem {
  const _StudentNavItem(this.label, this.icon, this.activeIcon);

  final String label;
  final IconData icon;
  final IconData activeIcon;
}

class _StudentNavButton extends StatelessWidget {
  const _StudentNavButton({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  final _StudentNavItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.student : AppColors.textMuted;

    return Semantics(
      button: true,
      selected: selected,
      label: item.label,
      excludeSemantics: true,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              width: 56,
              height: 30,
              decoration: BoxDecoration(
                color: selected ? AppColors.studentTint : Colors.transparent,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                selected ? item.activeIcon : item.icon,
                size: 22,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              item.label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
