// ignore_for_file: avoid_print

import 'package:foodigy/model/chef_profile_model.dart';
import 'package:foodigy/utilities/api_const_value.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChefProfileController extends GetxController{


  //   @override
  // void onInit() {
  //   getProfile();
  //   super.onInit();
  // }

 ChefProfileDetailsModel? currentchefProfile;
  var isDataLoading = false.obs;
  //current user details API
  Map<String, dynamic> map = {};
  Future getProfile(String? chefId) async {
    try {
      var response = await http.get(
        Uri.parse(
            "${ApiDomain.apiUser}/itrustusers/profile/$chefId"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          //"Authorization": 'Bearer ${auth_token.toString()}',
        },
      );
      print(response.statusCode.toString());
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203 ||
          response.statusCode == 204) {
        print('data loading');
        map = jsonDecode(response.body);

        currentchefProfile = ChefProfileDetailsModel.fromJson(map);
        print('current chef id  is ${currentchefProfile!.data!.userId.toString()}}');
      } else {
        // Fluttertoast.showToast(
        //     backgroundColor: firstColor,
        //     msg: "Current user api error",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.BOTTOM,
        //     timeInSecForIosWeb: 1);
      }
      return "Success";
    } catch (e) {
      print(e.toString());
    } finally {
      isDataLoading(false);
    }
  }
}