import 'package:flutter_base_kit/app/assets/exporter/exporter_app_general.dart';

class OnboardContent extends StatelessWidget {
  const OnboardContent({super.key, required this.onboardTitle, required this.onboardImage, required this.onboardDesc});

  final String onboardTitle;
  final String onboardImage;
  final String onboardDesc;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: StylesManager.defaultSpacing,
      children: [getFlutterLogo(), getTitleLabel(), getDescriptionLabel()],
    );
  }
}

// * ------------------------ WidgetFactories ------------------------
extension _WidgetFactories on OnboardContent {
  // Title Label
  Widget getTitleLabel() {
    return Text(
      onboardTitle,
      style: _Styles.getTitleLabelTextStyle(),
    );
  }

  // Flutter Logo Image
  Widget getFlutterLogo() {
    return Image.asset(
      onboardImage,
      width: _Styles.onboardImageSize,
      height: _Styles.onboardImageSize,
    );
  }

  // Description Label
  Widget getDescriptionLabel() {
    return Text(
      onboardDesc,
      style: _Styles.getDescriptionLabelTextStyle(),
      textAlign: TextAlign.center,
    );
  }
}

// * ----------------------------- Styles -----------------------------
abstract class _Styles {
  // Onboard Image Style
  static const onboardImageSize = 320.0;

  // Title Text Style
  static TextStyle getTitleLabelTextStyle() {
    return Quicksand.bold.withSize(FontSizes.massive).copyWith(color: ColorManager.primaryColor);
  }

  // Description Text Style
  static TextStyle getDescriptionLabelTextStyle() {
    return Quicksand.regular.withSize(FontSizes.medium);
  }
}

// * -------------------------- Onboard Data --------------------------
class Onboard {
  final String onboardTitle, onboardImage, onboardDesc;
  const Onboard({required this.onboardTitle, required this.onboardImage, required this.onboardDesc});
}

final List<Onboard> onboardData = [
  Onboard(
    onboardTitle: S.current.onboardingTitle1,
    onboardImage: ImageConstant.onboarding1,
    onboardDesc: S.current.onboardingDesc1,
  ),
  Onboard(
    onboardTitle: S.current.onboardingTitle2,
    onboardImage: ImageConstant.onboarding2,
    onboardDesc: S.current.onboardingDesc2,
  ),
  Onboard(
    onboardTitle: S.current.onboardingTitle3,
    onboardImage: ImageConstant.onboarding3,
    onboardDesc: S.current.onboardingDesc3,
  ),
];
