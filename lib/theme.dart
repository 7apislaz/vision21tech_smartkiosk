import 'package:flutter/material.dart';
import 'package:vision21tech_smartkiosk/constants.dart';

AppBarTheme appTheme() {
  return AppBarTheme(
    centerTitle: false,
    color: kAppbarColor,
    elevation: 0.0,
  );
}

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: kBackgroundColor,
    appBarTheme: appTheme(),

  );
}