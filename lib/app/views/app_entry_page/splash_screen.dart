import 'package:flutter_base_kit/app/assets/app_router/app_router.dart';
import 'package:flutter_base_kit/app/viewmodels/user_vm/user_view_model.dart';

import 'package:flutter_base_kit/app/assets/exporter/exporter_app_general.dart';

@RoutePage()
class SplashScreen extends BaseStatefulPage {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseStatefulState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _initializeSplashScreen();
    });
  }

  @override
  Widget body() {
    return Center(child: getAppTitleLabel());
  }
}

// * ------------------------ WidgetFactories -----------------------
extension _WidgetFactories on _SplashScreenState {
  // App Title Label
  Widget getAppTitleLabel() {
    return Text(
      S.current.flutterBaseKit,
      style: _Styles.getAppTitleTextStyle(),
    );
  }
}

// * ------------------------ PrivateMethods ------------------------
extension _PrivateMethods on _SplashScreenState {
  Future<void> _initializeSplashScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    navigateBasedOnState();
  }

  void navigateBasedOnState() {
    if (mounted) {
      if (SharedPreferenceHandler().getHasOnboarded() == false) {
        context.router.replaceAll([const OnboardingRoute()]);
      } else {
        if (context.read<UserViewModel>().isLoggedIn) {
          context.router.replaceAll([const DashboardNavigatorRoute()]);
        } else {
          context.router.replaceAll([const LoginRoute()]);
        }
      }
    }
  }
}

// * ---------------------------- Styles -----------------------------
abstract class _Styles {
  // App Title Text Style
  static getAppTitleTextStyle() {
    return Quicksand.bold.withSize(FontSizes.extraMassive).copyWith(color: ColorManager.blueColor);
  }
}
