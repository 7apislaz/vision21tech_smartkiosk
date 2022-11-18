import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vision21tech_smartkiosk/constants.dart';
import 'package:vision21tech_smartkiosk/module/button.dart';
import 'package:vision21tech_smartkiosk/screens/kiosk_setting_screen.dart';
import 'package:vision21tech_smartkiosk/screens/welcome_screen.dart';

class EmotionScreen extends StatefulWidget {
  static String routeName = "/emotion";

  @override
  _EmotionScreenState createState() => _EmotionScreenState();
}

class _EmotionScreenState extends State<EmotionScreen> {
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
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded, size: 60,),
            onPressed: () {
              Get.off(WelcomeScreen());
            },
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Padding(padding: const EdgeInsets.only(top:80, left: 100.0, right: 100.0),
            child: Column(
              children: [
                Text("오늘 어린이집에 오기 전에", textScaleFactor: 3.2,),
                SizedBox(height: 10),
                Text("집에서 너의 마음은 어땠니?", textScaleFactor: 3.2,),
                SizedBox(height: 40,),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 10),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
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
                SizedBox(width: 10,),
                InkWell(
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
            Padding(padding: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.only(bottom: 10),
                      alignment: AlignmentDirectional.bottomCenter,
                      decoration: BoxDecoration(
                        color: Color(0xFFF3A200),
                        shape: ,
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
                  SizedBox(width: 10,),
                  InkWell(
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
            Padding(padding: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
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
                  SizedBox(width: 10,),
                  InkWell(
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
    );
  }
}
