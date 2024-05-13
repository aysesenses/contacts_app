import 'package:contacts_app/product/theme/custom_color_scheme.dart';
import 'package:contacts_app/product/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Custom light theme for project design
class CustomLightTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.nunito().fontFamily,
        colorScheme: CustomColorScheme.lightColorScheme,
      );
}
