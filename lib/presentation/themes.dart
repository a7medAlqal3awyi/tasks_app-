import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

const Color blueColor = Color(0xFF4e5ae8);
const Color yellowColor = Color(0xFFFFB746);
const Color pinkColor = Color(0xFFff4667);
const Color deepOrange = Colors.deepOrange;

const Color darkGreyColor = Color(0xFF121212);
const Color primaryColor = blueColor;
const Color withe = Colors.white;
Color darkHeaderColor = Colors.grey.shade800;

class Themes {
  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      background: Colors.white,
      primary: primaryColor,
      brightness: Brightness.light,
    ),
  );
  static final darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(
        background: darkGreyColor,
        primary: primaryColor,
        brightness: Brightness.dark),
  );
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24.sp,
          color: Get.isDarkMode ? Colors.grey[400] : Colors.grey));
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30.sp,
  ));
}

TextStyle get titleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
  ));
}

TextStyle get subTitleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    color: Get.isDarkMode ? Colors.grey[100] : Colors.grey[600],
  ));
}
