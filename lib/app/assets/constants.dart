import 'package:flutter_base_kit/generated/l10n.dart';

class Constants {}

class NavigateName {
  static const String splashScreen = 'splashScreen';
  static const String onboardingScreen = 'onboardingScreen';
  static const String homeScreen = 'home';
  static const String profileScreen = 'profile';
}

class NavigatePath {
  static const String splashScreen = '/splashScreen';
  static const String onboardingScreen = '/onboardingScreen';
  static const String homeScreen = '/';
  static const String profileScreen = '/profileScreen';
}

class NavigatorRouteItem {
  static const int homeScreen = 0;
  static const int profileScreen = 1;
}

class ImageConstant {
  static const String onboarding1 = 'lib/app/assets/images/mit-license.png';
  static const String onboarding2 = 'lib/app/assets/images/mvvm-structure.png';
  static const String onboarding3 = 'lib/app/assets/images/flutter.png';
}

enum Language {
  english('en'),
  simplifiedChinese('zh');

  final String languageCode;
  const Language(this.languageCode);

  String get label {
    switch (this) {
      case english:
        return S.current.english;
      case simplifiedChinese:
        return S.current.simplifiedChinese;
    }
  }
}
