import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:travel_flutter/theme/app_theme.dart';

extension ContextExtension on BuildContext {
  ThemeOptions get themeOption => ThemeProvider.optionsOf<ThemeOptions>(this);

  bool get isDarkTheme => ThemeProvider.controllerOf(this).theme.id == 'dark';

  ThemeController get themeController => ThemeProvider.controllerOf(this);
}

extension IntExtension on int{
  Widget height()=> SizedBox(height: toDouble(),);
  Widget width()=> SizedBox(width: toDouble(),);
}