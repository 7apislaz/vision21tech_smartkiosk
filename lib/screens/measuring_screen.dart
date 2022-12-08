import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vision21tech_smartkiosk/screens/welcome_screen.dart';

class MesuringScreen extends StatefulWidget {
  static String routeName = "/mesuring";

  @override
  _MesuringScreenState createState() => _MesuringScreenState();
}

class _MesuringScreenState extends State<MesuringScreen> {
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
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.only(top: 130, left: 100, right: 100),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/HeightKid.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Padding(padding: const EdgeInsets.only(top:80, left: 100.0, right: 100.0, bottom: 180.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("체중계 위에 서서 측정이", textScaleFactor: 3.5,),
                    SizedBox(height: 20),
                    Text("끝날 때까지 기다려 주세요.", textScaleFactor: 3.5,),
                    SizedBox(height: 20),
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
