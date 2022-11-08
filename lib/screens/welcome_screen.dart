import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vision21tech_smartkiosk/constants.dart';
import 'package:vision21tech_smartkiosk/module/button.dart';
import 'package:vision21tech_smartkiosk/screens/splash/splash_screen.dart';
import 'package:vision21tech_smartkiosk/screens/height_measurement_screen.dart';
import 'package:vision21tech_smartkiosk/theme.dart';

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Expanded(
          flex: 2,
          child: Container(
            margin: EdgeInsets.only(top: 180, left: 100, right: 100),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/kindergarten.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Padding(padding: const EdgeInsets.only(top:60, left: 100.0, right: 100.0, bottom: 180.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Kiosk_Button(
                  text: '키 재기',
                  textScale: 5,
                  maxiSize: Size(500, 160),
                  miniSize: Size(500, 160),
                  buttonColor: kOrangeButtonColor,
                  textStyle: Theme.of(context).textTheme.bodyText1,
                  onPressed: () {
                    Get.to(HeightMeasure());
                  },
              ),
              SizedBox(height: 70),
              Kiosk_Button(
                  text: '감정 수집',
                  textScale: 5,
                  maxiSize: Size(500, 160),
                  miniSize: Size(500, 160),
                  buttonColor: kOrangeButtonColor,
                  textStyle: Theme.of(context).textTheme.bodyText1,
                  onPressed: () {
                    Get.off(SplashScreen());
                  },
              ),
            ],
          ),
        ),
      ],
    )),
    );
  }
}
