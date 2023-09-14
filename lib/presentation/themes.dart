import 'package:flutter/material.dart';

const Color blueColor = Color(0xFF4e5ae8);
const Color yellowColor = Color(0xFFFFB746);
const Color binkColor = Color(0xFFff4667);
const Color darkGreyColor = Color(0xFF121212);
const Color primaryColor = blueColor;
const Color withe = Colors.white;
Color darkHeaderColor = Colors.grey.shade800;

class Themes {
  static final lightTheme = ThemeData(
      primaryColor: primaryColor,
      appBarTheme: const AppBarTheme(
        color: primaryColor,
      ),
      brightness: Brightness.light);
  static final darkTheme = ThemeData(
      primaryColor: darkGreyColor,
      appBarTheme: const AppBarTheme(
        color: darkGreyColor,
      ),
      brightness: Brightness.dark);
}
