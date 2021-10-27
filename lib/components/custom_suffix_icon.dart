import 'package:flutter/cupertino.dart';

import '../size_config.dart';

class CustomSuffixIcon extends StatelessWidget {
  const CustomSuffixIcon({
    Key? key,
    required this.mIcon,
  }) : super(key: key);

  final IconData mIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, getProportionateScreenWidth(20),
          getProportionateScreenWidth(20), getProportionateScreenWidth(20)),
      child: Icon(mIcon),
    );
  }
}