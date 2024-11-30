import 'package:flutter/material.dart';
import 'package:tanta_club/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:tanta_club/utils/theme/custom_themes/text_field_theme.dart';
import 'package:tanta_club/utils/theme/custom_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  // Light Theme
  static ThemeData arabicAppTheme = ThemeData(
    useMaterial3: true,
    // fontFamily: 'Poppins',
    brightness: Brightness.light,
    //  primaryColor: Colors.white,
    // scaffoldBackgroundColor: Colors.white,
    // appBarTheme: EAppBarTheme.lightAppBarTheme,
    textTheme: TTextTheme.textTheme,
    elevatedButtonTheme: TElevatedButtonTheme.elevatedButtonTheme,
    // chipTheme: EChipTheme.lightChipTheme,
    // checkboxTheme: ECheckboxTheme.lightCheckboxTheme,
    // bottomSheetTheme: EBottomSheetTheme.lightBottmSheetTheme,
    // outlinedButtonTheme: EOutlinedButtonTheme.lightOulinedButtonTheme,
    inputDecorationTheme: TTextFieldTheme.inputDecorationTheme,
  );
}
