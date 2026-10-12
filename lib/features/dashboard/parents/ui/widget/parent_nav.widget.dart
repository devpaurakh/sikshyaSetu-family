import 'package:flutter/material.dart';
import 'package:school360/core/constant/enums.constant.dart';
import 'package:school360/core/theme/color.theme.dart';

class ParentBottomNav extends StatelessWidget {
  const ParentBottomNav({
    super.key,
    required this.currentTab,
    required this.onTabSelected,
  });

  final ParentTab currentTab;
  final ValueChanged<ParentTab> onTabSelected;

  static const _items = <ParentTab, _ParentNavItem>{
    ParentTab.home:
        _ParentNavItem('Home', Icons.home_outlined, Icons.home_rounded),
    ParentTab.attendance: _ParentNavItem(
        'Attendance', Icons.how_to_reg_outlined, Icons.how_to_reg_rounded),
    ParentTab.fees: _ParentNavItem('Fees',
        Icons.account_balance_wallet_outlined, Icons.account_balance_wallet_rounded),
    ParentTab.notices: _ParentNavItem('Notices',
        Icons.notifications_none_rounded, Icons.notifications_rounded),
    ParentTab.profile: _ParentNavItem(
        'Profile', Icons.person_outline_rounded, Icons.person_rounded),
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
                for (final tab in ParentTab.values)
                  Expanded(
                    child: _ParentNavButton(
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

class _ParentNavItem {
  const _ParentNavItem(this.label, this.icon, this.activeIcon);

  final String label;
  final IconData icon;
  final IconData activeIcon;
}

class _ParentNavButton extends StatelessWidget {
  const _ParentNavButton({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  final _ParentNavItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.parent : AppColors.textMuted;

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
                color: selected ? AppColors.parentTint : Colors.transparent,
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