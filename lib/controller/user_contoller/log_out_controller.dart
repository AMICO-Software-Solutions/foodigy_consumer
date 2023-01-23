// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:foodigy/controller/user_contoller/google_login_controller.dart';
import 'package:foodigy/presentation/sign_in/login_screen.dart';
import 'package:foodigy/utilities/api_const_value.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LogOutController extends GetxController {
  var isLoading = false.obs;

  void logOutSession() async {
    var url = Uri.parse(
        "${ApiDomain.apiUser}/itrustusers/session/logout?sessionId=$sessionId");
    try {
      isLoading(true);
      final responseData = await http.patch(
        url,
        headers: {
          "content-type": "application/json",
          "Authorization": 'Bearer ${auth_token.toString()}',
        },
      );
      print(
          "logout session status code is ${responseData.statusCode.toString()}");
      if (responseData.statusCode == 200 ||
          responseData.statusCode == 201 ||
          responseData.statusCode == 202 ||
          responseData.statusCode == 203) {
        print(responseData.body);
        Map<String, dynamic> map = {};
        map = json.decode(responseData.body);
        logOutAuth();
      } else {
        print("error");

        // return null;
      }
    } catch (e) {
      //  return null;
      // return addressGetFromJson(data);
      print('erroer');

      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void logOutAuth() async {
    var url = Uri.parse("${ApiDomain.apiAuth}/itrustauth/auth/logout");
    try {
      isLoading(true);
      final responseData = await http.post(
        url,
        headers: {
          "content-type": "application/json",
          "Authorization": 'Bearer ${auth_token.toString()}',
        },
      );
      print("auth logout status code is ${responseData.statusCode.toString()}");
      if (responseData.statusCode == 200 ||
          responseData.statusCode == 201 ||
          responseData.statusCode == 202 ||
          responseData.statusCode == 203) {
        print(responseData.body);
        print("logout success");
        box.remove('auth_token');
        box.remove('email');
        box.remove('password');
        box.remove('CMS_token');
        currentUserId = '';
        GoogleSignInApi.logout();
        Get.offAll(LoginSCreen());
      } else {
        print("error");

        // return null;
      }
    } catch (e) {
      //  return null;
      // return addressGetFromJson(data);
      print('erroer');

      print(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
