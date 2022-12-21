import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vision21tech_smartkiosk/constants.dart';
import 'package:vision21tech_smartkiosk/screens/playing_screen.dart';
import 'package:vision21tech_smartkiosk/screens/welcome_screen.dart';
import 'package:vision21tech_smartkiosk/data/mydata.dart';
import '../module/audio.dart';

class EmotionScreen extends StatefulWidget {
  static String routeName = "/emotion";

  @override
  _EmotionScreenState createState() => _EmotionScreenState();
}

class _EmotionScreenState extends State<EmotionScreen> {
  ButtonAudios buttonAudios = ButtonAudios();
  final MyData myData = Get.put(MyData(
    emotion: '',
  ));

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
              icon: Icon(
                Icons.arrow_back_rounded,
                size: 60,
              ),
              onPressed: () {
                Get.off(() => WelcomeScreen());
              },
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 80, left: 100.0, right: 100.0),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      "지금 너의 마음은 어떠니?",
                      textScaleFactor: 3.2,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        buttonAudios.playAudio('assets/audios/Emotion/happy2.mp3');
                        Get.to(() => PlayingScreen(), arguments: [
                          myData.emotion = "HAPPY",
                          myData.key,
                        ]);
                      },
                      child: Container(
                        padding: EdgeInsets.only(bottom: 10),
                        alignment: AlignmentDirectional.bottomCenter,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFCB64),
                          image: DecorationImage(
                            fit: BoxFit.scaleDown,
                            scale: 2.4,
                            image: AssetImage('assets/images/happyboy.png'),
                          ),
                        ),
                        child: Text(
                          "행복",
                          textAlign: TextAlign.center,
                          textScaleFactor: 1.8,
                          style: TextStyle(color: kWhiteFontColor),
                        ),
                        width: 300,
                        height: 280,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        buttonAudios.playAudio('assets/audios/Emotion/joy1.mp3');
                        Get.to(() => PlayingScreen(), arguments: [
                          myData.emotion = "EXCITE",
                          myData.key,
                        ]);
                      },
                      child: Container(
                        padding: EdgeInsets.only(bottom: 10),
                        alignment: AlignmentDirectional.bottomCenter,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFCB64),
                          image: DecorationImage(
                            fit: BoxFit.scaleDown,
                            scale: 2.4,
                            image: AssetImage('assets/images/excitedBoy.png'),
                          ),
                        ),
                        child: Text(
                          "신남",
                          textAlign: TextAlign.center,
                          textScaleFactor: 1.8,
                          style: TextStyle(color: kWhiteFontColor),
                        ),
                        width: 300,
                        height: 280,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        buttonAudios.playAudio('assets/audios/Emotion/sad.mp3');
                        Get.to(() => PlayingScreen(), arguments: [
                          myData.emotion = "SAD",
                          myData.key,
                        ]);
                      },
                      child: Container(
                        padding: EdgeInsets.only(bottom: 10),
                        alignment: AlignmentDirectional.bottomCenter,
                        decoration: BoxDecoration(
                          color: Color(0xFFF3A200),
                          image: DecorationImage(
                            fit: BoxFit.scaleDown,
                            scale: 2.4,
                            image: AssetImage('assets/images/sadBoy.png'),
                          ),
                        ),
                        child: Text(
                          "우울",
                          textAlign: TextAlign.center,
                          textScaleFactor: 1.8,
                          style: TextStyle(color: kWhiteFontColor),
                        ),
                        width: 300,
                        height: 280,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        buttonAudios.playAudio('assets/audios/Emotion/angry.mp3');
                        Get.to(() => PlayingScreen(), arguments: [
                          myData.emotion = "ANGRY",
                          myData.key,
                        ]);
                      },
                      child: Container(
                        padding: EdgeInsets.only(bottom: 10),
                        alignment: AlignmentDirectional.bottomCenter,
                        decoration: BoxDecoration(
                          color: Color(0xFFF3A200),
                          image: DecorationImage(
                            fit: BoxFit.scaleDown,
                            scale: 2.4,
                            image: AssetImage('assets/images/angryBoy.png'),
                          ),
                        ),
                        child: Text(
                          "화남",
                          textAlign: TextAlign.center,
                          textScaleFactor: 1.8,
                          style: TextStyle(color: kWhiteFontColor),
                        ),
                        width: 300,
                        height: 280,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        buttonAudios.playAudio('assets/audios/Emotion/worry.mp3');
                        Get.to(() => PlayingScreen(), arguments: [
                          myData.emotion = "WORRY",
                          myData.key,
                        ]);
                      },
                      child: Container(
                        padding: EdgeInsets.only(bottom: 10),
                        alignment: AlignmentDirectional.bottomCenter,
                        decoration: BoxDecoration(
                          color: Color(0xFF4684FF),
                          image: DecorationImage(
                            fit: BoxFit.scaleDown,
                            scale: 2.4,
                            image: AssetImage('assets/images/worryBoy.png'),
                          ),
                        ),
                        child: Text(
                          "걱정",
                          textAlign: TextAlign.center,
                          textScaleFactor: 1.8,
                          style: TextStyle(color: kWhiteFontColor),
                        ),
                        width: 300,
                        height: 280,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => PlayingScreen(), arguments: [
                          myData.emotion = "LONELY",
                          myData.key,
                        ]);
                      },
                      child: Container(
                        padding: EdgeInsets.only(bottom: 10),
                        alignment: AlignmentDirectional.bottomCenter,
                        decoration: BoxDecoration(
                          color: Color(0xFF4684FF),
                          image: DecorationImage(
                            fit: BoxFit.scaleDown,
                            scale: 2.4,
                            image: AssetImage('assets/images/lonelyBoy.png'),
                          ),
                        ),
                        child: Text(
                          "외로움",
                          textAlign: TextAlign.center,
                          textScaleFactor: 1.8,
                          style: TextStyle(color: kWhiteFontColor),
                        ),
                        width: 300,
                        height: 280,
                      ),
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
