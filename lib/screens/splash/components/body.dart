import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:shoppify/components/authentication_wrapper.dart';
import 'package:shoppify/model/user_model.dart';
import 'package:shoppify/network/authentication_service.dart';
import 'package:shoppify/screens/home_connected/home_connected.dart';
import 'package:shoppify/screens/sign_in/sign_in_screen.dart';
import 'package:shoppify/size_config.dart';
import '../components/splash_content.dart';
import '../../../components/default_button.dart';
import 'dot_builder.dart';

class Body extends StatefulWidget {
  Body(this.user);

   final AppUser? user;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;

  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Tokoto, Let’s shop!",
      "image": "assets/images/dragon.PNG"
    },
    {
      "text":
          "We help people connect with store \naround United State of America",
      "image": "assets/images/shop.PNG"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/zoro.PNG"
    },
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  text: splashData[index]["text"]!,
                  image: splashData[index]["image"]!,
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Column(
                    children: [
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                          (index) => BuildDot(
                            index: index,
                            currentPage: currentPage,
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 4,
                      ),
                      DefaultButton(
                        text: "Continue",
                        press: (){
                          log('data: laaaaaaaaaaa');
                          widget.user != null
                              ? Navigator.pushNamed(
                                  context, HomeConnected.routeName)
                              : Navigator.pushNamed(
                                  context, SignInScreen.routeName);
                          //return widget.user != null ? HomeConnected(): SignInScreen();
                          /*Navigator.pushNamed(
                              context, SignInScreen.routeName);*/
                        },
                      ),
                      Spacer(),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
