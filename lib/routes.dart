import 'package:flutter/material.dart';
import 'package:vision21tech_smartkiosk/screens/height_measurement_screen.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/welcome_screen.dart';

final Map<String, WidgetBuilder> route = {
  SplashScreen.routeName: (context) => SplashScreen(),
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  HeightMeasure.routeName: (context) => HeightMeasure(),
};
