import 'package:flutter/material.dart';
import 'package:travel_flutter/presentation/views/profile/widget/points_card.dart';
import 'package:travel_flutter/presentation/views/profile/widget/profile_header.dart';
import 'package:travel_flutter/presentation/views/profile/widget/trip_card.dart';
import 'package:travel_flutter/presentation/views/profile/widget/trip_tabs.dart';
import '../../../../utils/extensions.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.themeOption.colorWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ProfileHeader(),
              15.height(),
              const PointsCard(),
              const TripTabs(),
              const TripCard(
                image:
                    'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
                title: 'Paris, France',
                date: 'OCT 12 — OCT 18, 2024',
                status: 'CONFIRMED',
              ),
              const TripCard(
                image:
                    'https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
                title: 'Tokyo, Japan',
                date: 'DEC 01 — DEC 10, 2024',
                status: 'PLANNING',
              ),
              // 80.height(), // Bottom padding for navigation bar
            ],
          ),
        ),
      ),
    );
  }
}
