import 'package:flutter/material.dart';

import '../size_config.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({
    Key? key,
    required this.icon,
    required this.press,
  }) : super(key: key);
  final IconData icon;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getProportionateScreenWidth(12)),
      height: getProportionateScreenHeight(60),
      width: getProportionateScreenWidth(60),
      decoration: BoxDecoration(
        color: Colors.black12,
        shape: BoxShape.circle,
      ),
      child: Icon(icon),
    );
  }
}