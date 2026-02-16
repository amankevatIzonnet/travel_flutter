import 'package:flutter/material.dart';
import '../../../../utils/extensions.dart';

class ItineraryItemCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final bool isLast;

  const ItineraryItemCard({super.key, required this.item, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: context.themeOption.colorLightPrimary,
                shape: BoxShape.circle,
              ),
              child: Icon(item['icon'], color: item['color'], size: 20),
            ),
            if (!isLast)
              Container(
                width: 2,
                height:
                    100, // Adjust height dynamically if needed or use IntrinsicHeight
                color: context.themeOption.colorBorder.withValues(alpha: 0.2),
              ),
          ],
        ),
        16.width(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      item['title'],
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.themeOption.colorText,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: (item['color'] as Color).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      item['type'],
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: item['color'],
                      ),
                    ),
                  ),
                ],
              ),
              8.height(),
              Text(
                '${item['time']} • ${item['location']}',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.grey),
              ),
              12.height(),
              if (item.containsKey('description'))
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: context.themeOption.colorLightPrimary,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: context.themeOption.colorBorder.withValues(
                        alpha: 0.05,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      if (item.containsKey('image'))
                        Container(
                          width: 40,
                          height: 40,
                          margin: const EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(item['image']),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      Expanded(
                        child: Text(
                          item['description'],
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              if (item.containsKey('link'))
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.confirmation_number_outlined,
                    size: 16,
                    color: Colors.blue,
                  ),
                  label: Text(
                    item['link'],
                    style: const TextStyle(color: Colors.blue),
                  ),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0, 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    alignment: Alignment.centerLeft,
                  ),
                ),
              if (item.containsKey('status'))
                Row(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      size: 16,
                      color: Colors.green,
                    ),
                    8.width(),
                    Text(
                      item['status'],
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              40.height(),
            ],
          ),
        ),
      ],
    );
  }
}
