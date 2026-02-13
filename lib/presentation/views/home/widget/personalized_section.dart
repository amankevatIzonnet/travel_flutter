import 'package:flutter/material.dart';
import '../../../../utils/extensions.dart';

class PersonalizedSection extends StatelessWidget {
  const PersonalizedSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        'image':
            'https://images.unsplash.com/photo-1545247181-516773cae754?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
        'tag': 'ACTIVITY',
        'tagColor': Color(0xFF0F213D),
        'tagTextColor': Colors.blue,
        'title': 'Sunrise Yoga in Ubud',
        'location': 'Bali, Indonesia',
        'rating': 4.9,
        'reviews': 124,
        'price': 45,
      },
      {
        'image':
            'https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
        'tag': 'STAY',
        'tagColor': Color(0xFF10282F),
        'tagTextColor': Colors.green,
        'title': 'Alpine Boutique Retreat',
        'location': 'Swiss Alps',
        'rating': 5.0,
        'reviews': 82,
        'price': 180,
      },
      {
        'image':
            'https://images.unsplash.com/photo-1569263979104-865ab7cd8d13?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
        'tag': 'LUXURY',
        'tagColor': Color(0xFF262027),
        'tagTextColor': Colors.orange,
        'title': 'Private Yacht Day Cruise',
        'location': 'Amalfi Coast',
        'rating': 4.8,
        'reviews': 56,
        'price': 320,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Personalized for You',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.themeOption.colorBlack,
                ),
              ),
              4.height(),
              Text(
                'Based on your recent activity',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: context.themeOption.colorTextLabel,
                ),
              ),
            ],
          ),
        ),
        16.height(),
        ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          separatorBuilder: (context, index) => 16.height(),
          itemBuilder: (context, index) {
            final item = items[index];
            return _PersonalizedCard(item: item);
          },
        ),
      ],
    );
  }
}

class _PersonalizedCard extends StatelessWidget {
  final Map<String, dynamic> item;

  const _PersonalizedCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.themeOption.colorWhite,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100), // Circular image
              image: DecorationImage(
                image: NetworkImage(item['image']),
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
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: item['tagColor'],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        item['tag'],
                        style: TextStyle(
                          color: item['tagTextColor'],
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    Text(
                      '\$${item['price']}',
                      style: TextStyle(
                        color: context.themeOption.colorBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                8.height(),
                Text(
                  item['title'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: context.themeOption.colorBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                4.height(),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 14,
                      color: context.themeOption.colorPrimary,
                    ),
                    4.width(),
                    Text(
                      item['location'],
                      style: TextStyle(
                        color: context.themeOption.colorTextLabel,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                4.height(),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 14),
                    4.width(),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: context.themeOption.colorBlack,
                          fontSize: 12,
                        ),
                        children: [
                          TextSpan(
                            text: '${item['rating']}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ' (${item['reviews']} reviews)',
                            style: TextStyle(
                              color: context.themeOption.colorTextLabel,
                            ),
                          ),
                        ],
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
}
