import 'package:flutter/material.dart';
import '../widget/top_section.dart';
import '../widget/travel_section.dart';
import '../widget/trending_destination_section.dart';
import '../widget/personalized_section.dart';
import '../../../../utils/extensions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.themeOption.colorWhite,

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TopSection(),
                    SizedBox(height: 20),
                    TravelSection(),
                    20.height(),
                    TrendingDestinationSection(),
                    20.height(),
                    PersonalizedSection(),
                    20.height(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
