import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vision21tech_smartkiosk/constants.dart';
import 'package:vision21tech_smartkiosk/screens/playing_screen.dart';
import 'package:vision21tech_smartkiosk/screens/welcome_screen.dart';

class KidListScreen extends StatefulWidget {
  static String routeName = "/kidlist";

  @override
  _KidListScreenState createState() => _KidListScreenState();
}

class _KidListScreenState extends State<KidListScreen> {
  final List<String> _items = List.generate(30, (index) => 'Item ${index + 1}');

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
          ),
          body: SafeArea(
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
                itemCount: _items.length,
                itemBuilder: (context, index) => Card(
                  margin: const EdgeInsets.all(6),
                  elevation: 4,
                  child: GridTile(
                    footer: GridTileBar(
                      backgroundColor: kOrangeButtonColor,
                      title: Text('아이 ${_items[index].split(' ')[1]}',
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
                          Get.to(() => PlayingScreen());
                        },
                        child: Container(
                        padding: EdgeInsets.only(bottom: 10),
                        alignment: AlignmentDirectional.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage('assets/images/KioskAndKid.png'),
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
