import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/common/app_colors.dart';

class AppTheme {
  // Light theme 🌞
  static ThemeData lightTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      scaffoldBackgroundColor: Colors.white,

      // appBar Theme
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primaryColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22.sp,
          )),
      textTheme: TextTheme(
          titleLarge: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24.sp,
              color: Colors.white),
          headlineSmall:
              TextStyle(fontWeight: FontWeight.w700, fontSize: 22.sp)));
}
