import 'package:flutter/material.dart';

extension ThemeModeExt on BuildContext {
  /// Indicates wheter the app is in dark mode
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  /// Indicates wheter the app is in light mode
  bool get isLightMode => Theme.of(this).brightness == Brightness.light;
}
