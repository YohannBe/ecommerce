import 'package:flutter/material.dart';
import 'package:shoppify/screens/sign_in/components/body.dart';

class SignInScreen extends StatelessWidget {

  const SignInScreen({Key? key}) : super(key: key);
  static const String routeName = '/sign_in';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign in"),
      ),
      body: Body(),
    );
  }
}
