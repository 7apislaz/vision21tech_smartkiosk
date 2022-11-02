import 'package:flutter/material.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/welcome_screen.dart';

final Map<String, WidgetBuilder> route = {
  SplashScreen.routeName: (context) => SplashScreen(),
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
};
