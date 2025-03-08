import 'package:flutter_base_kit/app/assets/exporter/exporter_app_general.dart';

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

enum FormFields { email, password }

class TableName {
  static String user = 'user';
}

class TableCol {
  static String userId = 'userId';
}
