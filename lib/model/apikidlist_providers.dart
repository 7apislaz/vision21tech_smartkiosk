import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:vision21tech_smartkiosk/data/post_emotion.dart';
import 'package:vision21tech_smartkiosk/screens/network_error.dart';
import 'package:vision21tech_smartkiosk/screens/welcome_screen.dart';

class PostKidEmotions{
  PostKidEmotions(
      {
        required this.Pemotion,
        required this.Pselected_play,
        required this.Pkey,});

  final String Pemotion;
  final String Pselected_play;
  final String Pkey;

  postEmotionAll() async {
    var body = json.encode(EmotionData(
      emotion: Pemotion,
      selected_play: Pselected_play,
      key: Pkey,
    ));
    try {
      var url = 'http://192.168.219.102:8000/check/emotions';
      var response = await http.post(Uri.parse(url),
          headers: <String, String> {
          'Content-Type': 'application/json',
          'Authorization': 'Api-Key GJFQ0dMp.egxBIMx8UDCatVMObiBvqV7PK0dBABQl'},
          body: body)
          .timeout(Duration(seconds: 5));
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.body);
        Get.off(() => WelcomeScreen());
      } else {
        print(response.body);
        Get.to(() => NetworkErrorScreen());
      }
    } catch (_) {}
  }
}