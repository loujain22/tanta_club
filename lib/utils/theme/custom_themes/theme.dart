import 'package:flutter/material.dart';
import 'package:tanta_club/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:tanta_club/utils/theme/custom_themes/icon_button_theme.dart';
import 'package:tanta_club/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:tanta_club/utils/theme/custom_themes/text_field_theme.dart';
import 'package:tanta_club/utils/theme/custom_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  // App Theme
  static ThemeData arabicAppTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Almarai',
      brightness: Brightness.light,
      textTheme: TTextTheme.textTheme,
      elevatedButtonTheme: TElevatedButtonTheme.elevatedButtonTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.oulinedButtonTheme,
      inputDecorationTheme: TTextFieldTheme.inputDecorationTheme,
      iconButtonTheme: TIconButtonTheme.iconButtonTheme);
}
