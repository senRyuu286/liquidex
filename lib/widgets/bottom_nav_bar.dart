import 'package:flutter/material.dart';

import '../theme/app_text_styles.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  final int selectedIndex;
  final ValueChanged<int> onTap;

  static const _items = <_NavItem>[
    _NavItem(icon: Icons.insert_chart, label: 'Data'),
    _NavItem(icon: Icons.grid_view, label: 'Dex'),
    _NavItem(icon: Icons.receipt_long, label: 'Log'),
    _NavItem(icon: Icons.person, label: 'Bio'),
  ];

  static const double _iconSize = 26;
  static const double _itemHeight = 56;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      top: false,
      child: Container(
        color: colorScheme.surface,
        child: Row(
          children: List.generate(_items.length, (index) {
            final item = _items[index];
            final isActive = index == selectedIndex;

            final contentColor = isActive
                ? colorScheme.onPrimary
                : colorScheme.onSurfaceVariant;

            return Expanded(
              child: InkWell(
                onTap: () => onTap(index),
                child: Container(
                  height: _itemHeight,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isActive ? colorScheme.primary : Colors.transparent,
                    border: BoxBorder.fromLTRB(top: BorderSide(width: 3.0))
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(item.icon, color: contentColor, size: _iconSize),
                      const SizedBox(height: 4),
                      Text(
                        item.label.toUpperCase(),
                        style: AppTextStyles.navLabel.copyWith(
                          color: contentColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _NavItem {
  const _NavItem({required this.icon, required this.label});

  final IconData icon;
  final String label;
}
