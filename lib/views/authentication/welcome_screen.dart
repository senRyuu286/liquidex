import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../router/app_routes.dart';
import '../../theme/app_text_styles.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              const SizedBox(height: 56),

              Expanded(
                flex: 5,
                child: Center(
                  child: Image.asset(
                    'assets/images/welcome_illustration.png',
                    fit: BoxFit.contain,
                    width: double.infinity,
                  ),
                ),
              ),

              Expanded(
                flex: 2,
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Text(
                          'YOUR DEX.\nALWAYS WATCHING.',
                          style: AppTextStyles.displayLarge.copyWith(
                            color: theme.colorScheme.onSurface,
                            height: 1.8,
                          ),
                        ),
                      ),
                      Text(
                        'Track every drop. Know every ceiling.',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: theme.textTheme.bodySmall!.color,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => context.go(AppRoutes.signIn),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.colorScheme.primary,
                            foregroundColor: theme.colorScheme.onPrimary,
                            textStyle: AppTextStyles.buttonLabel,
                            padding: const EdgeInsets.symmetric(
                              vertical: 18,
                              horizontal: 24,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            elevation: 0,
                          ),
                          child: const Text('INITIALIZE SYSTEM'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
