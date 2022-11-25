import 'package:flutter/material.dart';
import 'package:vision21tech_smartkiosk/screens/camera_error.dart';
import 'package:vision21tech_smartkiosk/screens/data_error.dart';
import 'package:vision21tech_smartkiosk/screens/emotion_screen.dart';
import 'package:vision21tech_smartkiosk/screens/height_measurement_screen.dart';
import 'package:vision21tech_smartkiosk/screens/kid_list_screen.dart';
import 'package:vision21tech_smartkiosk/screens/kiosk_setting_screen.dart';
import 'package:vision21tech_smartkiosk/screens/measurement_error.dart';
import 'package:vision21tech_smartkiosk/screens/measuring_screen.dart';
import 'package:vision21tech_smartkiosk/screens/network_error.dart';
import 'package:vision21tech_smartkiosk/screens/playing_screen.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/welcome_screen.dart';

final Map<String, WidgetBuilder> route = {
  SplashScreen.routeName: (context) => SplashScreen(),
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  HeightMeasure.routeName: (context) => HeightMeasure(),
  MesureErrorScreen.routeName: (context) => MesureErrorScreen(),
  MesuringScreen.routeName: (context) => MesuringScreen(),
  KioskSettingScreen.routeName: (context) => KioskSettingScreen(),
  NetworkErrorScreen.routeName: (context) => NetworkErrorScreen(),
  DataErrorScreen.routeName: (context) => DataErrorScreen(),
  CameraErrorScreen.routeName: (context) => CameraErrorScreen(),
  EmotionScreen.routeName: (context) => EmotionScreen(),
  PlayingScreen.routeName: (context) => PlayingScreen(),
  KidListScreen.routeName: (context) => KidListScreen(),
};
