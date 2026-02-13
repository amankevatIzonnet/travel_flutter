import 'package:flutter/material.dart';
import '../../../../utils/extensions.dart';

class TripTabs extends StatelessWidget {
  const TripTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: context.isDarkTheme
            ? const Color(0xFF1F2937)
            : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: context.isDarkTheme
                    ? context.themeOption.colorPrimary
                    : Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: context.isDarkTheme
                    ? []
                    : [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
              ),
              child: Center(
                child: Text(
                  'Upcoming',
                  style: TextStyle(
                    color: context.isDarkTheme
                        ? Colors.white
                        : context.themeOption.colorBlack,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Center(
                child: Text(
                  'Past',
                  style: TextStyle(
                    color: context.isDarkTheme
                        ? Colors.grey
                        : context.themeOption.colorTextLabel,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
