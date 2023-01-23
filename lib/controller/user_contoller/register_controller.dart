// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodigy/presentation/sign_in/register_confirm_screen.dart';
import 'package:foodigy/utilities/api_const_value.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class RegiterController extends GetxController {
  var isLoading = false.obs;

  var pressedBool = true;
  void changeStatus() {
    pressedBool = !pressedBool;
    print("is bvalaak ${pressedBool.toString()}");
   
    update();
  }

  void registerUser({
    String? username,
    phoneNumber,
    cCode,
    String? email,
    String? password,
    firstname,lastName
  }) async {
    changeStatus();

    var url = Uri.parse(
        "${ApiDomain.apiUser}/itrustusers/users");
    try {
      isLoading(true).obs;
      print(isLoading);
      print('ccode is $cCode');
      var responseData = await http.post(url,
          headers: {
            "content-type": "application/json",
            //  "Authorization": 'Bearer $token',
          },
          body: jsonEncode(<String, dynamic>{
            "userName": email.toString(),
            "password": password,
            "email": email.toString(),
            "firstName": firstname,
            "lastName": lastName,
            "redirectUrl": "https://foodigy-app-mko4ihns5q-el.a.run.app",
            "phoneNumber": cCode + phoneNumber,
            "gender": "Female",
            "dob": "2022-09-09T05:13:07.627Z",
            "userType": "consumer",
            "termsandCondition": true
          }));
      print("status code is ${responseData.statusCode.toString()}");
      if (responseData.statusCode == 200 ||
          responseData.statusCode == 201 ||
          responseData.statusCode == 202 ||
          responseData.statusCode == 203) {
        print(responseData.body);
        // Map<String, dynamic> map = {};
        //  map = json.decode(responseData.body);
        // Map<String, dynamic> token = map["auth_token"];

        //  print(map);
        // print(box.read('auth_token'));
        Get.to(RegisterConfirmScreen());
      } else {
        var ma = json.decode(responseData.body);
        print(ma['message']);
        //  print("error");
        print(responseData.body);
        Fluttertoast.showToast(
            msg: ma['message'],
            backgroundColor: firstColor,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1);
        //   Get.to(RegisterConfirmScreen());
        //   return null;
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'Enter the all feilds',
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: firstColor,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1);
      //  return null;
      // return addressGetFromJson(data);
      print(e.toString());
    } finally {
      pressedBool = true;
      isLoading(false).obs;
    }
    update();
  }


}

