import 'package:flutter/material.dart';
import 'package:vision21tech_smartkiosk/constants.dart';

TextTheme textTheme() {
  return const TextTheme(
    headline1: TextStyle(
        color: kDarkFontColor, fontFamily: 'Godo', fontWeight: FontWeight.bold),
    bodyText1: TextStyle(
        color: kWhiteFontColor,
        fontFamily: 'Godo',
        fontWeight: FontWeight.normal),
    bodyText2: TextStyle(
        color: kWhiteFontColor,
        fontFamily: 'Godo',
        fontWeight: FontWeight.bold),
    button: TextStyle(
        color: kDarkFontColor, fontFamily: 'Godo', fontWeight: FontWeight.bold),
  );
}

AppBarTheme appTheme() {
  return AppBarTheme(
    toolbarHeight: 100,
    centerTitle: true,
    color: kBackgroundColor,
    elevation: 0.0,
    textTheme: TextTheme(
      headline2: TextStyle(
          color: kWhiteFontColor,
          fontFamily: 'Godo',
          fontWeight: FontWeight.bold),
    ),
  );
}

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: appTheme(),
    textTheme: textTheme(),
  );
}
