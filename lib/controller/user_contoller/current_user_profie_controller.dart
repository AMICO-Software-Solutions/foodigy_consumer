// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodigy/model/active_order_model.dart';
import 'package:foodigy/model/curent_user_profile_model.dart';
import 'package:foodigy/utilities/api_const_value.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CurrentUserProfileController extends GetxController {
  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  void onRedy() {
    getProfile();
    super.onInit();
  }

  CurrentUserProfileModel? currentProfile;
  var isDataLoading = false.obs;
  //current user details API
  Map<String, dynamic> map = {};
  Future getProfile() async {
    try {
      var response = await http.get(
        Uri.parse(
            "${ApiDomain.apiUser}/itrustusers/profile/$currentUserId"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Authorization": 'Bearer ${auth_token.toString()}',
        },
      );
      print(response.statusCode.toString());
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203 ||
          response.statusCode == 204) {
        print('data loading');
        map = json.decode(response.body);

        currentProfile = CurrentUserProfileModel.fromJson(map);
        print('current user is ${currentProfile!.data!.userId}}');
      } else {
   
   print(response.body);
      }
     // return "Success";
    } catch (e) {
      print(e.toString());
    } finally {
      isDataLoading(false);
    }
  }

  var isLoading = false.obs;
  void updateProfile({
    required String profileName,
  }) async {
    var url = Uri.parse(
        "${ApiDomain.apiUser}/itrustusers/profile/$currentUserId");
    try {
      isLoading(true);
      final responseData = await http.patch(url,
          headers: {
            'Content-Type': 'application/json',
            "Authorization": 'Bearer $auth_token',
          },
          body: jsonEncode({"profileName": profileName}));
      print("status code is ${responseData.statusCode.toString()}");
      if (responseData.statusCode == 200 ||
          responseData.statusCode == 201 ||
          responseData.statusCode == 202 ||
          responseData.statusCode == 203) {
        Fluttertoast.showToast(
            backgroundColor: Colors.white,
            textColor: firstColor,
            msg: "Profile updated successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1);
        print(responseData.body);
      } else {
        //  print("error");
        Fluttertoast.showToast(
            backgroundColor: Colors.white,
            textColor: firstColor,
            msg: "Profile update failure",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1);
        return null;
      }
    } catch (e) {
      //  return null;
      // return addressGetFromJson(data);

      print(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
