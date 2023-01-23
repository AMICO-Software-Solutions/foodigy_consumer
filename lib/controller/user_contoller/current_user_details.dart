// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:foodigy/model/current_user_model.dart';
import 'package:foodigy/utilities/api_const_value.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CurrentUserDetails extends GetxController {
  @override
  void onInit() {
    getRecent();
    super.onInit();
  }

  CurrentUserDetailsModel? currentUser;
  //current user details API
  Map<String, dynamic> map = {};
  Future getRecent() async {
    var response = await http.get(
      Uri.parse("${ApiDomain.apiAuth}/itrustauth/user/me/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": 'Bearer ${auth_token.toString()}',
        'scope': 'users',
        'api_key': 'gUxXfqhrr6xxoWwnz5m4cAtzH24eHIfh',
      },
    );
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202 ||
        response.statusCode == 203 ||
        response.statusCode == 204) {
      print('data loading');
      map = json.decode(response.body);

      currentUser = CurrentUserDetailsModel.fromJson(map);
      print('current user is ${currentUser!.data!.id.toString()}}');
    } else {
      // Fluttertoast.showToast(
      //     backgroundColor: firstColor,
      //     msg: "Current user api error",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     timeInSecForIosWeb: 1);
    }
    return "Success";
  }
}
