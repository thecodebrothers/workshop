import 'package:flutter/widgets.dart';

class ColorThemeData {
  ColorThemeData({
    required this.primary,
    required this.primaryInactive,
    required this.secondary,
    required this.brand,
    required this.page,
  });

  final Color primary;
  final Color primaryInactive;
  final Color secondary;
  final Color brand;
  final Color page;
}
