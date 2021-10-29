import 'package:flutter/material.dart';
import 'package:shoppify/components/no_account_text.dart';
import 'package:shoppify/components/social_card.dart';
import 'package:shoppify/screens/create_account_screen/register_account_screen.dart';
import 'package:shoppify/screens/sign_in/components/sign_form.dart';
import 'package:shoppify/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight * 0.04,
                ),
                Text(
                  "Welcome back",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Sign in with your email and password \nor continue with social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.08,
                ),
                SignForm(),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.08,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCard(
                      icon: Icons.facebook,
                      press: () {},
                    ),
                    SocialCard(
                      icon: Icons.album,
                      press: () {},
                    ),
                    SocialCard(
                      icon: Icons.wb_twighlight,
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                NoAccountText(
                    text1: "Don't have an account? ",
                    text2: " Sign up",
                    press: () {
                      Navigator.pushNamed(
                          context, CreateAccountScreen.routeName);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
