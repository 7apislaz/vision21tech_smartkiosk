import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';
import 'package:vision21tech_smartkiosk/constants.dart';
import 'package:vision21tech_smartkiosk/screens/height_measurement_screen.dart';
import 'package:vision21tech_smartkiosk/screens/kid_list_screen.dart';
import 'package:vision21tech_smartkiosk/screens/select_bt_device.dart';
import 'package:vision21tech_smartkiosk/screens/welcome_screen.dart';

import '../data/mydata.dart';
import '../module/audio.dart';

class MesuringScreen extends StatefulWidget {
  static String routeName = "/mesuring";
  final BluetoothDevice server;

  const MesuringScreen({required this.server});

  @override
  _MesuringScreenState createState() => _MesuringScreenState();
}
class _Message {
  String text;

  _Message(this.text);
}
class _MesuringScreenState extends State<MesuringScreen> {
  ButtonAudios buttonAudios = ButtonAudios();
  BluetoothConnection? connection;
  final MyData myData = Get.put(MyData(
    kidHeight: '',
    kidWeight: '',
  ));

  List<_Message> messages = List<_Message>.empty(growable: true);
  String _messageBuffer = '';

  bool isConnecting = true;
  bool get isConnected => (connection?.isConnected ?? false);

  bool isDisconnecting = false;
  bool _isHasHeight = false;

  @override
  void initState() {
    super.initState();

    BluetoothConnection.toAddress(widget.server.address).then((_connection) {
      print('Connected to the device');
      connection = _connection;
      setState(() {
        isConnecting = false;
        isDisconnecting = false;
      });
      buttonAudios.playAudio('assets/audios/height_measure.mp3');
      connection!.input!.listen(_onDataReceived).onDone(() {
        // Example: Detect which side closed the connection
        // There should be `isDisconnecting` flag to show are we are (locally)
        // in middle of disconnecting process, should be set before calling
        // `dispose`, `finish` or `close`, which all causes to disconnect.
        // If we except the disconnection, `onDone` should be fired as result.
        // If we didn't except this (no flag set), it means closing by remote.
        if (isDisconnecting) {
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
                      "연결 해제",
                      style: TextStyle(
                        fontFamily: 'Godo',
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                        color: kDarkFontColor,
                      ),
                    ),
                    content: Text(
                      "측정기가 로컬에서 연결이 해제되었습니다.\n다시 연결해주세요.",
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
                          Get.to(() => KidListScreen());
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
          print('Disconnecting locally!');
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
                      "연결 해제",
                      style: TextStyle(
                        fontFamily: 'Godo',
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                        color: kDarkFontColor,
                      ),
                    ),
                    content: Text(
                      "측정기가 원격으로 연결이 해제되었습니다.\n다시 연결해주세요.",
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
                          Get.to(() => KidListScreen());
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
          print('Disconnected remotely!');
        }
        if (this.mounted) {
          setState(() {});
        }
      });
    }).catchError((error) {
      print('Cannot connect, exception occured');
      print(error);
    });
  }

  @override
  void dispose() {
    // Avoid memory leak (`setState` after dispose) and disconnect
    if (isConnected) {
      isDisconnecting = true;
      connection?.dispose();
      connection = null;
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _myda = messages.map((_message) {
      return _message.text.toString();
    }).toList();
    Future.delayed(Duration.zero,() {
      if (_isHasHeight == true) {
        if (_myda.last.length > 3) {
          _myda.sort((a, b) => a.length.compareTo(b.length));
          if (_myda.last.length > 5) {
            final _kidHeight = _myda.last.split(",");
            myData.kidHeight = _kidHeight.last;
            myData.kidWeight = _kidHeight.first;
            _isHasHeight = false;
            _goNext();
          }
        }
      }
    });


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
                child: isConnected?
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("체중계 위에 서서 측정이", textScaleFactor: 3.5,),
                    SizedBox(height: 20),
                    Text("끝날 때까지 기다려 주세요.", textScaleFactor: 3.5,),
                    SizedBox(height: 20),
                    // SizedBox(height: 20),
                  ],
                ): Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("체중계와 연결중입니다.", textScaleFactor: 3.5,),
                    SizedBox(height: 20),
                    Text("잠시 기다려 주세요.", textScaleFactor: 3.5,),
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
  void _goNext() {
    Get.to(() => HeightMeasure(), arguments: [myData.kidWeight, myData.kidHeight]);
  }
  void _onDataReceived(Uint8List data) {
    // Allocate buffer for parsed data
    int backspacesCounter = 0;
    data.forEach((byte) {
      if (byte == 8 || byte == 127) {
        backspacesCounter++;
      }
    });
    Uint8List buffer = Uint8List(data.length - backspacesCounter);
    int bufferIndex = buffer.length;
    // Apply backspace control character
    backspacesCounter = 0;
    for (int i = data.length - 1; i >= 0; i--) {
      if (data[i] == 8 || data[i] == 127) {
        backspacesCounter++;
      } else {
        if (backspacesCounter > 0) {
          backspacesCounter--;
        } else {
          buffer[--bufferIndex] = data[i];
        }
      }
      _isHasHeight = true;
    }

    // Create message if there is new line character
    String dataString = String.fromCharCodes(buffer);
    int index = buffer.indexOf(13);
    if (~index != 0) {
      setState(() {
        messages.add(
          _Message(
            backspacesCounter > 0
                ? _messageBuffer.substring(
                0, _messageBuffer.length - backspacesCounter)
                : _messageBuffer + dataString.substring(0, index),
          ),
        );
        _messageBuffer = dataString.substring(index);
      });
    } else {
      _messageBuffer = (backspacesCounter > 0
          ? _messageBuffer.substring(
          0, _messageBuffer.length - backspacesCounter)
          : _messageBuffer + dataString);
    }
  }
}
