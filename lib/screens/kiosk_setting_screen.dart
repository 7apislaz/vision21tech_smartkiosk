import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vision21tech_smartkiosk/constants.dart';
import 'package:vision21tech_smartkiosk/screens/network_error.dart';
import 'package:vision21tech_smartkiosk/screens/welcome_screen.dart';
import 'camera_error.dart';
import 'data_error.dart';
// import 'package:vision21tech_smartkiosk/module/button.dart';
// import '../constants.dart';

class KioskSettingScreen extends StatefulWidget {
  static String routeName = "/setting";

  @override
  _KioskSettingScreenState createState() => _KioskSettingScreenState();
}

class _KioskSettingScreenState extends State<KioskSettingScreen> {
  String inputText1 = '';
  String inputText2 = '';
  String inputText3 = '';

  final TextEditingController _textController1 = TextEditingController();
  final TextEditingController _textController2 = TextEditingController();
  final TextEditingController _textController3 = TextEditingController();

  FocusNode myFocusNode1 = new FocusNode();
  FocusNode myFocusNode2 = new FocusNode();
  FocusNode myFocusNode3 = new FocusNode();

  final List<String> _portState = ['Port1', 'Port2'];
  String? _myPort1;
  String _port = '';


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
                Get.to(WelcomeScreen());
              },
            ),
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: const EdgeInsets.only(top: 80, left: 80.0, right: 80.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              child: Container(
                                  width: 240,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: kOrangeButtonColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(
                                    child: Text("Server", textScaleFactor: 2, style: TextStyle(color: kWhiteFontColor),),
                                  )
                              ),
                            ),
                            SizedBox(height: 20),
                            InkWell(
                              child: Container(
                                height: 60,
                                // width: 400,
                                child: TextFormField(
                                  focusNode: myFocusNode1,
                                  controller: _textController1,
                                  onChanged: (ipAddText) {
                                    setState(() {
                                      inputText1 = ipAddText;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    labelText: "키오스크 IP 주소",
                                    labelStyle: TextStyle(color: myFocusNode1.hasFocus ? kOrangeButtonColor : kGrayFontColor),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                        BorderSide(width: 1.5, color: kOrangeButtonColor)
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                        BorderSide(width: 1.5, color: kDarkFontColor)
                                    ),
                                    icon: Icon(Icons.lan_outlined, size: 35, color: kOrangeButtonColor,),
                                    suffixIcon: Icon(Icons.send, size: 35, color: kOrangeButtonColor,),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text("키오스크의 IP 주소는 "+"$inputText1"+"입니다.", textScaleFactor: 1.5),
                            SizedBox(height: 20),
                            InkWell(
                              child: Container(
                                  width: 240,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: kOrangeButtonColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(
                                    child: Text("API-KEY 발급", textScaleFactor: 2, style: TextStyle(color: kWhiteFontColor),),
                                  )
                              ),
                            ),
                            SizedBox(height: 20),
                            InkWell(
                              child: Container(
                                height: 60,
                                child: TextFormField(
                                  focusNode: myFocusNode2,
                                  controller: _textController2,
                                  onChanged: (apiKeyText) {
                                    setState(() {
                                      inputText2 = apiKeyText;
                                    });
                                  },
                                  decoration: InputDecoration(
                                      labelText: "측정기 API-KEY",
                                      labelStyle: TextStyle(color: myFocusNode2.hasFocus ? kOrangeButtonColor : kGrayFontColor),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                          borderSide:
                                          BorderSide(width: 1.5, color: kOrangeButtonColor)
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                          borderSide:
                                          BorderSide(width: 1.5, color: kDarkFontColor)
                                      ),
                                    icon: Icon(Icons.straighten, size: 35, color: kOrangeButtonColor,),
                                    suffixIcon: Icon(Icons.send, size: 35, color: kOrangeButtonColor,),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            InkWell(
                              child: Container(
                                height: 60,
                                child: TextFormField(
                                  focusNode: myFocusNode3,
                                  controller: _textController3,
                                  onChanged: (apiLoginText) {
                                    setState(() {
                                      inputText3 = apiLoginText;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    labelText: "RealSensID API-KEY",
                                    labelStyle: TextStyle(color: myFocusNode3.hasFocus ? kOrangeButtonColor : kGrayFontColor),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                          borderSide:
                                          BorderSide(width: 1.5, color: kOrangeButtonColor)
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                          borderSide:
                                          BorderSide(width: 1.5, color: kDarkFontColor)
                                      ),
                                    icon: Icon(Icons.child_care_outlined, size: 35, color: kOrangeButtonColor,),
                                    suffixIcon: Icon(Icons.send, size: 35, color: kOrangeButtonColor,),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            InkWell(
                              child: Container(
                                  width: 240,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: kOrangeButtonColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(
                                    child: Text("측정기 포트 확인", textScaleFactor: 2, style: TextStyle(color: kWhiteFontColor),),
                                  )
                              ),
                            ),
                            SizedBox(height: 20),
                            InkWell(
                              child: Container(
                                height: 60,
                                child: DropdownButtonFormField(
                                  iconSize: 30,
                                  validator: (value) =>
                                    value == null ? "측정기 연결 포트를 선택해주세요!" : null,
                                  value: _myPort1,
                                  hint: Text("측정기 연결 포트를 선택해주세요.", style: TextStyle(fontSize: 15),),
                                  items: _portState.map((value) {
                                    return DropdownMenuItem(
                                        value: value,
                                        child: Text(value, style: TextStyle(color: kDarkFontColor, fontSize: 15),),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      value = _port;
                                    });
                                  },
                                  onSaved: (value) =>
                                    _port = (value! as String?)!,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                          borderSide:
                                          BorderSide(width: 1.5, color: kOrangeButtonColor)
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                          borderSide:
                                          BorderSide(width: 1.5, color: kDarkFontColor)
                                      ),
                                    icon: Icon(Icons.electrical_services_outlined, size: 35, color: kOrangeButtonColor,),
                                    suffixIcon: Icon(Icons.send, size: 35, color: kOrangeButtonColor,),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                    ),
                    Padding(padding: const EdgeInsets.only(top: 40, left: 80.0, right: 80.0, bottom: 80.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("데이터 및 유아 얼굴", textScaleFactor: 2.6,),
                          SizedBox(height: 20),
                          InkWell(
                            onTap: () {
                              Get.to(() => NetworkErrorScreen());
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 20),
                              child: Text("데이터 동기화", textScaleFactor: 2.4, style: TextStyle(color: kGrayFontColor),),
                            ),
                          ),
                          SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                              Get.to(() => DataErrorScreen());
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 20),
                              child: Text("모든 아이 얼굴 갱신", textScaleFactor: 2.4, style: TextStyle(color: kGrayFontColor),),
                            ),
                          ),
                          SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                              Get.to(() => CameraErrorScreen());
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 20),
                              child: Text("아이 얼굴 등록", textScaleFactor: 2.4, style: TextStyle(color: kGrayFontColor),),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text("키오스크 관련", textScaleFactor: 2.6,),
                          SizedBox(height: 20),
                          InkWell(
                            onTap: () {
                              Get.to(() => WelcomeScreen());
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 20),
                              child: Text("어플리케이션 종료", textScaleFactor: 2.4, style: TextStyle(color: kGrayFontColor),),
                            ),
                          ),
                          SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                              Get.to(() => WelcomeScreen());
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 20),
                              child: Text("오픈소스 라이센스", textScaleFactor: 2.4, style: TextStyle(color: kGrayFontColor),),
                            ),
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
     ),
    );
  }

  void _handleSubmitted(String Text) {
  }
}
