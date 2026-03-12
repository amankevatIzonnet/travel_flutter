import 'package:flutter/material.dart';
import 'package:travel_flutter/features/common_widgets/buttons.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_flutter/core/routes/route_paths.dart';
import 'package:travel_flutter/theme/app_theme.dart';
import '../../../../utils/extensions.dart';

class SavedPlaceCard extends StatelessWidget {
  final Map<String, dynamic> place;

  const SavedPlaceCard({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(RoutePaths.savedTripDetail, extra: place);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        // To add shadow/elevation to the card
        decoration: BoxDecoration(
          color: context.isDarkTheme ? AppColor.primaryColor2 : Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                  child: Image.network(
                    place['image'],
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // Heart Icon
                Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.8),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: AppColor.primaryColor, // Active heart color
                      size: 20,
                    ),
                  ),
                ),
                // Rating Pill
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 14),
                        4.width(),
                        Text(
                          '${place['rating']} (${place['reviews']})',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Content Section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place['title'],
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.themeOption.colorText,
                    ),
                  ),
                  8.height(),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 16,
                        color: context.themeOption.colorTextLabel,
                      ),
                      4.width(),
                      Text(
                        place['location'],
                        style: TextStyle(
                          color: context.themeOption.colorTextLabel,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  16.height(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'STARTING FROM',
                            style: TextStyle(
                              color: context.themeOption.colorTextLabel,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                          4.height(),
                          Text(
                            place['price'],
                            style: TextStyle(
                              color: AppColor.primaryColor, // Specific blue
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      button(
                        'Explore',
                        () => context.push(
                          RoutePaths.savedTripDetail,
                          extra: place,
                        ),
                        width: 100,
                        height: 40,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
