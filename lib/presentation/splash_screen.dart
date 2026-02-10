
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/config/route_paths.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      if(mounted){
        context.go(RoutePaths.onBoarding);
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash Screen'),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
