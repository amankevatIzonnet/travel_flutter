import 'package:flutter/material.dart';
import '../../../../utils/extensions.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Profile',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.themeOption.colorBlack,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: context.isDarkTheme
                      ? const Color(0xFF1F2937)
                      : Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    if (!context.isDarkTheme)
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                  ],
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.settings,
                    color: context.themeOption.colorBlack,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.2), // Subtle border
                  width: 1,
                ),
              ),
              child: const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 6,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, size: 14, color: Colors.white),
              ),
            ),
          ],
        ),
        16.height(),
        Text(
          'Alex Harrison',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.themeOption.colorBlack,
            fontSize: 20,
          ),
        ),
        4.height(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.auto_awesome,
              size: 16,
              color: context.themeOption.colorPrimary,
            ),
            6.width(),
            Text(
              'Level 5 Explorer',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: context.themeOption.colorTextLabel,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
