import 'package:flutter_base_kit/app/assets/exporter/importer_app_general.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      initializeSplashScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            S.current.flutterBaseKit,
            style: _Styles.getAppTitleTextStyle(),
          ),
        ),
      ),
    );
  }
}

// * ----------------------------- Init ------------------------------
extension _Init on _SplashScreenPageState {
  Future<void> initializeSplashScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    // Uncomment To Remove IsOnboarding Shared Preference
    SharedPreferenceHandler().removeAll();
    if (mounted) {
      if (SharedPreferenceHandler().getHasOnboarded() == false) {
        context.go(NavigatePath.onboardingScreen);
      } else {
        context.go(NavigatePath.homeScreen);
      }
    }
  }
}

abstract class _Styles {
  static getAppTitleTextStyle() {
    return Quicksand.bold.withSize(FontSizes.extraMassive).copyWith(color: ColorManager.primaryColor);
  }
}
