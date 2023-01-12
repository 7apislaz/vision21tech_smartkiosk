import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:vision21tech_smartkiosk/constants.dart';
import 'package:vision21tech_smartkiosk/model/apikidmeasure_providers.dart';
import 'package:vision21tech_smartkiosk/module/button.dart';
import 'package:vision21tech_smartkiosk/screens/kid_list_screen.dart';
import 'package:vision21tech_smartkiosk/screens/measuring_screen.dart';
import 'package:vision21tech_smartkiosk/screens/welcome_screen.dart';
import 'package:vision21tech_smartkiosk/screens/measurement_error.dart';
import '../data/mydata.dart';
import '../module/audio.dart';

class HeightMeasure extends StatefulWidget {
  static String routeName = "/heightmeasure";

  @override
  _HeightMeasureState createState() => _HeightMeasureState();
}

class _HeightMeasureState extends State<HeightMeasure> {
  ButtonAudios buttonAudios = ButtonAudios();
  final MyData postData = Get.find();

  @override
  Widget build(BuildContext context) {
    buttonAudios.playAudio('assets/audios/height_confirm.mp3');
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
                buttonAudios.playAudio('assets/audios/button_effect.mp3');
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
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 80.0, right: 80.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "키와 몸무게를 확인해주세요!",
                      textScaleFactor: 3.5,
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.straighten,
                          size: 35,
                          color: kOrangeButtonColor,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                            "키 : ",
                            textScaleFactor: 2.5,
                        ),
                        Text(
                          "${postData.kidHeight}cm",
                          textScaleFactor: 2.5,
                        ),
                        Spacer(),
                        Icon(
                          Icons.scale,
                          size: 35,
                          color: kOrangeButtonColor,
                        ),
                        SizedBox(
                          width: 20,
                        ),Text(
                            "몸무게 : ",
                            textScaleFactor: 2.5,
                        ),
                        Text(
                          "${postData.kidWeight}kg",
                          textScaleFactor: 2.5,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 40, left: 60.0, right: 60.0, bottom: 130.0),
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
                        PostKidMeasure kidsMeasure = PostKidMeasure(
                            Pheight: '${postData.kidHeight}', Pweight: '${postData.kidWeight}', Pkey: '${postData.key}');
                        kidsMeasure.postMeasureAll();
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
                        Get.back();
                        buttonAudios.playAudio('assets/audios/height_measure.mp3');
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
