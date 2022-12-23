import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vision21tech_smartkiosk/theme.dart';
import 'routes.dart';
import 'screens/splash/splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SmartKiosk',
      theme: theme(),
      initialRoute: SplashScreen.routeName,
      routes: route,
    );
  }
}
