import 'package:flutter/material.dart';
import 'package:travel_flutter/theme/text_style.dart';
import '../../../../utils/extensions.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routes/route_paths.dart';

// import 'trip_detail_screen.dart'; // No longer needed if using routes, but let's keep it if we want strong typing or if AppRouter uses it. Wait, AppRouter imports it. Here we just need the path.

class TripScreen extends StatefulWidget {
  const TripScreen({super.key});

  @override
  State<TripScreen> createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.themeOption.colorWhite,
      appBar: AppBar(
        title: Text(
          'My Trips',
          style: TextStyle(
            color: context.themeOption.colorText,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: context.themeOption.colorWhite,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: context.themeOption.colorTextLabel),
            onPressed: () {},
            style: IconButton.styleFrom(
              backgroundColor: context.themeOption.colorLightPrimary,
              shape: const CircleBorder(),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {},
            style: IconButton.styleFrom(
              backgroundColor: context.themeOption.colorPrimary,
              shape: const CircleBorder(),
            ),
          ),
          20.width(),
        ],
      ),
      body: Column(
        children: [
          10.height(),
          // Tabs
          Container(
            height: 45,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: context.themeOption.colorLightPrimary,
              borderRadius: BorderRadius.circular(25),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: context.themeOption.colorPrimary,
                borderRadius: BorderRadius.circular(25),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              unselectedLabelColor: context.themeOption.colorTextLabel,
              dividerColor: Colors.transparent,
              labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              tabs: const [
                Tab(text: 'Upcoming'),
                Tab(text: 'Past'),
              ],
            ),
          ),
          // Tab View
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildUpcomingTrips(),
                const Center(child: Text("No past trips")),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingTrips() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Trip 1 - Paris
            _buildTripCard(
              context,
              title: 'Paris, France',
              date: 'Oct 12 - Oct 18, 2024',
              image:
                  'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
              status: 'CONFIRMED',
              statusColor: Colors.blue,
              buttonText: 'View Details',
              onPressed: () {
                context.push(
                  RoutePaths.tripDetail,
                  extra: {
                    'title': 'Paris',
                    'date': 'Oct 12 - Oct 18',
                    'duration': '7 Days in the City of Light',
                    'imageUrl':
                        'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
                  },
                );
              },
            ),
            30.height(),
            // Trip 2 - Tokyo
            _buildTripCard(
              context,
              title: 'Tokyo, Japan',
              date: 'Dec 05 - Dec 15, 2024',
              image:
                  'https://images.unsplash.com/photo-1554797589-7241bb691973?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
              status: 'PLANNING',
              statusColor: Colors.orange,
              buttonText: 'Continue Planning',
              onPressed: () {},
            ),
            40.height(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recently Viewed',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.themeOption.colorText,
                  ),
                ),
                Text(
                  'Clear',
                  style: TextStyle(
                    color: context.themeOption.colorPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            20.height(),
            // Recently Viewed Card
            _buildRecentlyViewedCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTripCard(
    BuildContext context, {
    required String title,
    required String date,
    required String image,
    required String status,
    required Color statusColor,
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    return Container(
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          // Gradient Overlay
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.1),
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.8),
                ],
              ),
            ),
          ),
          // Status Badge
          Positioned(
            top: 20,
            left: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                status,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ),
          ),
          // More Menu
          Positioned(
            top: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.2), // Glassmorphism-ish
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
              ),
              child: const Icon(Icons.more_horiz, color: Colors.white),
            ),
          ),
          // Content
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textThemes(
                    context,
                  ).titleLarge?.copyWith(color: Colors.white),
                ),
                8.height(),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      color: Colors.white70,
                      size: 16,
                    ),
                    8.width(),
                    Text(
                      date,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                20.height(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: status == 'PLANNING'
                          ? context.themeOption.colorPrimary
                          : Colors.white,
                      foregroundColor: status == 'PLANNING'
                          ? Colors.white
                          : Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      buttonText,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentlyViewedCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.themeOption.colorLightPrimary,
        borderRadius: BorderRadius.circular(30), // Rounded pill shape
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1537996194471-e657df975ab4?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
                ), // Bali
                fit: BoxFit.cover,
              ),
            ),
          ),
          16.width(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bali, Indonesia',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.themeOption.colorText,
                      ),
                    ),
                    Text(
                      'AUG 2024',
                      style: TextStyle(
                        fontSize: 10,
                        color: context.themeOption.colorTextLabel,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                4.height(),
                Text(
                  'Completed • 10 days',
                  style: TextStyle(
                    color: context.themeOption.colorTextLabel,
                    fontSize: 12,
                  ),
                ),
                8.height(),
                // Avatars
                Row(
                  children: [
                    _buildAvatar(Colors.grey[400]!),
                    Transform.translate(
                      offset: const Offset(-10, 0),
                      child: _buildAvatar(Colors.blueGrey),
                    ),
                    Transform.translate(
                      offset: const Offset(-20, 0),
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: context.themeOption.colorLightPrimary,
                            width: 2,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            '+2',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
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

  Widget _buildAvatar(Color color) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: context.themeOption.colorWhite, width: 2),
      ),
    );
  }
}
