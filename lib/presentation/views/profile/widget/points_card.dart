import 'package:flutter/material.dart';
import '../../../../utils/extensions.dart';

class PointsCard extends StatelessWidget {
  const PointsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: context.isDarkTheme ? const Color(0xFF1F2937) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: context.isDarkTheme
            ? []
            : [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '1,250 Points',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.themeOption.colorBlack,
                ),
              ),
              Text(
                '800/1200 to Level 6',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: context.themeOption.colorTextLabel,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          16.height(),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: 0.66, // 800/1200 approx visual
              minHeight: 6,
              backgroundColor: context.isDarkTheme
                  ? Colors.white.withValues(alpha: 0.1)
                  : Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation<Color>(
                context.themeOption.colorPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
