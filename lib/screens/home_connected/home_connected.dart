import 'package:flutter/material.dart';
import 'package:shoppify/components/default_button.dart';
import 'package:shoppify/network/authentication_service.dart';
import 'package:shoppify/screens/profile/profile_screen.dart';
import 'package:shoppify/screens/sign_in/sign_in_screen.dart';

class HomeConnected extends StatelessWidget {
  HomeConnected({Key? key}) : super(key: key);

  static const String routeName = '/home_connected';
  final AuthenticationService _authenticationService = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          DefaultButton(
              text: "Profile",
              press: () {
                Navigator.pushNamed(context, ProfileScreen.routeName);
              }),
          DefaultButton(
              text: "disconnect",
              press: () async {
                dynamic result = _authenticationService.signOut();
                if (result != null){
                  Navigator.pushNamed(context, SignInScreen.routeName);
                }
              }),
        ],
      ),
    );
  }
}
