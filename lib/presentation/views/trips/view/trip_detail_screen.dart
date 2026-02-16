import 'package:flutter/material.dart';
import '../widgets/itinerary_item_card.dart';
import '../../../../utils/extensions.dart';

class TripDetailScreen extends StatefulWidget {
  final String title;
  final String date;
  final String duration;
  final String imageUrl;

  const TripDetailScreen({
    super.key,
    required this.title,
    required this.date,
    required this.duration,
    required this.imageUrl,
  });

  @override
  State<TripDetailScreen> createState() => _TripDetailScreenState();
}

class _TripDetailScreenState extends State<TripDetailScreen> {
  int _selectedDateIndex = 0;
  final List<String> _dates = ['12', '13', '14', '15', '16'];
  final List<Map<String, dynamic>> _itineraryItems = [
    {
      'title': 'Breakfast at Café de Flore',
      'time': '09:00 AM',
      'location': 'St-Germain-des-Prés',
      'type': 'DINING',
      'icon': Icons.coffee,
      'color': Colors.orange,
      'description': 'TIPS\nTry their famous hot chocolate.',
      'image':
          'https://images.unsplash.com/photo-1554118811-1e0d58224f24?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
    },
    {
      'title': 'Louvre Museum Visit',
      'time': '11:00 AM',
      'location': 'Art & History',
      'type': 'CULTURE',
      'icon': Icons.museum,
      'color': Colors.blue,
      'link': 'View Tickets',
    },
    {
      'title': 'Lunch at Le Meurice',
      'time': '01:30 PM',
      'location': 'Fine Dining',
      'type': 'RESERVATION',
      'icon': Icons.restaurant,
      'color': Colors.green,
      'status': 'Confirmed for 2',
    },
    {
      'title': 'Sunset at Trocadéro',
      'time': '06:45 PM',
      'location': 'Best Eiffel View',
      'type': 'PHOTO OP',
      'icon': Icons.camera_alt,
      'color': Colors.purple,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.themeOption.colorWhite,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: context.themeOption.colorWhite2,
            expandedHeight: 300,
            pinned: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.share, color: Colors.white),
                onPressed: () {},
              ),
            ],
            title: Text(
              'Trip to ${widget.title}',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(widget.imageUrl, fit: BoxFit.cover),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.3),
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.7),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.date,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        8.height(),
                        Text(
                          widget.duration,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.height(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFF137FEC),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF137FEC).withValues(alpha: 0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.map, color: Colors.white),
                        8.width(),
                        const Text(
                          'View Full Map',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                20.height(),
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
                    itemCount: _dates.length,
                    itemBuilder: (context, index) {
                      final isSelected = _selectedDateIndex == index;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedDateIndex = index;
                          });
                        },
                        child: Container(
                          width: 60,
                          margin: const EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? context.themeOption.colorPrimary
                                : context.themeOption.colorLightPrimary,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: isSelected
                                  ? Colors.transparent
                                  : context.themeOption.colorBorder.withValues(
                                      alpha: 0.1,
                                    ),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'OCT',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                _dates[index],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                30.height(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Day 1 Itinerary',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: context.themeOption.colorText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                20.height(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _itineraryItems.length,
                    itemBuilder: (context, index) {
                      final item =
                          _itineraryItems[index]; // Use the item directly
                      final isLast = index == _itineraryItems.length - 1;
                      return ItineraryItemCard(item: item, isLast: isLast);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
