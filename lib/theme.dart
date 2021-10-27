import 'package:flutter/material.dart';

import 'constant.dart';

ThemeData buildThemeData() {
  return ThemeData(
    appBarTheme: appBarTheme(),
    scaffoldBackgroundColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: buildTextTheme(),
    inputDecorationTheme: buildInputDecoration(),
    primarySwatch: Colors.blue,
  );
}

TextTheme buildTextTheme() {
  return const TextTheme(
      bodyText1: TextStyle(color: kTextColor),
      bodyText2: TextStyle(color: kTextColor));
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme:
        TextTheme(headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18)),
  );
}

InputDecorationTheme buildInputDecoration() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(color: kTextColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}
