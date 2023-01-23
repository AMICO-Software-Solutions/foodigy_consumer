// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodigy/presentation/home_screens/home.dart';
import 'package:foodigy/utilities/api_const_value.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PasswordController {
  void changePassword({required String password, String? userId}) async {
    // print(currentUserId);
    var url = Uri.parse(
        "${ApiDomain.apiAuth}/itrustauth/user/changePassword/$currentUserId");

    try {
      var response = await http.post(url,
          // body: {"id": datacount.read("id").toString(), "status": "1"}
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            "Authorization": 'Bearer ${auth_token.toString()}',
            'scope': 'users',
            'api_key': 'gUxXfqhrr6xxoWwnz5m4cAtzH24eHIfh',
          },
          body: jsonEncode({"password": password}));

      print(" reponse is ${response.statusCode}");
      //  print("token is ${auth_token.toString()}");

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203 ||
          response.statusCode == 204) {
        print(response.body);
        Get.offAll(Home());
        //  postSession(id: currentUser!.data!.id.toString());

        //   homeRecent = jsonDecode(response.body);
        // print("appoint ment is $appointment");
        // print(map);
        //  isLoading = false;

      } else {
        Fluttertoast.showToast(
            backgroundColor: firstColor,
            msg: "Current user api error",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1);
      }
    } catch (e) {
      //  return null;
      // return addressGetFromJson(data);
      // print(e.toString());
    } finally {
      //   isLoading(false);
    }
  }
}
