import 'package:flutter/material.dart';
import 'package:shoppify/screens/create_account_screen/register_account_screen.dart';
import 'package:shoppify/screens/forgot_password_screen/forgot_password_screen.dart';

import '../constant.dart';
import '../size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key, required this.text1, required this.text2, required this.press,
  }) : super(key: key);

  final String text1, text2;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text1,
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: press,
          child: Text(text2,
            style: TextStyle(fontSize: getProportionateScreenWidth(16), color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
