import 'package:flutter/material.dart';

import '../utils/extensions.dart';


TextTheme textThemes(BuildContext context) {
  return TextTheme(
    titleSmall: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: context.themeOption.colorBlack,
        fontFamily: "PlusJakartaSans"),
    titleMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 17,
        color: context.themeOption.colorBlack,
        fontFamily: "LatoFont"),
    titleLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: context.themeOption.colorBlack,
        fontFamily: "LatoFont"),
    labelSmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: context.themeOption.colorText,
        fontFamily: "LatoFont"),
    labelMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: context.themeOption.colorText,
        fontFamily: "LatoFont"),
    labelLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: context.themeOption.colorText,
        fontFamily: "LatoFont"),
    bodySmall: TextStyle(
        color: context.themeOption.colorTextLabel, fontFamily: "LatoFont"),
    bodyMedium: TextStyle(
        color: context.themeOption.colorTextLabel, fontFamily: "LatoFont"),
    bodyLarge:
    TextStyle(color: context.themeOption.colorText, fontFamily: "LatoFont"),
    headlineSmall: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: context.themeOption.colorBlack,
        fontFamily: "LatoFont"),
    headlineMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: context.themeOption.colorBlack,
        fontFamily: "LatoFont"),
    headlineLarge: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 22,
        color: context.themeOption.colorBlack,
        fontFamily: "LatoFont"),
  );
}
