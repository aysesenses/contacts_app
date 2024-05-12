import 'package:flutter/material.dart';

/// Project custom colors
class CustomColorScheme {
  CustomColorScheme._();

  /// Light color scheme set
  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light, // Set to light for your preference
    primary: Color(0xFF0075FF), // White (FFFFFFF)
    onPrimary: Color(0xFF000000), // Black (000000)
    secondary: Color(0xFFBABABA), // Grey (BABABA)
    onSecondary: Color(0xFF000000), // Black (000000)
    error: Color(0xFF000000), // Black (maintain for consistency)
    onError: Color(0xFFFF0000), // Red (FF0000) for error text
    background: Color(0xFFF4F4F4), // Page color (F4F4F4)
    onBackground: Color(0xFF000000), // Black (000000)
    surface: Color(0xFFF4F4F4), // Page color (F4F4F4)
    onSurface: Color(0xFF000000), // Black (000000)
  );

  /// Get the current color scheme based on ThemeMode
  static ColorScheme getColorScheme(BuildContext context) {
    return lightColorScheme;
  }

  /// ToDo: darkColorScheme
  // static const darkColorScheme = ColorScheme(... );
}
