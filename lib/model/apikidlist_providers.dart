import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:vision21tech_smartkiosk/data/post_emotion.dart';
import 'package:vision21tech_smartkiosk/screens/network_error.dart';
import 'package:vision21tech_smartkiosk/screens/welcome_screen.dart';

class PostKidEmotions{
  GetStorage storage = GetStorage();
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
      var url = '${storage.read('url')}/check/emotions';
      var response = await http.post(Uri.parse(url),
          headers: <String, String> {
          'Content-Type': 'application/json',
          'Authorization': 'Api-Key ${storage.read('apikey')}'},
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