import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vision21tech_smartkiosk/constants.dart';
import 'package:vision21tech_smartkiosk/module/button.dart';
import 'package:vision21tech_smartkiosk/screens/kiosk_setting_screen.dart';
import 'package:vision21tech_smartkiosk/screens/welcome_screen.dart';

class CameraErrorScreen extends StatefulWidget {
  static String routeName = "/cameraerror";

  @override
  _CameraErrorScreenState createState() => _CameraErrorScreenState();
}

class _CameraErrorScreenState extends State<CameraErrorScreen> {
  @override
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
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded, size: 60,),
            onPressed: () {
              Get.off(WelcomeScreen());
            },
          ),
          // title:
          // Text('스마트 어린이집', style: textTheme().headline1),
        ),
        body: Center(
          child: Padding(padding: const EdgeInsets.only(top:80, left: 100.0, right: 100.0, bottom: 80.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("카메라가 연결되지 않았어요", textScaleFactor: 3.2,),
                SizedBox(height: 10),
                Text("카메라와 포트 번호를 확인한 뒤", textScaleFactor: 3.2,),
                SizedBox(height: 10),
                Text("프로그램을 재시작해 주세요", textScaleFactor: 3.2,),
                Padding(padding: const EdgeInsets.only(top: 60,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Kiosk_Button(
                        text: '사진에서 고르기',
                        textScale: 2.4,
                        maxiSize: Size(280, 100),
                        miniSize: Size(280, 100),
                        buttonColor: kOrangeButtonColor,
                        textStyle: Theme.of(context).textTheme.bodyText1,
                        onPressed: () {
                          Get.to(() => WelcomeScreen());
                        },
                      ),
                      SizedBox(width: 30),
                      Kiosk_Button(
                        text: '설정으로 가기',
                        textScale: 2.4,
                        maxiSize: Size(280, 100),
                        miniSize: Size(280, 100),
                        buttonColor: kGrayButtonColor,
                        textStyle: Theme.of(context).textTheme.bodyText2,
                        onPressed: () {
                          Get.to(() => KioskSettingScreen());
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        ),
      ),
    );
  }
}
