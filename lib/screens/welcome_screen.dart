import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/interceptors/get_modifiers.dart';
import 'package:vision21tech_smartkiosk/constants.dart';
import 'package:vision21tech_smartkiosk/module/button.dart';
import 'package:vision21tech_smartkiosk/screens/emotion_kid_list_screen.dart';
import 'package:vision21tech_smartkiosk/screens/kid_list_screen.dart';
import 'package:vision21tech_smartkiosk/screens/kiosk_setting_screen.dart';
import 'package:vision21tech_smartkiosk/screens/measuring_screen.dart';
import 'package:usb_serial/usb_serial.dart';
import '../model/apikidlist_providers.dart';
import 'package:http/http.dart' as http;

class WelcomeScreen extends StatefulWidget {
  static String routeName = "/main";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  int touchCount = 0;

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
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
              SizedBox(height: 140),
              GestureDetector(
                onTap: () {
                  touchCount++;
                  if (touchCount == 3) {
                    Get.to(() => KioskSettingScreen());
                  }
                },
                behavior: HitTestBehavior.translucent,
                child: Container(
                  alignment: Alignment.topLeft,
                  width: 720,
                  height: 80,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.only(left: 100, right: 100),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/kindergarten.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 60, left: 100.0, right: 100.0, bottom: 180.0),
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
                          Get.to(() => KidListScreen());
                        }),
                    SizedBox(height: 70),
                    Kiosk_Button(
                      text: '감정 수집',
                      textScale: 5,
                      maxiSize: Size(500, 160),
                      miniSize: Size(500, 160),
                      buttonColor: kOrangeButtonColor,
                      textStyle: Theme.of(context).textTheme.bodyText1,
                      onPressed: () {
                        Get.to(() => EmotionKidListScreen());
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
