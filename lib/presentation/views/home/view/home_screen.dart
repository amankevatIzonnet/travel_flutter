
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_flutter/core/config/route_paths.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Column(
        children: [
         Center(
            child: InkWell(
              onTap: ()=>context.push(RoutePaths.profile),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue
                ),
                child: Text("Next"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
