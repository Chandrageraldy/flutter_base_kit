import 'package:flutter_base_kit/app/assets/exporter/exporter_app_general.dart';

enum FontSizes {
  /// Font Size 10
  extraSmall(10),

  /// Font Size 12
  small(12),

  /// Font Size 14
  medium(14),

  /// Font Size 15
  mediumPlus(15),

  /// Font Size 16
  large(16),

  /// Font Size 18
  extraLarge(18),

  /// Font Size 20
  huge(20),

  /// Font Size 22
  mediumHuge(22),

  /// Font Size 24
  extraHuge(24),

  /// Font Size 28
  massive(28),

  /// Font Size 32
  extraMassive(32);

  final double size;
  const FontSizes(this.size);
}

abstract class TypographyManager {
  FontWeight get weight;
  String get fontFamily;

  TextStyle withSize(FontSizes size);

  TextStyle withCustomSize(double size);
}

enum Quicksand implements TypographyManager {
  light,
  regular,
  medium,
  semiBold,
  bold;

  static const name = 'Quicksand';

  @override
  String get fontFamily => name;

  @override
  FontWeight get weight {
    switch (this) {
      case Quicksand.light:
        return FontWeight.w300;
      case Quicksand.regular:
        return FontWeight.w400;
      case Quicksand.medium:
        return FontWeight.w500;
      case Quicksand.semiBold:
        return FontWeight.w600;
      case Quicksand.bold:
        return FontWeight.w700;
    }
  }

  @override
  TextStyle withSize(FontSizes size) {
    return TextStyle(fontFamily: fontFamily, fontWeight: weight, fontSize: size.size, letterSpacing: 0);
  }

  @override
  TextStyle withCustomSize(double size) {
    return TextStyle(fontFamily: fontFamily, fontWeight: weight, fontSize: size, letterSpacing: 0);
  }
}
