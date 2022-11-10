import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vision21tech_smartkiosk/screens/welcome_screen.dart';
// import 'package:vision21tech_smartkiosk/module/button.dart';
// import '../constants.dart';

class KioskSettingScreen extends StatefulWidget {
  static String routeName = "/setting";

  @override
  _KioskSettingScreenState createState() => _KioskSettingScreenState();
}

class _KioskSettingScreenState extends State<KioskSettingScreen> {
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
                Get.to(WelcomeScreen());
              },
            ),
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
                    Text("측정기 위에 올라가 주세요", textScaleFactor: 3.5,),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
