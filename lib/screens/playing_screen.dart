import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vision21tech_smartkiosk/constants.dart';
import 'package:vision21tech_smartkiosk/module/button.dart';
import 'package:vision21tech_smartkiosk/screens/kiosk_setting_screen.dart';
import 'package:vision21tech_smartkiosk/screens/welcome_screen.dart';
import '../mydata.dart';

class PlayingScreen extends StatefulWidget {
  static String routeName = "/playing";

  @override
  _PlayingScreenState createState() => _PlayingScreenState();
}

class _PlayingScreenState extends State<PlayingScreen> {
  final MyData myData = Get.put(MyData(
    playing: '',
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
                Get.off(WelcomeScreen());
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
                    SizedBox(height: 60),
                    Text(
                      "지금 하고 싶은 놀이는 무엇이니?",
                      textScaleFactor: 3,
                    ),
                    SizedBox(height: 100),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 10),
                        alignment: AlignmentDirectional.bottomCenter,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.scaleDown,
                            image: AssetImage('assets/images/playBuild.png'),
                          ),
                        ),
                        width: 200,
                        height: 200,
                      ),
                      onTap: () {
                        myData.playing = "build";
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                titlePadding: EdgeInsets.only(
                                    top: 100, bottom: 60, right: 60, left: 60),
                                contentPadding:
                                    EdgeInsets.only(right: 60, left: 60),
                                actionsPadding: EdgeInsets.only(
                                    top: 60, bottom: 100, right: 60, left: 60),
                                actionsAlignment: MainAxisAlignment.center,
                                title: Text('건축놀이를 하고싶구나',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Godo',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 50,
                                      color: kDarkFontColor,
                                    )),
                                content: SingleChildScrollView(
                                  child: InkWell(
                                    child: Container(
                                      padding: EdgeInsets.only(bottom: 10),
                                      alignment:
                                          AlignmentDirectional.bottomCenter,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: AssetImage(
                                              'assets/images/playBuild.png'),
                                        ),
                                      ),
                                      width: 400,
                                      height: 400,
                                    ),
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: kOrangeButtonColor,
                                      maximumSize: Size(260, 100),
                                      minimumSize: Size(260, 100),
                                    ),
                                    onPressed: () {
                                      Get.off(WelcomeScreen());
                                    },
                                    child: Text(
                                      "맞아요!",
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: kGrayButtonColor,
                                      maximumSize: Size(260, 100),
                                      minimumSize: Size(260, 100),
                                    ),
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text(
                                      "아니에요!",
                                      style: TextStyle(
                                          fontSize: 30, color: kDarkFontColor),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 10),
                        alignment: AlignmentDirectional.bottomCenter,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.scaleDown,
                            image: AssetImage('assets/images/playMind.png'),
                          ),
                        ),
                        width: 200,
                        height: 200,
                      ),
                      onTap: () {
                        myData.playing = "mind";
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                titlePadding: EdgeInsets.only(
                                    top: 100, bottom: 60, right: 60, left: 60),
                                contentPadding:
                                    EdgeInsets.only(right: 60, left: 60),
                                actionsPadding: EdgeInsets.only(
                                    top: 60, bottom: 100, right: 60, left: 60),
                                actionsAlignment: MainAxisAlignment.center,
                                title: Text('마음놀이를 하고싶구나',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Godo',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 50,
                                      color: kDarkFontColor,
                                    )),
                                content: SingleChildScrollView(
                                  child: InkWell(
                                    child: Container(
                                      padding: EdgeInsets.only(bottom: 10),
                                      alignment:
                                          AlignmentDirectional.bottomCenter,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: AssetImage(
                                              'assets/images/playMind.png'),
                                        ),
                                      ),
                                      width: 400,
                                      height: 400,
                                    ),
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: kOrangeButtonColor,
                                      maximumSize: Size(260, 100),
                                      minimumSize: Size(260, 100),
                                    ),
                                    onPressed: () {
                                      Get.off(WelcomeScreen());
                                    },
                                    child: Text(
                                      "맞아요!",
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: kGrayButtonColor,
                                      maximumSize: Size(260, 100),
                                      minimumSize: Size(260, 100),
                                    ),
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text(
                                      "아니에요!",
                                      style: TextStyle(
                                          fontSize: 30, color: kDarkFontColor),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 10),
                        alignment: AlignmentDirectional.bottomCenter,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.scaleDown,
                            image: AssetImage('assets/images/playTalk.png'),
                          ),
                        ),
                        width: 200,
                        height: 200,
                      ),
                      onTap: () {
                        myData.playing = "talk";
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                titlePadding: EdgeInsets.only(
                                    top: 100, bottom: 60, right: 60, left: 60),
                                contentPadding:
                                    EdgeInsets.only(right: 60, left: 60),
                                actionsPadding: EdgeInsets.only(
                                    top: 60, bottom: 100, right: 60, left: 60),
                                actionsAlignment: MainAxisAlignment.center,
                                title: Text('이야기놀이를 하고싶구나',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Godo',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 50,
                                      color: kDarkFontColor,
                                    )),
                                content: SingleChildScrollView(
                                  child: InkWell(
                                    child: Container(
                                      padding: EdgeInsets.only(bottom: 10),
                                      alignment:
                                          AlignmentDirectional.bottomCenter,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: AssetImage(
                                              'assets/images/playTalk.png'),
                                        ),
                                      ),
                                      width: 400,
                                      height: 400,
                                    ),
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: kOrangeButtonColor,
                                      maximumSize: Size(260, 100),
                                      minimumSize: Size(260, 100),
                                    ),
                                    onPressed: () {
                                      Get.off(WelcomeScreen());
                                    },
                                    child: Text(
                                      "맞아요!",
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: kGrayButtonColor,
                                      maximumSize: Size(260, 100),
                                      minimumSize: Size(260, 100),
                                    ),
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text(
                                      "아니에요!",
                                      style: TextStyle(
                                          fontSize: 30, color: kDarkFontColor),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 10),
                        alignment: AlignmentDirectional.bottomCenter,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.scaleDown,
                            image: AssetImage('assets/images/playNature.png'),
                          ),
                        ),
                        width: 200,
                        height: 200,
                      ),
                      onTap: () {
                        myData.playing = "nature";
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                titlePadding: EdgeInsets.only(
                                    top: 100, bottom: 60, right: 60, left: 60),
                                contentPadding:
                                    EdgeInsets.only(right: 60, left: 60),
                                actionsPadding: EdgeInsets.only(
                                    top: 60, bottom: 100, right: 60, left: 60),
                                actionsAlignment: MainAxisAlignment.center,
                                title: Text('자연놀이를 하고싶구나',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Godo',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 50,
                                      color: kDarkFontColor,
                                    )),
                                content: SingleChildScrollView(
                                  child: InkWell(
                                    child: Container(
                                      padding: EdgeInsets.only(bottom: 10),
                                      alignment:
                                          AlignmentDirectional.bottomCenter,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: AssetImage(
                                              'assets/images/playNature.png'),
                                        ),
                                      ),
                                      width: 400,
                                      height: 400,
                                    ),
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: kOrangeButtonColor,
                                      maximumSize: Size(260, 100),
                                      minimumSize: Size(260, 100),
                                    ),
                                    onPressed: () {
                                      Get.off(WelcomeScreen());
                                    },
                                    child: Text(
                                      "맞아요!",
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: kGrayButtonColor,
                                      maximumSize: Size(260, 100),
                                      minimumSize: Size(260, 100),
                                    ),
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text(
                                      "아니에요!",
                                      style: TextStyle(
                                          fontSize: 30, color: kDarkFontColor),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 10),
                        alignment: AlignmentDirectional.bottomCenter,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.scaleDown,
                            image: AssetImage('assets/images/playimagine.png'),
                          ),
                        ),
                        width: 200,
                        height: 200,
                      ),
                      onTap: () {
                        myData.playing = "imagine";
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                titlePadding: EdgeInsets.only(
                                    top: 100, bottom: 60, right: 60, left: 60),
                                contentPadding:
                                    EdgeInsets.only(right: 60, left: 60),
                                actionsPadding: EdgeInsets.only(
                                    top: 60, bottom: 100, right: 60, left: 60),
                                actionsAlignment: MainAxisAlignment.center,
                                title: Text('상상놀이를 하고싶구나',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Godo',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 50,
                                      color: kDarkFontColor,
                                    )),
                                content: SingleChildScrollView(
                                  child: InkWell(
                                    child: Container(
                                      padding: EdgeInsets.only(bottom: 10),
                                      alignment:
                                          AlignmentDirectional.bottomCenter,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: AssetImage(
                                              'assets/images/playimagine.png'),
                                        ),
                                      ),
                                      width: 400,
                                      height: 400,
                                    ),
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: kOrangeButtonColor,
                                      maximumSize: Size(260, 100),
                                      minimumSize: Size(260, 100),
                                    ),
                                    onPressed: () {
                                      Get.off(WelcomeScreen());
                                    },
                                    child: Text(
                                      "맞아요!",
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: kGrayButtonColor,
                                      maximumSize: Size(260, 100),
                                      minimumSize: Size(260, 100),
                                    ),
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text(
                                      "아니에요!",
                                      style: TextStyle(
                                          fontSize: 30, color: kDarkFontColor),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
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
                      child: Container(
                        padding: EdgeInsets.only(bottom: 10),
                        alignment: AlignmentDirectional.bottomCenter,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.scaleDown,
                            image: AssetImage('assets/images/playSound.png'),
                          ),
                        ),
                        width: 200,
                        height: 200,
                      ),
                      onTap: () {
                        myData.playing = "sound";
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                titlePadding: EdgeInsets.only(
                                    top: 100, bottom: 60, right: 60, left: 60),
                                contentPadding:
                                    EdgeInsets.only(right: 60, left: 60),
                                actionsPadding: EdgeInsets.only(
                                    top: 60, bottom: 100, right: 60, left: 60),
                                actionsAlignment: MainAxisAlignment.center,
                                title: Text('소리놀이를 하고싶구나',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Godo',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 50,
                                      color: kDarkFontColor,
                                    )),
                                content: SingleChildScrollView(
                                  child: InkWell(
                                    child: Container(
                                      padding: EdgeInsets.only(bottom: 10),
                                      alignment:
                                          AlignmentDirectional.bottomCenter,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: AssetImage(
                                              'assets/images/playSound.png'),
                                        ),
                                      ),
                                      width: 400,
                                      height: 400,
                                    ),
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: kOrangeButtonColor,
                                      maximumSize: Size(260, 100),
                                      minimumSize: Size(260, 100),
                                    ),
                                    onPressed: () {
                                      Get.off(WelcomeScreen());
                                    },
                                    child: Text(
                                      "맞아요!",
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: kGrayButtonColor,
                                      maximumSize: Size(260, 100),
                                      minimumSize: Size(260, 100),
                                    ),
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text(
                                      "아니에요!",
                                      style: TextStyle(
                                          fontSize: 30, color: kDarkFontColor),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 10),
                        alignment: AlignmentDirectional.bottomCenter,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.scaleDown,
                            image: AssetImage('assets/images/playTeacher.png'),
                          ),
                        ),
                        width: 200,
                        height: 200,
                      ),
                      onTap: () {
                        myData.playing = "teacher";
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                titlePadding: EdgeInsets.only(
                                    top: 100, bottom: 60, right: 40, left: 40),
                                contentPadding:
                                    EdgeInsets.only(right: 60, left: 60),
                                actionsPadding: EdgeInsets.only(
                                    top: 60, bottom: 100, right: 60, left: 60),
                                actionsAlignment: MainAxisAlignment.center,
                                title: Text('선생님과 이야기를 하고싶구나',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Godo',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 50,
                                      color: kDarkFontColor,
                                    )),
                                content: SingleChildScrollView(
                                  child: InkWell(
                                    child: Container(
                                      padding: EdgeInsets.only(bottom: 10),
                                      alignment:
                                          AlignmentDirectional.bottomCenter,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: AssetImage(
                                              'assets/images/playTeacher.png'),
                                        ),
                                      ),
                                      width: 400,
                                      height: 400,
                                    ),
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: kOrangeButtonColor,
                                      maximumSize: Size(260, 100),
                                      minimumSize: Size(260, 100),
                                    ),
                                    onPressed: () {
                                      Get.off(WelcomeScreen());
                                    },
                                    child: Text(
                                      "맞아요!",
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: kGrayButtonColor,
                                      maximumSize: Size(260, 100),
                                      minimumSize: Size(260, 100),
                                    ),
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text(
                                      "아니에요!",
                                      style: TextStyle(
                                          fontSize: 30, color: kDarkFontColor),
                                    ),
                                  ),
                                ],
                              );
                            });
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
