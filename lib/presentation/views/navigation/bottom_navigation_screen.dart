import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_flutter/core/config/route_paths.dart';
import 'package:travel_flutter/utils/extensions.dart';

class BottomNavigationScreen extends StatelessWidget {
  final Widget child;

  const BottomNavigationScreen({super.key, required this.child});

  int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    if (location.startsWith(RoutePaths.home)) return 0;
    if (location.startsWith(RoutePaths.saveTrip)) return 1;
    if (location.startsWith(RoutePaths.trips)) return 2;
    // if (location.startsWith(RoutePaths.home)) return 3;
    if (location.startsWith(RoutePaths.profile)) return 4;

    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go(RoutePaths.home);
        break;

      case 1:
        context.go(RoutePaths.saveTrip);
        break;

      case 2:
        context.go(RoutePaths.trips);
        break;

      // case 3:
      //   context.go(RoutePaths.profile);
      //   break;
      case 4:
        context.go(RoutePaths.profile);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _calculateSelectedIndex(context);

    return Scaffold(
      body: child,

      /// Floating Center Button
      floatingActionButton: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.themeOption.colorPrimary,
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withValues(alpha: 0.4),
              blurRadius: 15,
              spreadRadius: 4,
            ),
          ],
        ),
        child: IconButton(
          onPressed: () => _onItemTapped(1, context),
          icon: const Icon(Icons.add, color: Colors.white, size: 30),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      /// Custom Rounded Bottom Bar
      bottomNavigationBar: Container(
        height: 75,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: context.themeOption.colorWhite,

          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Home
            _buildNavItem(
              icon: Icons.explore,
              label: "Explore",
              index: 0,
              currentIndex: currentIndex,
              context: context,
            ),

            _buildNavItem(
              icon: Icons.favorite,
              label: "Saved",
              index: 1,
              currentIndex: currentIndex,
              context: context,
            ),

            const SizedBox(width: 60),

            _buildNavItem(
              icon: Icons.calendar_month,
              label: "Trips",
              index: 2,
              currentIndex: currentIndex,
              context: context,
            ),

            _buildNavItem(
              icon: Icons.account_circle_outlined,
              label: "Profile",
              index: 4,
              currentIndex: currentIndex,
              context: context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    required int currentIndex,
    required BuildContext context,
  }) {
    final isSelected = index == currentIndex;

    return GestureDetector(
      onTap: () => _onItemTapped(index, context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected
                ? context.themeOption.colorPrimary
                : Colors.blueGrey,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? Colors.blue : Colors.grey,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
