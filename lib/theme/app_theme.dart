import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

const Color primaryColor = Color(0xFF137FEC);

var lightTheme = AppTheme(
  id: 'light',
  description: 'Light Mode',
  data: ThemeData(primaryColor: primaryColor, useMaterial3: true),
  options: ThemeOptions(
    colorPrimary: primaryColor,
    colorBlack: Colors.black,
    colorBlack2: const Color(0xFF0F1729),
    colorWhite: Colors.white,
    colorWhite2: Colors.white.withValues(alpha: 0.45),
    colorText: const Color(0xff2D3333),
    colorTextLabel: const Color(0xff9F9F9F),
    colorBorder: const Color(0xFFD9D9D9),
    colorHintText: const Color(0xFFA2A9B4),
    colorRed: Colors.red,
  ),
);

var darkTheme = AppTheme(
  id: 'dark',
  description: 'Dark Mode',
  data: ThemeData(primaryColor: primaryColor, useMaterial3: true),
  options: ThemeOptions(
    colorPrimary: primaryColor,
    colorBlack: Colors.white,
    colorBlack2: Colors.white,
    colorWhite: const Color(0xFF101922),
    colorWhite2: Colors.black.withValues(alpha: 0.35),
    colorText: const Color(0xffe3e5e5),
    colorTextLabel: const Color(0xff9F9F9F),
    colorBorder: const Color(0xFFF5F5F5),
    colorHintText: const Color(0xFFF5F5F5),
    colorRed: Colors.red,
  ),
);

class ThemeOptions implements AppThemeOptions {
  final Color colorPrimary;
  final Color colorBlack;
  final Color colorBlack2;
  final Color colorWhite;
  final Color colorText;
  final Color colorTextLabel;
  final Color colorWhite2;
  final Color colorBorder;
  final Color colorHintText;
  final Color colorRed;

  ThemeOptions({
    required this.colorPrimary,
    required this.colorBlack,
    required this.colorText,
    required this.colorTextLabel,
    required this.colorWhite,
    required this.colorWhite2,
    required this.colorBorder,
    required this.colorHintText,
    required this.colorRed,
    required this.colorBlack2,
  });
}
