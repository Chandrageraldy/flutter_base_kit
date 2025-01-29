import 'package:auto_route/auto_route.dart';
import 'package:flutter_base_kit/app/views/app_entry_page/splash_screen.dart';
import 'package:flutter_base_kit/app/views/auth_page/login_page.dart';
import 'package:flutter_base_kit/app/views/auth_page/signup_page.dart';
import 'package:flutter_base_kit/app/views/dashboard_page/dashboard_navigator_page.dart';
import 'package:flutter_base_kit/app/views/dashboard_page/dashboard_page.dart';
import 'package:flutter_base_kit/app/views/home_page/home_page.dart';
import 'package:flutter_base_kit/app/views/onboarding_page/onboarding_page.dart';
import 'package:flutter_base_kit/app/views/profile_page/profile_page.dart';
import 'package:flutter_base_kit/app/views/root_navigator_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: RootNavigatorRoute.page,
          initial: true,
          children: [
            ...getAppEntryRoutes(),
            getDashboardRoutes(),
          ],
        ),
      ];

  List<AutoRoute> getAppEntryRoutes() {
    return [
      AutoRoute(page: SplashRoute.page, initial: true),
      AutoRoute(page: OnboardingRoute.page),
      AutoRoute(page: LoginRoute.page),
      AutoRoute(page: SignUpRoute.page),
    ];
  }

  AutoRoute getDashboardRoutes() {
    return AutoRoute(
      page: DashboardNavigatorRoute.page,
      children: [
        AutoRoute(
          page: DashboardRoute.page,
          initial: true,
          children: [
            AutoRoute(page: HomeRoute.page, initial: true),
            AutoRoute(page: ProfileRoute.page),
          ],
        )
      ],
    );
  }
}
