import 'package:flutter/material.dart';
import 'package:shoppify/screens/forgot_password_screen/components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password_screen";
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot password"),
      ),
      body: Body(),
    );
  }
}
