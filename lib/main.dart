
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:travel_flutter/core/config/app_router.dart';
import 'package:travel_flutter/theme/app_theme.dart';
import 'package:travel_flutter/theme/text_style.dart';


void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      saveThemesOnChange: true,
      loadThemeOnInit: true,
      themes: [lightTheme, darkTheme],
      child: ThemeConsumer(
        child: Builder(
          builder: (context) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: AppRouter.router,
              builder:(context, child) {
                return SafeArea(child: child!);
              },
              theme: ThemeProvider.themeOf(context).data.copyWith(
                textTheme: textThemes(context),
              ),
            );
          }
        ),
      ),
    );
  }
}
