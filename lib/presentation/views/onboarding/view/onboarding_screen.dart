
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_flutter/core/config/route_paths.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _controller = PageController();
  List<Widget> onboardingList= [
    buildPage("assets/images/onboarding1.png"),
    buildPage("assets/images/onboarding2.png"),
    buildPage("assets/images/onboarding3.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Stack(
          children: [
        
            PageView.builder(
              itemCount: onboardingList.length,
              controller: _controller,
              itemBuilder: (context,index)=>onboardingList[index],
            ),
            Positioned(
              right: 10,
              top: 10,
              child: InkWell(
                onTap: ()=>context.push(RoutePaths.login),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.withValues(alpha: 0.3,),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text("Skip",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                ),
              )
            ),
            Positioned(
              bottom: 40,
              left: 30,
              right: 30,
              child: Column(
                children: [
        
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      activeDotColor: Colors.blue,
                      dotHeight: 8,
                      dotWidth: 8,
                    ),
                  ),
        
                  SizedBox(height: 16),
        
        
        
                ],
              ),
            ),
        
          ],
        ),
      ),
    );
  }
}

Widget buildPage( String image) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(image),
        fit: BoxFit.cover,
      ),
    ),
  );
}

