import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_flutter/core/config/route_paths.dart';
import 'package:travel_flutter/presentation/common_widgets/buttons.dart';
import 'package:travel_flutter/presentation/common_widgets/text_field.dart';
import 'package:travel_flutter/theme/text_style.dart';
import 'package:travel_flutter/utils/extensions.dart';
import '../../../../generated/assets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.loginBackground),
              fit: BoxFit.cover,
            ),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return  SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        5.height(),
                        InkWell(
                          onTap: () => context.themeController.setTheme(
                            context.isDarkTheme ? "light" : "dark",
                          ),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(Assets.travelLogo),
                          ),
                        ),

                        5.height(),
                        Text(
                          "Farvana",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        20.height(),
                        Container(
                          width: 330,
                          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          decoration: BoxDecoration(
                            color: context.themeOption.colorWhite2,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Welcome Back",
                                style: textThemes(context).headlineLarge?.copyWith(
                                  color: context.themeOption.colorText,
                                ),
                              ),
                              Text(
                                "Login to access your itineraries and bookings",
                                style: textThemes(context).labelSmall,
                              ),
                              20.height(),
                              Padding(
                                padding: const EdgeInsets.only(left: 16, bottom: 5),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "EmailAddress",
                                    style: TextStyle(color: context.themeOption.colorBlack),
                                  ),
                                ),
                              ),
                              textFieldInput(
                                controller: emailController,
                                hintText: "e.g. wanderer@travel.com",
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: context.themeOption.colorHintText,
                                ),
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
                                    icon: obscureText ? Icon(Icons.visibility_off,) : Icon(Icons.visibility),
                                    onPressed: (){
                                      setState(() {
                                        obscureText = !obscureText;
                                      });
                                    },
                                    color: context.themeOption.colorHintText,
                                  ),
                                  obscureText: obscureText
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                      color: context.themeOption.colorPrimary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              20.height(),
                              button("Login", ()=>context.push(RoutePaths.register)),
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
                                    "OR CONTINUE WITH",
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  iconButton(SvgPicture.asset(Assets.googleLogo,height: 20,width: 20,), "Google",(){},backgroundColor: Colors.white70,fontColor: Colors.black ),
                                  iconButton(SvgPicture.asset(Assets.appleLogo,height: 20,width: 20,color: Colors.white,), "Apple",(){},backgroundColor:Colors.black,fontColor: Colors.white ),
                                ],
                              )
                            ],
                          ),
                        ),
                        20.height(),
                        Align(
                          alignment: Alignment.center,
                          child: RichText(text: TextSpan(text: "Don't have an account? ",
                              style: TextStyle(color: context.themeOption.colorHintText,fontSize: 14),
                              children: [
                                TextSpan(text: 'SignUp',style: TextStyle(color: context.themeOption.colorPrimary,fontWeight: FontWeight.bold)),
                              ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      );

  }
}
