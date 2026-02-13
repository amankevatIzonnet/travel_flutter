import 'package:flutter/material.dart';
import '../../../../utils/extensions.dart';

class TrendingDestinationSection extends StatelessWidget {
  const TrendingDestinationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> destinations = [
      {
        'image':
            'https://images.unsplash.com/photo-1537996194471-e657df975ab4?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
        'rating': 4.9,
        'title': 'Bali, Indonesia',
        'price': 850,
      },
      {
        'image':
            'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
        'title': 'Paris, France',
        'rating': 4.9,
        'price': 1200,
      },
      {
        'image':
            'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
        'title': 'Paris, France',
        'rating': 4.9,
        'price': 1200,
      },
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Trending Destinations',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.themeOption.colorBlack,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'See all',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: context.themeOption.colorPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        16.height(),
        SizedBox(
          height: 300,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: destinations.length,
            separatorBuilder: (context, index) => 16.width(),
            itemBuilder: (context, index) {
              final destination = destinations[index];
              return _TrendingCard(
                imageUrl: destination['image'],
                rating: destination['rating'],
                title: destination['title'],
                price: destination['price'],
              );
            },
          ),
        ),
      ],
    );
  }
}

class _TrendingCard extends StatelessWidget {
  final String imageUrl;
  final double rating;
  final String title;
  final int price;

  const _TrendingCard({
    required this.imageUrl,
    required this.rating,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.6),
                ],
                stops: [0.6, 1.0],
              ),
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                  4.width(),
                  Text(
                    rating.toString(),
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
          Positioned(
            left: 16,
            bottom: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                4.height(),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                    children: [
                      const TextSpan(text: 'Starting from '),
                      TextSpan(
                        text: '\$$price',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
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
