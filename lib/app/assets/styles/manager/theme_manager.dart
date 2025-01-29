import 'package:flutter_base_kit/app/assets/exporter/exporter_app_general.dart';

class ThemeManager {
  static ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(surface: Colors.white, primary: Color(0xFF1570EF)),
    fontFamily: 'Quicksand',
  );

  static ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(surface: Colors.black, primary: Color(0xFF1570EF)),
    fontFamily: 'Quicksand',
  );
}
