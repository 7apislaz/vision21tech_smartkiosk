import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vision21tech_smartkiosk/constants.dart';
import 'package:vision21tech_smartkiosk/screens/welcome_screen.dart';
import '../data/mydata.dart';
import '../module/audio.dart';
import 'emotion_screen.dart';
import 'package:vision21tech_smartkiosk/model/kid_list_api.dart';

class EmotionKidListScreen extends StatefulWidget {
  static String routeName = "/emotionkidlist";

  @override
  _EmotionKidListScreenState createState() => _EmotionKidListScreenState();
}

class _EmotionKidListScreenState extends State<EmotionKidListScreen> {
  final MyData myData = Get.put(MyData(
    key: '',
  ));
  var kidName = '';
  var kidPic = '';
  List kidsLists = [];
  bool isLoading = true;
  KidListApi apiKidList = KidListApi();
  Future initKids() async {
    kidsLists = await apiKidList.getAll();
  }
  ButtonAudios initAudios = ButtonAudios();
  ButtonAudios buttonAudios = ButtonAudios();
  @override
  void initState() {
    super.initState();
    initKids().then((_) {
      setState(() {
        isLoading = false;
        // initAudios.playAudio("assets/audios/kid_identify.mp3");
      });
    });
  }
  // final List<String> _items = List.generate(30, (index) => 'Item ${index + 1}');

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
                Get.off(() => WelcomeScreen());
              },
            ),
          ),
          body: isLoading ? Center(child: const CircularProgressIndicator(),):
          SafeArea(
            minimum: EdgeInsets.only(top: 60, bottom: 60, right: 60, left: 60),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 6,
                  childAspectRatio: 1 / 1.5,
                ),
                itemCount: kidsLists.length,
                itemBuilder: (context, index) => Card(
                  margin: const EdgeInsets.all(6),
                  elevation: 4,
                  child: GridTile(
                    footer: GridTileBar(
                      backgroundColor: kOrangeButtonColor,
                      title: Text(kidsLists[index]["name"]!,
                        style: TextStyle(
                            fontSize: 20,
                            color: kDarkFontColor,
                            fontFamily: 'Godo',
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,),
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          buttonAudios.playAudio('assets/audios/hello_friend.mp3');
                          kidName = kidsLists[index]["name"]!;
                          kidPic = kidsLists[index]["pic"]!;
                          myData.key = kidsLists[index]["key"];
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
                                  title: Text('$kidName 친구야 안녕!',
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
                                            image: NetworkImage(kidPic),
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
                                        buttonAudios.playAudio('assets/audios/emotion_collect.mp3');
                                        Get.to(() => EmotionScreen(), arguments: [
                                          myData.key,
                                        ]);
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
                                        buttonAudios.playAudio('assets/audios/button_effect.mp3');
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
                        child: Container(
                          padding: EdgeInsets.only(bottom: 10),
                          alignment: AlignmentDirectional.center,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: NetworkImage(kidsLists[index]["pic"]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
