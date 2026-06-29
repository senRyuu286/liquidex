import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../providers/auth_provider.dart';
import '../views/authentication/sign_in_screen.dart';
import '../views/authentication/sign_up_screen.dart';
import '../views/dashboard/bio_screen.dart';
import '../views/dashboard/dashboard_shell.dart';
import '../views/dashboard/data_screen.dart';
import '../views/dashboard/dex_screen.dart';
import '../views/dashboard/log_screen.dart';
import '../views/authentication/welcome_screen.dart';
import 'app_routes.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: AppRoutes.welcome,
    redirect: (context, state) {
      if (authState.isLoading) {
        return null;
      }

      final User? user = authState.value;
      final isLoggedIn = user != null;

      final onWelcome = state.matchedLocation == AppRoutes.welcome;
      final loggingIn =
          state.matchedLocation == AppRoutes.signIn ||
          state.matchedLocation == AppRoutes.signUp;

      if (!isLoggedIn && !loggingIn && !onWelcome) {
        return AppRoutes.signIn;
      }

      if (isLoggedIn && (loggingIn || onWelcome)) {
        return AppRoutes.dex;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.signIn,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: AppRoutes.signUp,
        builder: (context, state) => const SignUpScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return DashboardShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.data,
                builder: (context, state) => const DataScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.dex,
                builder: (context, state) => const DexScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.log,
                builder: (context, state) => const LogScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.bio,
                builder: (context, state) => const BioScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
