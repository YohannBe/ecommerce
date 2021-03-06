import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:shoppify/screens/home_connected/home_connected.dart';
import 'package:shoppify/screens/sign_in/sign_in_screen.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if (firebaseUser != null) {
      return HomeConnected();
    } else {
      return SignInScreen();
    }
  }
}
