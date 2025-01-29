import 'package:flutter_base_kit/app/assets/exporter/exporter_app_general.dart';

class ColorManager {
  static const primaryColor = Color(0xFF1570EF);
  static const lightBlueColor = Color(0xFFEAFDFF);
  static const whiteColor = Color(0xFFFFFFFF);
  static const beigeColor = Color(0xFFF5F5DC);
}

class GradientColorManager {
  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [
      ColorManager.primaryColor,
      ColorManager.lightBlueColor,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 0.8],
  );
}
