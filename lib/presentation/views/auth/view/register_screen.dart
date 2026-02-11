import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_flutter/presentation/common_widgets/buttons.dart';
import 'package:travel_flutter/theme/text_style.dart';
import 'package:travel_flutter/utils/extensions.dart';
import '../../../../core/config/route_paths.dart';
import '../../../../generated/assets.dart';
import '../../../common_widgets/text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = false;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                backButton(),
                Text(
                  "Create Your Account",
                  style: textThemes(context).titleLarge,
                ),
                Text(
                  "Sign up to start planning your next dream gateway.",
                  style: textThemes(context).titleSmall?.copyWith(
                    color: context.themeOption.colorHintText,
                    fontSize: 14,
                  ),
                ),
                30.height(),
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 5),
                  child: Text(
                    "FullName",
                    style: TextStyle(color: context.themeOption.colorBlack),
                  ),
                ),

                textFieldInput(
                  controller: nameController,
                  hintText: "Anthony Pettis",
                  prefixIcon: Icon(
                    Icons.person,
                    color: context.themeOption.colorHintText,
                  ),
                  backgroundColor: context.themeOption.colorWhite2,
                ),
                20.height(),
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 5),
                  child: Text(
                    "EmailAddress",
                    style: TextStyle(color: context.themeOption.colorBlack),
                  ),
                ),

                textFieldInput(
                  controller: emailController,
                  hintText: "e.g. wanderer@travel.com",
                  prefixIcon: Icon(
                    Icons.email,
                    color: context.themeOption.colorHintText,
                  ),
                  backgroundColor: context.themeOption.colorWhite2,
                ),
                20.height(),
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 5),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Password",
                      style: TextStyle(color: context.themeOption.colorBlack),
                    ),
                  ),
                ),
                textFieldInput(
                  controller: passwordController,
                  hintText: "password",
                  prefixIcon: Icon(
                    Icons.lock,
                    color: context.themeOption.colorHintText,
                  ),
                  suffixIcon: IconButton(
                    icon: obscureText
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    color: context.themeOption.colorHintText,
                  ),
                  obscureText: obscureText,
                ),
                20.height(),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                      activeColor: context.themeOption.colorPrimary,
                    ),
                    Expanded(
                      child: RichText(text: TextSpan(
                        text: 'I agree to the ',style: TextStyle(color: context.themeOption.colorHintText),
                        children: [
                          TextSpan(text: 'Terms and Conditions ',style: TextStyle(color: context.themeOption.colorPrimary,fontWeight: FontWeight.bold)),
                          TextSpan(text: 'and '),
                          TextSpan(text: 'Privacy Policy',style: TextStyle(color: context.themeOption.colorPrimary,fontWeight: FontWeight.bold)),
                        ]
                      )),
                    ),
                  ],
                ),
                20.height(),
                button("Create Account", ()=>context.push(RoutePaths.home)),
                20.height(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 1,
                      width: 60,
                      color: context.themeOption.colorTextLabel,
                    ),
                    10.width(),
                    Text(
                      "Or sign up with",
                      style: TextStyle(
                        color: context.themeOption.colorHintText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    10.width(),
                    Container(
                      height: 1,
                      width: 60,
                      color: context.themeOption.colorTextLabel,
                    ),

                  ],
                ),
                20.height(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    iconButton(SvgPicture.asset(Assets.googleLogo,height: 20,width: 20,), "Google",(){},backgroundColor: Colors.white70,fontColor: Colors.black ),
                    iconButton(SvgPicture.asset(Assets.appleLogo,height: 20,width: 20,color: Colors.white,), "Apple",(){},backgroundColor:Colors.black,fontColor: Colors.white ),
                  ],
                ),
                20.height(),
                Align(
                  alignment: Alignment.center,
                  child: RichText(text: TextSpan(text: 'Already have an account? ',
                  style: TextStyle(color: context.themeOption.colorHintText,fontSize: 16),
                  children: [
                    TextSpan(text: 'Login',style: TextStyle(color: context.themeOption.colorPrimary,fontWeight: FontWeight.bold),recognizer: TapGestureRecognizer()..onTap = () => context.push(RoutePaths.login)),
                  ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
