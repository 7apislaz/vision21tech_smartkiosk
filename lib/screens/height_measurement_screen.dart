import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vision21tech_smartkiosk/constants.dart';
import 'package:vision21tech_smartkiosk/module/button.dart';
import 'package:vision21tech_smartkiosk/screens/welcome_screen.dart';
import 'package:vision21tech_smartkiosk/screens/measurement_error.dart';
import 'package:vision21tech_smartkiosk/theme.dart';

class HeightMeasure extends StatefulWidget {
  static String routeName = "/heightmeasure";

  @override
  _HeightMeasureState createState() => _HeightMeasureState();
}

class _HeightMeasureState extends State<HeightMeasure> {
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
            // title:
            // Text('스마트 어린이집', style: textTheme().headline1),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.only(top: 80, left: 100, right: 100),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/KioskAndKid.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Padding(padding: const EdgeInsets.only(top: 40, left: 70),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildMyInfo("키 : ", 3, TextAlign.left, "", ""),
                    buildMyInfo("몸무게 : ", 3, TextAlign.left, "", ""),
                    SizedBox(height: 30),
                    buildMyInfo("키와 몸무게를 확인해 주세요", 3.5, TextAlign.center, "", ""),
                  ],
                ),
                // child: Column(
                //   children: [
                //     Text("키 : ", textScaleFactor: 3, textAlign: TextAlign.left),
                //     Text("몸무게 : ", textScaleFactor: 3,),
                //     SizedBox(height: 30),
                //     Text("키와 몸무게를 확인해 주세요", textScaleFactor: 3,),
                //   ],
                // ),
              ),
              Padding(padding: const EdgeInsets.only(top:40, left: 60.0, right: 60.0, bottom: 130.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Kiosk_Button(
                      text: '맞아요',
                      textScale: 3,
                      maxiSize: Size(300, 110),
                      miniSize: Size(300, 110),
                      buttonColor: kOrangeButtonColor,
                      textStyle: Theme.of(context).textTheme.bodyText1,
                      onPressed: () {
                        Get.to(() => MesureErrorScreen());
                      },
                    ),
                    SizedBox(width: 30),
                    Kiosk_Button(
                      text: '아니에요',
                      textScale: 3,
                      maxiSize: Size(300, 110),
                      miniSize: Size(300, 110),
                      buttonColor: kGrayButtonColor,
                      textStyle: Theme.of(context).textTheme.bodyText2,
                      onPressed: () {
                        Get.to(() => WelcomeScreen());
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

Widget buildMyInfo(String myText, double textScale, align, myData, description) {
  return ListTile(
    leading: Text(
        myText, textScaleFactor: textScale, textAlign: align
    ),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          myData,
          style: TextStyle(
            color: kDarkFontColor,
            fontFamily: 'Godo',
            fontWeight: FontWeight.normal),
        ),
        Text(
          description,
          style: TextStyle(
            color: kDarkFontColor,
            fontFamily: 'Godo',
            fontWeight: FontWeight.normal),
        ),
      ],
    ),
  );
}
