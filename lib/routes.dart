import 'package:flutter/widgets.dart';
import 'package:shoppify/screens/forgot_password_screen/forgot_password_screen.dart';
import 'package:shoppify/screens/sign_in/sign_in_screen.dart';
import 'package:shoppify/screens/splash/splashscreen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
};