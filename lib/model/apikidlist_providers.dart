import 'dart:convert';
import 'package:get/get.dart';
import 'package:vision21tech_smartkiosk/apikidlist.dart';
import 'package:http/http.dart' as http;
import 'package:vision21tech_smartkiosk/screens/network_error.dart';

class ApiKidListProviders{
  Future<KidsList> getKids() async {
    var url = 'http://192.168.219.102:8000/kindergarten/kids';
    final response = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Api-Key GJFQ0dMp.egxBIMx8UDCatVMObiBvqV7PK0dBABQl'})
        .timeout(Duration(seconds: 5));
    if (response.statusCode == 200) {
      print(json.decode(utf8.decode(response.bodyBytes)));
        return KidsList.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      } else {
      throw Exception(Get.to(() => NetworkErrorScreen()));
    }
  }
}