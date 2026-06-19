import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/bottom_nav_bar.dart';
import '../../widgets/top_app_bar.dart';

class DashboardShell extends StatelessWidget {
  const DashboardShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: const TopAppBar(),
      body: navigationShell,
      bottomNavigationBar: BottomNavBar(
        selectedIndex: navigationShell.currentIndex,
        onTap: _onTap,
      ),
    );
  }
}
