import 'package:flutter/material.dart';

import '../theme/app_text_styles.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TopAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final topPadding = MediaQuery.of(context).padding.top;

    return Container(
      color: colorScheme.primary,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: preferredSize.height + topPadding,
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            Text(
              'LIQUIDEX',
              style: AppTextStyles.bodyMedium.copyWith(
                color: colorScheme.onPrimary,
                letterSpacing: 2,
              ),
            ),
            const Spacer(),
            Icon(Icons.sensors, color: colorScheme.onPrimary, size: 22),
          ],
        ),
      ),
    );
  }
}
