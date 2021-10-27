import 'package:flutter/material.dart';

import '../../../constant.dart';

class BuildDot extends StatelessWidget {
  const BuildDot({
    Key? key,
    required this.index,
    required this.currentPage,
  }) : super(key: key);

  final int index;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentPage == index ? kPrimaryColor : Colors.black12,
          borderRadius: BorderRadius.circular(3)),
    );
  }
}
