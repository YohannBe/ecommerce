import 'package:flutter/material.dart';
import 'package:shoppify/screens/create_account_screen/components/body.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);
  static const String routeName = '/register_account';
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
