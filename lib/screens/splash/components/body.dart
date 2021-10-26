import 'package:flutter/material.dart';
import 'package:shoppify/constant.dart';
import '../components/splash_content.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Tokoto, Let’s shop!",
      "image": "assets/images/dragon.PNG"
    },
    {
      "text":
          "We help people connect with store \naround United State of America",
      "image": "assets/images/shop.PNG"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/zoro.PNG"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value){
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  text: splashData[index]["text"]!,
                  image: splashData[index]["image"]!,
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: List.generate(
                        splashData.length,
                        (index) => BuildDot(index: index, currentPage: currentPage,),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class BuildDot extends StatelessWidget {
  const BuildDot({
    Key? key, required this.index, required this.currentPage,
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
