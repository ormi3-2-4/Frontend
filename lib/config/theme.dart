import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xff333333),
    background: const Color(0xff333333),
    brightness: Brightness.dark,
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(fontSize: 20.sp),
  ),
);
