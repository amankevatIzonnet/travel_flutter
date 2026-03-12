import 'package:flutter/material.dart';
import '../../../../utils/extensions.dart';
import '../../../common_widgets/buttons.dart';

class SavedTripDetailScreen extends StatelessWidget {
  final Map<String, dynamic> place;

  const SavedTripDetailScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    // Determine status bar height for safe area padding

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor:
          context.themeOption.colorWhite, // Use theme background color
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.2),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
            padding: EdgeInsets.zero,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.share, color: Colors.white),
              onPressed: () {},
              padding: EdgeInsets.zero,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 16, left: 8),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.favorite, color: Colors.white),
              onPressed: () {},
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 350,
            child: Image.network(place['image'], fit: BoxFit.cover),
          ),
          // Scrollable Content
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 280),
            child: Container(
              padding: const EdgeInsets.fromLTRB(
                20,
                30,
                20,
                100,
              ), // Bottom padding for button bar
              decoration: BoxDecoration(
                color:
                    context.themeOption.colorWhite, // Use app theme background
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Location Tag
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 16, color: Colors.blue),
                      8.width(),
                      Text(
                        place['location'].toString().toUpperCase(),
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                  8.height(),
                  // Title
                  Text(
                    _getShortTitle(place['title']),
                    style: TextStyle(
                      color: context.themeOption.colorText,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  16.height(),
                  // Rating & Tag Row
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      4.width(),
                      Text(
                        '${place['rating']} (${place['reviews']} reviews)',
                        style: TextStyle(
                          color: context.themeOption.colorTextLabel,
                          fontSize: 14,
                        ),
                      ),
                      16.width(),
                      Container(
                        height: 20,
                        width: 1,
                        color: Colors.grey.withValues(alpha: 0.3),
                      ),
                      16.width(),
                      Icon(
                        Icons.access_time_filled,
                        size: 16,
                        color: context.themeOption.colorTextLabel,
                      ),
                      4.width(),
                      Text(
                        'Best in Summer',
                        style: TextStyle(
                          color: context.themeOption.colorTextLabel,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  30.height(),
                  // About Section
                  Text(
                    'About this place',
                    style: TextStyle(
                      color: context.themeOption.colorText,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  12.height(),
                  Text(
                    'Santorini is one of the Cyclades islands in the Aegean Sea. It was devastated by a volcanic eruption in the 16th century BC, forever shaping its rugged landscape. The whitewashed, cubiform houses of its 2 principal towns, Fira and Oia, cling to cliffs above an underwater caldera.',
                    style: TextStyle(
                      color: context.themeOption.colorTextLabel,
                      height: 1.5,
                      fontSize: 14,
                    ),
                  ),
                  8.height(),
                  Text(
                    'Read more',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  30.height(),
                  // Activities Horizontal List
                  Text(
                    'Top things to do',
                    style: TextStyle(
                      color: context.themeOption.colorText,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  16.height(),
                  SizedBox(
                    height: 180,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.none,
                      children: [
                        _buildActivityCard(
                          context,
                          'Sunset Sailing Tour',
                          'ADVENTURE',
                          '\$120 / person',
                          'https://images.unsplash.com/photo-1544550581-5f7ceaf7f992?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
                        ),
                        16.width(),
                        _buildActivityCard(
                          context,
                          'Oia Village Walk',
                          'SIGHTSEEING',
                          'Free',
                          'https://images.unsplash.com/photo-1570077188670-e3a8d69ac5ff?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
                        ),
                      ],
                    ),
                  ),
                  30.height(),
                  // Guest Ratings
                  Text(
                    'Guest Ratings',
                    style: TextStyle(
                      color: context.themeOption.colorText,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  16.height(),
                  Text(
                    place['rating'].toString(),
                    style: TextStyle(
                      color: context.themeOption.colorText,
                      fontWeight: FontWeight.bold,
                      fontSize: 48,
                    ),
                  ),
                  Row(
                    children: List.generate(
                      5,
                      (index) =>
                          const Icon(Icons.star, color: Colors.blue, size: 24),
                    ),
                  ),
                  8.height(),
                  Text(
                    'Global average rating',
                    style: TextStyle(
                      color: context.themeOption.colorTextLabel,
                      fontSize: 14,
                    ),
                  ),
                  20.height(),
                  // Ratings Bars
                  _buildRatingBar(context, '5', 0.8),
                  _buildRatingBar(context, '4', 0.15),
                  _buildRatingBar(context, '3', 0.05),
                  // Add extra padding at bottom content for scrollability
                  50.height(),
                ],
              ),
            ),
          ),
          // Bottom Booking Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: context.themeOption.colorWhite,
                border: Border(
                  top: BorderSide(
                    color: context.themeOption.colorBorder.withValues(
                      alpha: 0.1,
                    ),
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Starting from',
                          style: TextStyle(
                            color: context.themeOption.colorTextLabel,
                            fontSize: 12,
                          ),
                        ),
                        4.height(),
                        Row(
                          children: [
                            Text(
                              place['price'].toString().replaceAll(
                                '\$',
                                '\$1,240',
                              ), // Mock dynamic price correction
                              style: TextStyle(
                                color: context.themeOption.colorText,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              ' / night',
                              style: TextStyle(
                                color: context.themeOption.colorTextLabel,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  button('Book Now', () {}, width: 160, height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getShortTitle(String fullTitle) {
    if (fullTitle.contains(',')) {
      return fullTitle.split(',')[0].trim();
    }
    return fullTitle;
  }

  Widget _buildActivityCard(
    BuildContext context,
    String title,
    String tag,
    String price,
    String imageUrl,
  ) {
    return Container(
      width: 260,
      decoration: BoxDecoration(
        color: context.themeOption.colorLightPrimary,
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withValues(alpha: 0.3),
            BlendMode.darken,
          ),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 16,
            bottom: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tag,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
                4.height(),
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                8.height(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 16,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingBar(BuildContext context, String label, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              color: context.themeOption.colorText,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          16.width(),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: value,
                backgroundColor: context.themeOption.colorBorder.withValues(
                  alpha: 0.1,
                ),
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                minHeight: 6,
              ),
            ),
          ),
          16.width(),
          Text(
            '${(value * 100).toInt()}%',
            style: TextStyle(
              color: context.themeOption.colorTextLabel,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
