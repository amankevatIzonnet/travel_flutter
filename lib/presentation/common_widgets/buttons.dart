import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_flutter/utils/extensions.dart';

Widget iconButton(Widget icon,String text,Function() onTap,{Color? backgroundColor,Color? fontColor}){
  return Builder(
    builder: (context) {
      return InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          width: 120,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: Colors.grey,width: .3),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              10.width(),
              Text(text,style: TextStyle(color: fontColor,fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      );
    }
  );
}

Widget button(String text, Function() onTap) {
  return Builder(
    builder: (context) {
      return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(330, 50),
          elevation: 5,
          backgroundColor: context.themeOption.colorPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      );
    },
  );
}
Widget backButton({Function()? onPressed}){
  return Builder(
    builder: (context) {
      return IconButton(
        onPressed: onPressed ?? context.pop,
        icon: Icon(Icons.arrow_back_ios)
      );
    }
  );
}