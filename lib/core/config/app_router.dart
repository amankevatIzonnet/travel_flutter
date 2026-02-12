import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_flutter/core/config/route_paths.dart';
import 'package:travel_flutter/presentation/splash_screen.dart';
import 'package:travel_flutter/presentation/views/auth/view/login_screen.dart';
import 'package:travel_flutter/presentation/views/auth/view/register_screen.dart';
import 'package:travel_flutter/presentation/views/home/view/home_screen.dart';
import 'package:travel_flutter/presentation/views/navigation/bottom_navigation_screen.dart';
import 'package:travel_flutter/presentation/views/onboarding/view/onboarding_screen.dart';
import 'package:travel_flutter/presentation/views/profile/view/profile_screen.dart';
import 'package:travel_flutter/presentation/views/trips/view/trip_screen.dart';

import '../../presentation/views/saveTrip/view/save_trip_screen.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: RoutePaths.splash,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return BottomNavigationScreen(child: child,);
        },
        routes: [
          GoRoute(
            path: RoutePaths.home,
            pageBuilder: (context, state) => MaterialPage(child: HomeScreen()),
          ),
          GoRoute(
            path: RoutePaths.saveTrip,
            pageBuilder: (context, state) => MaterialPage(child: SaveTripScreen()),
          ),
          GoRoute(
            path: RoutePaths.trips,
            pageBuilder: (context, state) => MaterialPage(child: TripScreen()),
          ),
          GoRoute(
            path: RoutePaths.profile,
            pageBuilder: (context, state) => MaterialPage(child: ProfileScreen()),
          ),
        ],
      ),
      GoRoute(
        path: RoutePaths.splash,
        pageBuilder: (context, state) => MaterialPage(child: SplashScreen()),
      ),

      GoRoute(
        path: RoutePaths.onBoarding,
        pageBuilder: (context, state) =>
            MaterialPage(child: OnBoardingScreen()),
      ),
      GoRoute(
        path: RoutePaths.login,
        pageBuilder: (context, state) => MaterialPage(child: LoginScreen()),
      ),
      GoRoute(
        path: RoutePaths.register,
        pageBuilder: (context, state) => MaterialPage(child: RegisterScreen()),
      ),
    ],
  );
}
