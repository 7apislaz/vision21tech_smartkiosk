import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:usb_serial/usb_serial.dart';
import 'package:vision21tech_smartkiosk/constants.dart';
import 'package:vision21tech_smartkiosk/data/login_post.dart';
import 'package:vision21tech_smartkiosk/data/post_api_key.dart';
import 'package:vision21tech_smartkiosk/screens/welcome_screen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class KioskSettingScreen extends StatefulWidget {
  static String routeName = "/setting";

  @override
  _KioskSettingScreenState createState() => _KioskSettingScreenState();
}

class _KioskSettingScreenState extends State<KioskSettingScreen> {
  GetStorage storage = GetStorage();
  String inputText1 = '';
  String inputText2 = '';
  String inputText3 = '';

  String _PutUsername = '';
  String _PutPassword = '';

  final TextEditingController _textController1 = TextEditingController();
  final TextEditingController _textController2 = TextEditingController();
  final TextEditingController _textController3 = TextEditingController();
  final TextEditingController _myUsername = TextEditingController();
  final TextEditingController _myPassword = TextEditingController();

  FocusNode myFocusNode1 = new FocusNode();
  FocusNode myFocusNode2 = new FocusNode();
  FocusNode myFocusNode3 = new FocusNode();
  FocusNode myFocusNode4 = new FocusNode();
  FocusNode myFocusNode5 = new FocusNode();

  final List<String> _portState = ["측정기 포트 연결"];
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
              icon: Icon(
                Icons.arrow_back_rounded,
                size: 60,
              ),
              onPressed: () {
                Get.to(WelcomeScreen());
              },
            ),
          ),
          body: SafeArea(
            minimum: EdgeInsets.only(top: 60, bottom: 60),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 80.0, right: 80.0),
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
                                  child: Text(
                                    "Server",
                                    textScaleFactor: 2,
                                    style: TextStyle(color: kWhiteFontColor),
                                  ),
                                )),
                          ),
                          SizedBox(height: 20),
                          InkWell(
                            child: Container(
                              height: 60,
                              // width: 400,
                              child: TextFormField(
                                style: TextStyle(
                                  fontFamily: 'Godo',
                                  fontWeight: FontWeight.normal,
                                ),
                                focusNode: myFocusNode1,
                                controller: _textController1,
                                onChanged: (ipAddText) {
                                  setState(() {
                                    inputText1 = ipAddText;
                                  });
                                },
                                decoration: InputDecoration(
                                  labelText: "새 키오스크 IP 주소",
                                  labelStyle: TextStyle(
                                      fontFamily: 'Godo',
                                      fontWeight: FontWeight.normal,
                                      color: myFocusNode1.hasFocus
                                          ? kOrangeButtonColor
                                          : kGrayFontColor),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                          width: 1.5,
                                          color: kOrangeButtonColor)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                          width: 1.5, color: kDarkFontColor)),
                                  icon: Icon(
                                    Icons.lan_outlined,
                                    size: 35,
                                    color: kOrangeButtonColor,
                                  ),
                                  suffixIcon: IconButton(
                                    color: kOrangeButtonColor,
                                    icon: Icon(
                                      Icons.send,
                                      size: 35,
                                    ),
                                    onPressed: () {
                                      if (inputText1.isEmpty) {
                                        return _ipVail(
                                            "새로운 키오스크 IP 주소를 입력해주세요");
                                      }
                                      _loginIP();
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text("현재 키오스크 IP 주소는 ${storage.read('url')}입니다.",
                              textScaleFactor: 1.5),
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
                                  child: Text(
                                    "API-KEY 발급",
                                    textScaleFactor: 2,
                                    style: TextStyle(color: kWhiteFontColor),
                                  ),
                                )),
                          ),
                          SizedBox(height: 20),
                          /* InkWell(
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
                                  labelStyle: TextStyle(
                                      color: myFocusNode2.hasFocus
                                          ? kOrangeButtonColor
                                          : kGrayFontColor),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                          width: 1.5,
                                          color: kOrangeButtonColor)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                          width: 1.5, color: kDarkFontColor)),
                                  icon: Icon(
                                    Icons.straighten,
                                    size: 35,
                                    color: kOrangeButtonColor,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.send,
                                    size: 35,
                                    color: kOrangeButtonColor,
                                  ),
                                ),
                              ),
                            ),
                          ), */
                          InkWell(
                            child: Container(
                              height: 60,
                              child: TextFormField(
                                style: TextStyle(
                                  fontFamily: 'Godo',
                                  fontWeight: FontWeight.normal,
                                ),
                                focusNode: myFocusNode3,
                                controller: _textController3,
                                onChanged: (apiLoginText) {
                                  setState(() {
                                    inputText3 = apiLoginText;
                                  });
                                },
                                decoration: InputDecoration(
                                  labelText: "아이 데이터 API-KEY 발급",
                                  labelStyle: TextStyle(
                                      fontFamily: 'Godo',
                                      fontWeight: FontWeight.normal,
                                      color: myFocusNode3.hasFocus
                                          ? kOrangeButtonColor
                                          : kGrayFontColor),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                          width: 1.5,
                                          color: kOrangeButtonColor)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                          width: 1.5, color: kDarkFontColor)),
                                  icon: Icon(
                                    Icons.child_care_outlined,
                                    size: 35,
                                    color: kOrangeButtonColor,
                                  ),
                                  suffixIcon: IconButton(
                                    color: kOrangeButtonColor,
                                    icon: Icon(
                                      Icons.send,
                                      size: 35,
                                    ),
                                    onPressed: () async {
                                      if (inputText3.isEmpty) {
                                        return _ipVail(
                                            "새 API-KEY를 발급할 아이디를 입력해주세요.");
                                      }
                                      if (inputText3 ==
                                          storage.read('kgName')) {
                                        return _ipVail("발급받을 아이디가 중복되었습니다.");
                                      }
                                      if (inputText3 !=
                                          storage.read('kgName')) {
                                        return _apiKeyPost();
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "서버에 로그인 후, 위 입력 칸에 새로 발급받을 아이디를 입력해주세요.",
                            textScaleFactor: 1.5,
                          ),
                          SizedBox(height: 10),
                          Text("현재 발급받을 아이디는 ${storage.read('kgName')}입니다.",
                              textScaleFactor: 1.5),
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
                                  child: Text(
                                    "측정기 포트 확인",
                                    textScaleFactor: 2,
                                    style: TextStyle(color: kWhiteFontColor),
                                  ),
                                )),
                          ),
                          SizedBox(height: 20),
                          InkWell(
                            child: Container(
                              height: 60,
                              child: DropdownButtonFormField(
                                iconSize: 30,
                                validator: (value) => value == null
                                    ? "측정기 포트 선택 후 Send 버튼을 눌러주세요."
                                    : null,
                                value: _myPort1,
                                hint: Text(
                                  "측정기 포트 선택 후 Send 버튼을 눌러주세요.",
                                  style: TextStyle(
                                      fontFamily: "Godo",
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15),
                                ),
                                items: _portState.map((value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                          fontFamily: 'Godo',
                                          fontWeight: FontWeight.normal,
                                          color: kDarkFontColor,
                                          fontSize: 15),
                                    ),
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
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                          width: 1.5,
                                          color: kOrangeButtonColor)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                          width: 1.5, color: kDarkFontColor)),
                                  icon: Icon(
                                    Icons.electrical_services_outlined,
                                    size: 35,
                                    color: kOrangeButtonColor,
                                  ),
                                  suffixIcon: IconButton(
                                    color: kOrangeButtonColor,
                                    icon: Icon(
                                      Icons.send,
                                      size: 35,
                                    ),
                                    onPressed: () {
                                      _usbConnect();
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 40, left: 80.0, right: 80.0, bottom: 80.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "데이터 및 서버 통신 관련",
                            textScaleFactor: 2.6,
                          ),
                          SizedBox(height: 20),
                          InkWell(
                            onTap: () {
                              _usbConnect();
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "측정기 포트 연결 확인",
                                textScaleFactor: 2.4,
                                style: TextStyle(color: kGrayFontColor),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          InkWell(
                            onTap: () async {
                              getMigrate();
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "모든 아이 데이터 갱신",
                                textScaleFactor: 2.4,
                                style: TextStyle(color: kGrayFontColor),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                              deleteAll();
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "로컬 데이터 초기화",
                                textScaleFactor: 2.4,
                                style: TextStyle(color: kGrayFontColor),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "키오스크 관련",
                            textScaleFactor: 2.6,
                          ),
                          SizedBox(height: 20),
                          InkWell(
                            onTap: () {
                              SystemNavigator.pop();
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "어플리케이션 종료",
                                textScaleFactor: 2.4,
                                style: TextStyle(color: kGrayFontColor),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                              Get.to(() => WelcomeScreen());
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "오픈소스 라이센스",
                                textScaleFactor: 2.4,
                                style: TextStyle(color: kGrayFontColor),
                              ),
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

  void _ipAddPost() async {
    var body = json.encode(LoginData(
      username: _PutUsername,
      password: _PutPassword,
    ));
    var url = '$inputText1/account/login/';
    try {
      var response = await http
          .post(Uri.parse(url),
              headers: {'Content-Type': 'application/json'}, body: body)
          .timeout(Duration(seconds: 7));
      if (response.statusCode == 202) {
        storage.write('url', inputText1);
        Map<String, dynamic> myToken =
            jsonDecode(utf8.decode(response.bodyBytes));
        String storageToken = myToken['Token'];
        storage.write('Token', storageToken);
        return showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  titlePadding:
                      EdgeInsets.only(top: 30, bottom: 30, right: 30, left: 30),
                  contentPadding: EdgeInsets.only(right: 30, left: 30),
                  actionsPadding:
                      EdgeInsets.only(top: 30, bottom: 30, right: 30, left: 30),
                  title: Text(
                    "로그인에 성공하셨습니다.\n$storageToken\nToken: ${storage.read('Token')}",
                    style: TextStyle(
                      fontFamily: 'Godo',
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: kDarkFontColor,
                    ),
                  ),
                  content: Text(
                    response.body,
                    style: TextStyle(
                      fontFamily: 'Godo',
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: kDarkFontColor,
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        backgroundColor: kOrangeButtonColor,
                        maximumSize: Size(130, 50),
                        minimumSize: Size(130, 50),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "확인",
                        style: TextStyle(
                          color: kDarkFontColor,
                        ),
                      ),
                    ),
                  ]);
            });
      } else {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                  titlePadding:
                      EdgeInsets.only(top: 30, bottom: 30, right: 30, left: 30),
                  contentPadding: EdgeInsets.only(right: 30, left: 30),
                  actionsPadding:
                      EdgeInsets.only(top: 30, bottom: 30, right: 30, left: 30),
                  title: Text("Error"),
                  content: Text(
                    "$url 오류코드 : ${response.statusCode}\n관리자에게 오류코드를 문의하세요.",
                    style: TextStyle(
                      fontFamily: 'Godo',
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: kDarkFontColor,
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        backgroundColor: kOrangeButtonColor,
                        maximumSize: Size(130, 50),
                        minimumSize: Size(130, 50),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "확인",
                        style: TextStyle(
                          color: kDarkFontColor,
                        ),
                      ),
                    ),
                  ]);
            });
      }
    } catch (e) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
                titlePadding:
                    EdgeInsets.only(top: 30, bottom: 30, right: 30, left: 30),
                contentPadding: EdgeInsets.only(right: 30, left: 30),
                actionsPadding:
                    EdgeInsets.only(top: 30, bottom: 30, right: 30, left: 30),
                title: Text("Error"),
                content: Text(
                  "$url 오류내용: $e \n관리자에게 오류코드를 문의하세요.",
                  style: TextStyle(
                    fontFamily: 'Godo',
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: kDarkFontColor,
                  ),
                ),
                actions: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      backgroundColor: kOrangeButtonColor,
                      maximumSize: Size(130, 50),
                      minimumSize: Size(130, 50),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      "확인",
                      style: TextStyle(
                        color: kDarkFontColor,
                      ),
                    ),
                  ),
                ]);
          });
    }
  }

  Future _apiKeyPost() async {
    var body = json.encode(ApiKeyName(
      name: inputText3,
    ));
    var url = '${storage.read('url')}/account/apikey/';
    try {
      var response = await http
          .post(Uri.parse(url),
              headers: {
                'Authorization': 'Token ${storage.read('Token')}',
                'Content-Type': 'application/json'
              },
              body: body)
          .timeout(Duration(seconds: 7));
      if (response.statusCode == 202) {
        return showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  titlePadding:
                  EdgeInsets.only(top: 30, bottom: 30, right: 30, left: 30),
                  contentPadding: EdgeInsets.only(right: 30, left: 30),
                  actionsPadding:
                  EdgeInsets.only(top: 30, bottom: 30, right: 30, left: 30),
                  title: Text("Error"),
                  content: Text(
                    "중복된 이름입니다.\n다른 이름으로 변경해주세요.",
                    style: TextStyle(
                      fontFamily: 'Godo',
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: kDarkFontColor,
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        backgroundColor: kOrangeButtonColor,
                        maximumSize: Size(130, 50),
                        minimumSize: Size(130, 50),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "확인",
                        style: TextStyle(
                          color: kDarkFontColor,
                        ),
                      ),
                    ),
                  ]);
            });
      }
      if (response.statusCode == 200) {
        storage.write('kgName', inputText3);
        Map<String, dynamic> myKey =
            jsonDecode(utf8.decode(response.bodyBytes));
        dynamic storageApiKey = myKey['apikey'];
        storage.write('apikey', storageApiKey);
        return showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  titlePadding:
                      EdgeInsets.only(top: 30, bottom: 30, right: 30, left: 30),
                  contentPadding: EdgeInsets.only(right: 30, left: 30),
                  actionsPadding:
                      EdgeInsets.only(top: 30, bottom: 30, right: 30, left: 30),
                  title: Text(
                    "로그인에 성공하셨습니다.",
                    style: TextStyle(
                      fontFamily: 'Godo',
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: kDarkFontColor,
                    ),
                  ),
                  content: Text(
                    "ApiKey: ${storage.read('apikey')}",
                    style: TextStyle(
                      fontFamily: 'Godo',
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: kDarkFontColor,
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        backgroundColor: kOrangeButtonColor,
                        maximumSize: Size(130, 50),
                        minimumSize: Size(130, 50),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "확인",
                        style: TextStyle(
                          color: kDarkFontColor,
                        ),
                      ),
                    ),
                  ]);
            });
      }
    } catch (e) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                titlePadding:
                    EdgeInsets.only(top: 30, bottom: 30, right: 30, left: 30),
                contentPadding: EdgeInsets.only(right: 30, left: 30),
                actionsPadding:
                    EdgeInsets.only(top: 30, bottom: 30, right: 30, left: 30),
                title: Text("Error"),
                content: Text(
                  "$url 오류내용: $e \n관리자에게 오류코드를 문의하세요.",
                  style: TextStyle(
                    fontFamily: 'Godo',
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: kDarkFontColor,
                  ),
                ),
                actions: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      backgroundColor: kOrangeButtonColor,
                      maximumSize: Size(130, 50),
                      minimumSize: Size(130, 50),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      "확인",
                      style: TextStyle(
                        color: kDarkFontColor,
                      ),
                    ),
                  ),
                ]);
          });
    }
  }

  void _loginIP() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            titlePadding:
                EdgeInsets.only(top: 60, bottom: 40, right: 60, left: 60),
            contentPadding: EdgeInsets.only(right: 60, left: 60),
            actionsPadding:
                EdgeInsets.only(top: 40, bottom: 60, right: 60, left: 60),
            actionsAlignment: MainAxisAlignment.center,
            title: Text('키오스크 서버 로그인',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Godo',
                  fontWeight: FontWeight.normal,
                  fontSize: 30,
                  color: kDarkFontColor,
                )),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  child: Container(
                    height: 60,
                    child: TextFormField(
                      style: TextStyle(
                        fontFamily: 'Godo',
                        fontWeight: FontWeight.normal,
                      ),
                      focusNode: myFocusNode4,
                      controller: _myUsername,
                      onChanged: (username) {
                        setState(() {
                          _PutUsername = username;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: "아이디를 입력해주세요.",
                        labelStyle: TextStyle(
                            fontFamily: 'Godo',
                            fontWeight: FontWeight.normal,
                            color: myFocusNode4.hasFocus
                                ? kOrangeButtonColor
                                : kGrayFontColor),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                width: 1.5, color: kOrangeButtonColor)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(width: 1.5, color: kDarkFontColor)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  child: SizedBox(
                    height: 60,
                    child: TextFormField(
                      style: TextStyle(
                        fontFamily: 'Godo',
                        fontWeight: FontWeight.normal,
                      ),
                      focusNode: myFocusNode5,
                      controller: _myPassword,
                      onChanged: (password) {
                        setState(() {
                          _PutPassword = password;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: "비밀번호를 입력해주세요.",
                        labelStyle: TextStyle(
                            fontFamily: 'Godo',
                            fontWeight: FontWeight.normal,
                            color: myFocusNode5.hasFocus
                                ? kOrangeButtonColor
                                : kGrayFontColor),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                width: 1.5, color: kOrangeButtonColor)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(width: 1.5, color: kDarkFontColor)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  backgroundColor: kOrangeButtonColor,
                  maximumSize: Size(130, 50),
                  minimumSize: Size(130, 50),
                ),
                onPressed: () {
                  _ipAddPost();
                  Get.to(() => KioskSettingScreen());
                },
                child: Text(
                  "로그인",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  backgroundColor: kGrayButtonColor,
                  maximumSize: Size(130, 50),
                  minimumSize: Size(130, 50),
                ),
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  "뒤로가기",
                  style: TextStyle(fontSize: 20, color: kDarkFontColor),
                ),
              ),
            ],
          );
        });
  }

  void _usbConnect() async {
    List<UsbDevice> devices = await UsbSerial.listDevices();
    print(devices);
    UsbPort? port;
    if (devices.length == 0) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                titlePadding:
                    EdgeInsets.only(top: 30, bottom: 30, right: 30, left: 30),
                contentPadding: EdgeInsets.only(right: 30, left: 30),
                actionsPadding:
                    EdgeInsets.only(top: 30, bottom: 30, right: 30, left: 30),
                title: Text("Error"),
                content: Text(
                  "측정기 연결을 확인해주세요.",
                  style: TextStyle(
                    fontFamily: 'Godo',
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: kDarkFontColor,
                  ),
                ),
                actions: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      backgroundColor: kOrangeButtonColor,
                      maximumSize: Size(130, 50),
                      minimumSize: Size(130, 50),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      "확인",
                      style: TextStyle(
                        color: kDarkFontColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ]);
          });
    }
    port = await devices[0].create();
    bool? openResult = await port?.open();
    if (!openResult!) {
      print("Failed to open");
      return;
    }
    await port?.setDTR(true);
    await port?.setRTS(true);
    port?.setPortParameters(
        9600, UsbPort.DATABITS_8, UsbPort.STOPBITS_1, UsbPort.PARITY_NONE);
  }

  void _ipVail(myError) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              titlePadding:
                  EdgeInsets.only(top: 30, bottom: 30, right: 30, left: 30),
              contentPadding: EdgeInsets.only(right: 30, left: 30),
              actionsPadding:
                  EdgeInsets.only(top: 30, bottom: 30, right: 30, left: 30),
              title: Text("Error"),
              content: Text(
                myError,
                style: TextStyle(
                  fontFamily: 'Godo',
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                  color: kDarkFontColor,
                ),
              ),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    backgroundColor: kOrangeButtonColor,
                    maximumSize: Size(130, 50),
                    minimumSize: Size(130, 50),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    "확인",
                    style: TextStyle(
                      color: kDarkFontColor,
                      fontSize: 20,
                    ),
                  ),
                ),
              ]);
        });
  }

  void getMigrate() async {
    try {
      var url = '${storage.read('url')}/kindergarten/migrate';
      var response = await http.get(Uri.parse(url), headers: {
        'Authorization': 'Token ${storage.read('Token')}'
      }).timeout(Duration(seconds: 7));
      dynamic body = jsonDecode(utf8.decode(response.bodyBytes));
      if (response.statusCode == 200) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  titlePadding:
                      EdgeInsets.only(top: 30, bottom: 30, right: 30, left: 30),
                  contentPadding: EdgeInsets.only(right: 30, left: 30),
                  actionsPadding:
                      EdgeInsets.only(top: 30, bottom: 30, right: 30, left: 30),
                  title: Text(
                    "Success",
                    style: TextStyle(
                      fontFamily: 'Godo',
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: kDarkFontColor,
                    ),
                  ),
                  content: Text(
                    "데이터 마이그레이션에 성공하였습니다.",
                    style: TextStyle(
                      fontFamily: 'Godo',
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: kDarkFontColor,
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        backgroundColor: kOrangeButtonColor,
                        maximumSize: Size(130, 50),
                        minimumSize: Size(130, 50),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "확인",
                        style: TextStyle(
                          color: kDarkFontColor,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ]);
            });
      } else {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  titlePadding:
                      EdgeInsets.only(top: 30, bottom: 30, right: 30, left: 30),
                  contentPadding: EdgeInsets.only(right: 30, left: 30),
                  actionsPadding:
                      EdgeInsets.only(top: 30, bottom: 30, right: 30, left: 30),
                  title: Text(
                    "Error",
                    style: TextStyle(
                      fontFamily: 'Godo',
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: kDarkFontColor,
                    ),
                  ),
                  content: Text(
                    "데이터 마이그레이션에 실패하였습니다.\n오류내용: $body",
                    style: TextStyle(
                      fontFamily: 'Godo',
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: kDarkFontColor,
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        backgroundColor: kOrangeButtonColor,
                        maximumSize: Size(130, 50),
                        minimumSize: Size(130, 50),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "확인",
                        style: TextStyle(
                          color: kDarkFontColor,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ]);
            });
      }
    } catch (e) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                titlePadding:
                    EdgeInsets.only(top: 30, bottom: 30, right: 30, left: 30),
                contentPadding: EdgeInsets.only(right: 30, left: 30),
                actionsPadding:
                    EdgeInsets.only(top: 30, bottom: 30, right: 30, left: 30),
                title: Text(
                  "Error",
                  style: TextStyle(
                    fontFamily: 'Godo',
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: kDarkFontColor,
                  ),
                ),
                content: Text(
                  "데이터 마이그레이션에 실패하였습니다.\n오류내용: $e",
                  style: TextStyle(
                    fontFamily: 'Godo',
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: kDarkFontColor,
                  ),
                ),
                actions: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      backgroundColor: kOrangeButtonColor,
                      maximumSize: Size(130, 50),
                      minimumSize: Size(130, 50),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      "확인",
                      style: TextStyle(
                        color: kDarkFontColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ]);
          });
    }
  }

  void deleteAll() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              titlePadding:
                  EdgeInsets.only(top: 30, bottom: 30, right: 30, left: 30),
              contentPadding: EdgeInsets.only(right: 30, left: 30),
              actionsPadding:
                  EdgeInsets.only(top: 30, bottom: 30, right: 30, left: 30),
              title: Text(
                "초기화 알림",
                style: TextStyle(
                  fontFamily: 'Godo',
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                  color: kDarkFontColor,
                ),
              ),
              content: Text(
                "스토리지에 저장된 모든 데이터가 사라집니다.\n정말 데이터를 초기화하시겠습니까?",
                style: TextStyle(
                  fontFamily: 'Godo',
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                  color: kDarkFontColor,
                ),
              ),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    backgroundColor: Colors.redAccent,
                    maximumSize: Size(130, 50),
                    minimumSize: Size(130, 50),
                  ),
                  onPressed: () {
                    storage.erase();
                    Get.off(() => WelcomeScreen());
                  },
                  child: Text(
                    "초기화",
                    style: TextStyle(
                      color: kWhiteFontColor,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    backgroundColor: kGrayButtonColor,
                    maximumSize: Size(130, 50),
                    minimumSize: Size(130, 50),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    "뒤로가기",
                    style: TextStyle(
                      color: kDarkFontColor,
                      fontSize: 20,
                    ),
                  ),
                ),
              ]);
        });
  }
}
