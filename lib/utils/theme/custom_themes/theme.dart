import 'package:flutter/material.dart';
import 'package:tanta_club/utils/theme/custom_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  // Light Theme
  static ThemeData arabicAppTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    // appBarTheme: EAppBarTheme.lightAppBarTheme,
    textTheme: TTextTheme.arabicTextTheme,
    // elevatedButtonTheme: EElevatedButtonTheme.lightElevatedButtonTheme,
    // chipTheme: EChipTheme.lightChipTheme,
    // checkboxTheme: ECheckboxTheme.lightCheckboxTheme,
    // bottomSheetTheme: EBottomSheetTheme.lightBottmSheetTheme,
    // outlinedButtonTheme: EOutlinedButtonTheme.lightOulinedButtonTheme,
    // inputDecorationTheme: ETextFieldTheme.lightInputDecorationTheme,
  );
}
