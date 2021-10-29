import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppify/model/user_model.dart';

import 'package:shoppify/screens/splash/components/body.dart';
import 'package:shoppify/size_config.dart';


class SplashScreen extends StatelessWidget {
  static String routeName = '/splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    SizeConfig().init(context);
    return Scaffold(
      body: Body(user),
    );
  }
}
