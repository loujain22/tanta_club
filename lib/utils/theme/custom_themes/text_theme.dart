import 'package:flutter/material.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme textTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Almarai',
        color: Colors.black),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 22.0,
        fontWeight: FontWeight.w600,
        fontFamily: 'Almarai',
        color: Colors.black),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        fontFamily: 'Almarai',
        color: Colors.black),

    ////////////////////////////////////////////////////////////////////

    titleLarge: const TextStyle().copyWith(
        fontSize: isArabic() ? 18.0 : 20.0,
        fontWeight: FontWeight.w500,
        fontFamily: 'Almarai',
        color: Colors.black),
    titleMedium: const TextStyle().copyWith(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        fontFamily: 'Almarai',
        color: Colors.black),
    titleSmall: const TextStyle().copyWith(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        fontFamily: 'Almarai',
        color: Colors.black),

    /////////////////////////////////////////////////////////////////////////

    bodyLarge: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        fontFamily: 'Almarai',
        color: Colors.black),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        fontFamily: 'Almarai',
        color: Colors.black),
    bodySmall: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        fontFamily: 'Almarai',
        color: Colors.black.withOpacity(0.5)),

    ///////////////////////////////////////////////////////////////////////////

    labelLarge: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        fontFamily: 'Almarai',
        color: Colors.black),
    labelMedium: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        fontFamily: 'Almarai',
        color: Colors.black.withOpacity(0.5)),
  );
}
