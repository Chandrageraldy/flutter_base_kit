import 'package:flutter/material.dart';

class ThemeManager {
  static ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(background: Colors.white),
  );

  static ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(background: Colors.black),
  );
}
