import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHandler {
  static SharedPreferences? _sharedPreferences;
  static final SharedPreferenceHandler _instance = SharedPreferenceHandler._internal();
  static const spLocale = 'locale';
  static const spIsDarkMode = 'isDarkMode';
  static const spHasOnboarded = 'hasOnboarded';

  // Factory constructor that returns the single instance.
  factory SharedPreferenceHandler() {
    return _instance;
  }

  SharedPreferenceHandler._internal();

  Future<void> initialize() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  // Locale
  String getLocale() {
    return _sharedPreferences?.getString(spLocale) ?? '';
  }

  Future<bool?> putLocale(String? language) async {
    return _sharedPreferences?.setString(spLocale, language ?? '');
  }

  // Is Dark Mode
  bool getIsDarkMode() {
    return _sharedPreferences?.getBool(spIsDarkMode) ?? false;
  }

  Future<bool?> putIsDarkMode(bool isDarkMode) async {
    return _sharedPreferences?.setBool(spIsDarkMode, isDarkMode);
  }

  // Has Onboarded
  bool getHasOnboarded() {
    return _sharedPreferences?.getBool(spHasOnboarded) ?? false;
  }

  Future<bool?> putHasOnboarded(bool hasOnboarded) async {
    return _sharedPreferences?.setBool(spHasOnboarded, hasOnboarded);
  }

  // Remove All
  Future<void> removeAll() async {
    if (_sharedPreferences == null) return;

    await Future.wait([
      _sharedPreferences!.remove(spHasOnboarded),
      _sharedPreferences!.remove(spIsDarkMode),
      _sharedPreferences!.remove(spLocale),
    ]);
  }
}
