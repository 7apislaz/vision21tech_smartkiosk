import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usb_serial/transaction.dart';
import 'package:usb_serial/usb_serial.dart';
import 'package:vision21tech_smartkiosk/constants.dart';
import 'package:vision21tech_smartkiosk/module/button.dart';
import 'package:vision21tech_smartkiosk/screens/emotion_kid_list_screen.dart';
import 'package:vision21tech_smartkiosk/screens/kid_list_screen.dart';
import 'package:vision21tech_smartkiosk/screens/kiosk_setting_screen.dart';
import 'package:vision21tech_smartkiosk/screens/measuring_screen.dart';

import 'measurement_error.dart';

class WelcomeScreen extends StatefulWidget {
  static String routeName = "/main";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  int touchCount = 0;

  get p => null;

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
                        onPressed: () async {
                          List<UsbDevice> devices =
                              await UsbSerial.listDevices();
                          print(devices);
                          UsbPort? port;
                          if (devices.length == 0) {
                            Get.to(() => MesureErrorScreen());
                          }
                          port = await devices[0].create();
                          bool? openResult = await port?.open();
                          if (!openResult!) {
                            print("Failed to open");
                            return;
                          }
                          await port?.setDTR(true);
                          await port?.setFlowControl(1);
                          await port?.setRTS(true);
                          port?.setPortParameters(19600, UsbPort.DATABITS_8,
                              UsbPort.STOPBITS_1_5, UsbPort.PARITY_NONE);
                          // print first result and close port.

                          Future.delayed(const Duration(milliseconds: 700), () {
                            port?.inputStream?.listen((Uint8List event) {
                              print(event);
                              print(event.length);
                            });
                            //print(ascii.decode(event));
                          });

                          Get.to(() => MesuringScreen());
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
