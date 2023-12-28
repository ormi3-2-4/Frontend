import 'package:flutter/material.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xff2196f3),
    primary: const Color(0xff0061a6),
    onPrimary: Colors.white,
    primaryContainer: const Color(0xffd0e4ff),
    onPrimaryContainer: const Color(0xff001d36),
    secondary: const Color(0xff535f70),
    onSecondary: Colors.white,
    secondaryContainer: const Color(0xffd6e3f7),
    onSecondaryContainer: const Color(0xff101c2b),
    tertiary: const Color(0xff6b5778),
    onTertiary: const Color(0xffffffff),
    tertiaryContainer: const Color(0xfff3daff),
    onTertiaryContainer: const Color(0xff251432),
    error: const Color(0xffba1b1b),
    onError: Colors.white,
    errorContainer: const Color(0xffffdad4),
    onErrorContainer: const Color(0xff410001),
    brightness: Brightness.light,
    background: const Color(0xfffdfcff),
    onBackground: const Color(0xff1b1b1b),
    surface: const Color(0xfffdfcff),
    onSurface: const Color(0xff1b1b1b),
    inverseSurface: const Color(0xff2f3033),
    onInverseSurface: const Color(0x0ff1f0f4),
    inversePrimary: const Color(0xff9ccaff),
    surfaceVariant: const Color(0xffdfe2eb),
    onSurfaceVariant: const Color(0xff42474e),
    outline: const Color(0xff73777f),
    shadow: const Color(0xff000000),
  ),

  // ElevatedButton
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      backgroundColor: MaterialStateColor.resolveWith((states) => const Color(0xff2196f3)),
      foregroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
      textStyle: MaterialStateTextStyle.resolveWith(
          (states) => const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
    ),
  ),

  // AppBar
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff2196f3),
    foregroundColor: Colors.white,
    titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 30),
    elevation: 0,
    centerTitle: true,
  ),
);
