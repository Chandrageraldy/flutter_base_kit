import 'dart:io' show Platform;
import 'package:flutter_base_kit/app/viewmodels/base_view_model.dart';

import 'package:flutter_base_kit/app/assets/exporter/exporter_app_general.dart';

class LocaleViewModel extends BaseViewModel {
  late Locale _currentAppLocale;

  Locale get currentAppLocale => _currentAppLocale;

  LocaleViewModel() {
    _initLocale();
  }

  void _initLocale() {
    final savedLocale = SharedPreferenceHandler().getLocale();
    _currentAppLocale = savedLocale.isNotEmpty == true ? Locale(savedLocale) : Locale(Platform.localeName);
    SharedPreferenceHandler().putLocale(_currentAppLocale.languageCode);
    notifyListeners();
  }

  Future<void> setLocale(Language language) async {
    if (_currentAppLocale.languageCode == language.languageCode) {
      return;
    }
    _currentAppLocale = Locale(language.languageCode);
    SharedPreferenceHandler().putLocale(_currentAppLocale.languageCode);
    notifyListeners();
  }
}
