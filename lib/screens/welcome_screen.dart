import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vision21tech_smartkiosk/screens/splash/splash_screen.dart';
// import 'package:vision21tech_smartkiosk/theme.dart';
// import 'package:vision21tech_smartkiosk/constants.dart';

class WelcomeScreen extends StatefulWidget {
  static String routeName = "/main";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/background.png'),
        ),
      ),
      child: Scaffold(
          appBar: AppBar(
              // title:
              // Text('스마트 어린이집', style: textTheme().headline1),
              ),
          body: Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/kindergarten.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
              ),
              Expanded(
                flex: 1,
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () {
                      Get.off(SplashScreen());},
                      child: Text('키 재기'),
                    ),
                    ElevatedButton(onPressed: () {
                      Get.to(SplashScreen());},
                      child: Text('감정 수집'),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
