import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_flutter/core/config/route_names.dart';
import 'package:travel_flutter/core/config/route_paths.dart';
import 'package:travel_flutter/presentation/splash_screen.dart';
import 'package:travel_flutter/presentation/views/auth/view/login_screen.dart';
import 'package:travel_flutter/presentation/views/home/view/home_screen.dart';
import 'package:travel_flutter/presentation/views/onboarding/view/onboarding_screen.dart';
import 'package:travel_flutter/presentation/views/profile/view/profile_screen.dart';

class AppRouter {
  static GoRouter router= GoRouter(
      initialLocation: RoutePaths.splash,
      routes: [
        GoRoute(
          path: RoutePaths.splash,
          name: RouteNames.splash,
          pageBuilder: (context,state) => MaterialPage(child: SplashScreen()),
        ),
        GoRoute(
          path: RoutePaths.home,
          name: RouteNames.home,
          pageBuilder: (context,state) => MaterialPage(child: HomeScreen()),
        ),
        GoRoute(
          path: RoutePaths.profile,
          name: RouteNames.profile,
          pageBuilder: (context,state) => MaterialPage(child: ProfileScreen()),
        ),
        GoRoute(
          path: RoutePaths.onBoarding,
          name: RouteNames.onBoarding,
          pageBuilder: (context,state) => MaterialPage(child: OnBoardingScreen()),
        ),
        GoRoute(
          path: RoutePaths.login,
          name: RouteNames.login,
          pageBuilder: (context,state) => MaterialPage(child: LoginScreen()),
        ),
      ],
    );
}
