import 'package:flutter/material.dart';
import 'package:travel_flutter/utils/extensions.dart';

Widget textFieldInput({
  TextEditingController? controller,
  String hintText = "",
  String? Function(String?)? validator,
  Widget? prefixIcon,
  Widget? suffixIcon,
  bool obscureText = false,
  Color? backgroundColor,
}){
  return Builder(
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: backgroundColor ?? context.themeOption.colorWhite2,
            hintStyle: TextStyle(color: context.themeOption.colorHintText),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(width: .01,color: context.themeOption.colorBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(width: .01,color: context.themeOption.colorBorder),
            ),

          ),
        ),
      );
    }
  );
}