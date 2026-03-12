import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:travel_flutter/core/routes/app_router.dart';
import 'package:travel_flutter/di/service_locator.dart';
import 'package:travel_flutter/features/bloc/auth/auth_bloc.dart';
import 'package:travel_flutter/theme/app_theme.dart';
import 'package:travel_flutter/theme/text_style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await init();
  runApp(MyApp());
}

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
            return BlocProvider(
              create: (context) => AuthBloc(),
              child: MaterialApp.router(
                // localizationsDelegates: [
                //   AppLocalizations.delegate,
                //   GlobalMaterialLocalizations.delegate,
                // ],
                supportedLocales: [Locale('en'), Locale('hindi')],
                debugShowCheckedModeBanner: false,
                routerConfig: AppRouter.router,

                theme: ThemeProvider.themeOf(
                  context,
                ).data.copyWith(textTheme: textThemes(context)),
              ),
            );
          },
        ),
      ),
    );
  }
}
