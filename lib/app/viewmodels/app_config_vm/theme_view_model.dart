import 'package:flutter_base_kit/app/viewmodels/base_view_model.dart';

import 'package:flutter_base_kit/app/assets/exporter/exporter_app_general.dart';

class ThemeViewModel extends BaseViewModel {
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  ThemeViewModel() {
    _initTheme();
  }

  void _initTheme() {
    final isDarkMode = SharedPreferenceHandler().getIsDarkMode();
    _themeMode = isDarkMode == true ? ThemeMode.dark : ThemeMode.light;
    SharedPreferenceHandler().putIsDarkMode(_themeMode == ThemeMode.dark);
    notifyListeners();
  }

  set themeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }

  void toggleThemeMode() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    SharedPreferenceHandler().putIsDarkMode(_themeMode == ThemeMode.dark);
    notifyListeners();
  }
}

extension ThemeGetter on BuildContext {
  /// Usage example: `context.theme`
  ThemeData get theme => Theme.of(this);
}
