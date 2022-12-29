import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';
import '../screens/network_error.dart';

class KidListApi {
  GetStorage storage = GetStorage();
//your http client can be http, http.Client, dio, just bring your methods here and they will work normally :D
  //a quick example, here we are retrieving all posts made available by api(100)
  getAll() async {
    try {
      var url = '${storage.read('url')}/kindergarten/kids';
      var response = await http.get(Uri.parse(url), headers: {
        'Authorization': 'Api-Key ${storage.read('apikey')}'})
          .timeout(Duration(seconds: 7));
      if (response.statusCode == 200) {
        List kidList = jsonDecode(utf8.decode(response.bodyBytes));
        print(kidList);
        return kidList;
      } else {
        Get.to(() => NetworkErrorScreen());
      }
    } catch (_) {
      Get.to(() => NetworkErrorScreen());
    }
  }
  getMigrate() async {
    try {
      var url = '${storage.read('url')}/kindergarten/migrate';
      var response = await http.get(Uri.parse(url), headers: {
        'Authorization': 'Token ${storage.read('Token')}'})
          .timeout(Duration(seconds: 7));
      if (response.statusCode == 200) {
        return AlertDialog(
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
                  backgroundColor: kOrangeButtonColor,
                  maximumSize: Size(100, 60),
                  minimumSize: Size(100, 60),
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
      } else {
        return AlertDialog(
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
              "데이터 마이그레이션에 실패하였습니다.\n오류내용:${response.body}",
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
                  backgroundColor: kOrangeButtonColor,
                  maximumSize: Size(100, 60),
                  minimumSize: Size(100, 60),
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
      }
    } catch (e) {
      print(e);
      return AlertDialog(
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
                backgroundColor: kOrangeButtonColor,
                maximumSize: Size(100, 60),
                minimumSize: Size(100, 60),
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
    }
  }
}