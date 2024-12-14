import 'package:flutter/material.dart';
import 'package:flutter_base_kit/app/view/onboarding/onboarding_screen.dart';
import 'package:flutter_base_kit/app/view/profile_screen.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_base_kit/app/assets/constants.dart';
import 'package:flutter_base_kit/app/view/app_entry/splash_screen.dart';
import 'package:flutter_base_kit/app/view/home_screen.dart';
import 'package:flutter_base_kit/app/view/root_navigator/root_navigator_screen.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter routerConfiguration() {
    return GoRouter(
      initialLocation: NavigatePath.splashScreen,
      navigatorKey: _rootNavigatorKey,
      // NAVIGATION BAR ROUTE
      routes: [
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state, child) {
            return NoTransitionPage(
              child: RootNavigatorScreen(
                location: state.location,
                child: child,
              ),
            );
          },
          routes: [
            // CONFIGURE NAVIGATION BAR ROUTING
            GoRoute(
              name: NavigateName.homeScreen,
              path: NavigatePath.homeScreen,
              pageBuilder: (context, state) => const NoTransitionPage(child: HomeScreen()),
            ),
            GoRoute(
              name: NavigateName.profileScreen,
              path: NavigatePath.profileScreen,
              pageBuilder: (context, state) => const NoTransitionPage(child: ProfileScreen()),
            ),
            // ADD MORE NAVIGATION BAR ROUTING BELOW
          ],
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          name: NavigateName.splashScreen,
          path: NavigatePath.splashScreen,
          pageBuilder: (context, state) => const NoTransitionPage(child: SplashScreenPage()),
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          name: NavigateName.onboardingScreen,
          path: NavigatePath.onboardingScreen,
          pageBuilder: (context, state) => const NoTransitionPage(child: OnboardingScreen()),
        )
      ],
    );
  }
}
