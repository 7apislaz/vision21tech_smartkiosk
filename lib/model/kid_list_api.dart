import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../screens/network_error.dart';

class KidListApi {
//your http client can be http, http.Client, dio, just bring your methods here and they will work normally :D
  //a quick example, here we are retrieving all posts made available by api(100)
  getAll() async {
    try {
      var url = 'http://192.168.219.102:8000/kindergarten/kids';
      var response = await http.get(Uri.parse(url), headers: {
        'Authorization': 'Api-Key GJFQ0dMp.egxBIMx8UDCatVMObiBvqV7PK0dBABQl'})
          .timeout(Duration(seconds: 5));
      if (response.statusCode == 200) {
        List kidList = jsonDecode(utf8.decode(response.bodyBytes));
        print(kidList);
        return kidList;
      } else {
        Get.to(() => NetworkErrorScreen());
      }
    } catch (_) {}
  }
}