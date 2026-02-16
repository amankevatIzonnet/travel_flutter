import 'package:flutter/material.dart';
import '../../../../utils/extensions.dart';
import '../widgets/saved_place_card.dart';

class SaveTripScreen extends StatefulWidget {
  const SaveTripScreen({super.key});

  @override
  State<SaveTripScreen> createState() => _SaveTripScreenState();
}

class _SaveTripScreenState extends State<SaveTripScreen> {
  int _selectedTabIndex = 0; // 0: Destinations, 1: Stays

  final List<Map<String, dynamic>> _destinations = [
    {
      'title': 'Santorini, Greece',
      'location': 'Cyclades Islands',
      'rating': 4.9,
      'reviews': '2.1k',
      'price': '\$1,450',
      'image':
          'https://images.unsplash.com/photo-1570077188670-e3a8d69ac5ff?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
    },
    {
      'title': 'Kyoto, Japan',
      'location': 'Kansai Region',
      'rating': 4.8,
      'reviews': '1.5k',
      'price': '\$980',
      'image':
          'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
    },
    {
      'title': 'Rio de Janeiro',
      'location': 'Brazil, South America',
      'rating': 4.7,
      'reviews': '890',
      'price': '\$1,100',
      'image':
          'https://images.unsplash.com/photo-1483729558449-99ef09a8c325?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          context.themeOption.colorWhite, // Slightly grey/off-white background
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back, color: context.themeOption.colorText),
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
        title: Text(
          'Saved',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.themeOption.colorText,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: context.themeOption.colorPrimary,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          10.height(),
          // Custom Segmented Control
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: context
                  .themeOption
                  .colorLightPrimary, // Light background for the pill container
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              children: [
                Expanded(child: _buildTabItem(0, 'Destinations')),
                Expanded(child: _buildTabItem(1, 'Stays')),
              ],
            ),
          ),
          10.height(),
          // Content List
          Expanded(
            child: _selectedTabIndex == 0
                ? ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 0,
                    ),
                    itemCount: _destinations.length,
                    itemBuilder: (context, index) {
                      return SavedPlaceCard(place: _destinations[index]);
                    },
                  )
                : const Center(child: Text('No saved stays yet')),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(int index, String title) {
    final isSelected = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? context.themeOption.colorPrimary
              : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [],
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color: isSelected
                ? Colors.white
                : context.themeOption.colorTextLabel,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
