import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vision21tech_smartkiosk/constants.dart';
import 'package:vision21tech_smartkiosk/module/audio.dart';
import 'package:vision21tech_smartkiosk/module/button.dart';
import 'package:vision21tech_smartkiosk/screens/kiosk_setting_screen.dart';
import 'package:vision21tech_smartkiosk/screens/welcome_screen.dart';

class NetworkErrorScreen extends StatefulWidget {
  static String routeName = "/networkerror";

  @override
  _NetworkErrorScreenState createState() => _NetworkErrorScreenState();
}

class _NetworkErrorScreenState extends State<NetworkErrorScreen> {
  ButtonAudios buttonAudios = ButtonAudios();
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
                buttonAudios.playAudio('assets/audios/button_effect.mp3');
                Get.off(WelcomeScreen());
              },
            ),
          ),
          body: Center(
            child: Padding(padding: const EdgeInsets.only(top:80, left: 100.0, right: 100.0, bottom: 80.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("네트워크가 연결되지 않았어요", textScaleFactor: 3.2,),
                    SizedBox(height: 10),
                    Text("네트워크 연결을 확인해 주세요", textScaleFactor: 3.2,),
                    SizedBox(height: 80,),
                    Kiosk_Button(
                        text: '네트워크 설정하러 가기',
                        onPressed: () {
                          buttonAudios.playAudio('assets/audios/button_effect.mp3');
                          Get.off(() => KioskSettingScreen());
                        },
                        maxiSize: Size(440, 80),
                        miniSize: Size(440, 80),
                        textScale: 2.5,
                        textStyle: Theme.of(context).textTheme.bodyText1,
                        buttonColor: kOrangeButtonColor,
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
