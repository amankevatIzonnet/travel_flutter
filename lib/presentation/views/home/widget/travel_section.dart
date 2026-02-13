import 'package:flutter/material.dart';
import 'package:travel_flutter/utils/extensions.dart';

class TravelSection extends StatelessWidget {
  const TravelSection({super.key});

  @override
  Widget build(BuildContext context) {
    List<IconData> travelList = [
      Icons.flight,
      Icons.bed,
      Icons.confirmation_number,
      Icons.directions_car_filled,
    ];
    List<String> travelText = ['Flights', 'Hotels', 'Activities', 'Car'];

    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: travelList.length,
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xFFDFEAF6),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  travelList[index],
                  color: context.themeOption.colorPrimary,
                  size: 26,
                ),
              ),
              5.height(),
              Text(
                travelText[index],
                style: TextStyle(
                  color: context.themeOption.colorBlack,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 34),
      ),
    );
  }
}
