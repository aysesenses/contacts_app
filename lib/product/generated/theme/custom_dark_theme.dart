import 'package:contacts_app/product/generated/theme/custom_theme.dart';
import 'package:flutter/material.dart';

/// Custom light theme for project design
class CustomDarkTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        //colorScheme: CustomColorScheme.darkColorScheme,
      );
}
