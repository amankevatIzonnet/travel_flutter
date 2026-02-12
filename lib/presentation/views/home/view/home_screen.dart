
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_flutter/core/config/route_paths.dart';

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
      backgroundColor: context.themeOption.colorBlack2,

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints){
            return  Column(
              children: [
                Center(
                  child: InkWell(
                    onTap: ()=>context.themeController.setTheme(context.isDarkTheme ? "light" : "dark",),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue
                      ),
                      child: Text("Next"),
                    ),
                  ),
                )
              ],
            );
          },
        
        ),
      ),
    );
  }
}
