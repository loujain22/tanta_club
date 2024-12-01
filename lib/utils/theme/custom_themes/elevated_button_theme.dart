import 'package:flutter/material.dart';
import 'package:tanta_club/style/colors.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static final elevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.black,
          backgroundColor: TColors.primary,
          disabledForegroundColor: Colors.grey,
          disabledBackgroundColor: Colors.grey,
          side: const BorderSide(color: TColors.primary),
          padding: const EdgeInsets.symmetric(vertical: 18),
          textStyle: const TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))));
}
