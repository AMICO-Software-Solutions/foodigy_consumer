// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodigy/model/current_user_model.dart';
import 'package:foodigy/presentation/location_screens/current_location_screen.dart';
import 'package:foodigy/presentation/sign_in/register_confirm_screen.dart';
import 'package:foodigy/service/fcm_services.dart';
import 'package:foodigy/utilities/api_const_value.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:foodigy/utilities/foodigy_const_data.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserLoginController extends GetxController {
  CurrentUserDetailsModel? currentUser;
  var pressedBool = true;
  void changeStatus() {
    pressedBool = !pressedBool;
    // print("is bvalaak ${pressedBool.toString()}");

    update();
  }

  var isLoading = false.obs;
  void postUser(
      {String? username,
      String? password,
      String? type,
      String? api,
      String? scope}) async {
    var url = Uri.parse("${ApiDomain.apiAuth}/itrustauth/auth/login");
    try {
      //  isLoading(true);
      final responseData = await http.post(url,
          headers: {
            "content-type": "application/json",
          },
          body: jsonEncode({
            "username": username,
            "password": password,
            "grant_type": FoodigyConstData.grantType,
            "api_key":FoodigyConstData.apiKey,
            "scope": FoodigyConstData.scopeUser,
          }));
      print("status code is ${responseData.statusCode.toString()}");
      if (responseData.statusCode == 200 ||
          responseData.statusCode == 201 ||
          responseData.statusCode == 202 ||
          responseData.statusCode == 203) {
        print(responseData.body);
        Map<String, dynamic> map = {};
        map = json.decode(responseData.body);
        if (map["errorCode"].toString() == "400") {
          //  print('verification error');
          Fluttertoast.showToast(
              backgroundColor: firstColor,
              msg: map["errorMessage"].toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1);
        } else {
          token = map["auth_token"];
          auth_token = map["auth_token"];
          box.write('auth_token', auth_token);
          box.write('email', username.toString());
          box.write('password', password.toString());
          //   CurrentUserDetailsController().getUserInformationFromApi();
          getRecent();
        }
      } else {
        // print("error");
        Fluttertoast.showToast(
            backgroundColor: firstColor,
            msg: "Please enter correct mail id or password",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1);
        // return null;
      }
    } catch (e) {
      //  return null;
      // return addressGetFromJson(data);
      print('erroer');

      print(e.toString());
    } finally {
      //isLoading(false);
    }
  }

  //current user details API
  Map<String, dynamic> map = {};
  Future getRecent() async {
    var url = Uri.parse("${ApiDomain.apiAuth}/itrustauth/user/me/");

    try {
      isLoading(true);
      var response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Authorization": 'Bearer ${auth_token.toString()}',
          'scope': FoodigyConstData.scopeUser,
          'api_key': FoodigyConstData.apiKey,
        },
      );
      print("token is ${auth_token.toString()}");

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203 ||
          response.statusCode == 204) {
        print('data loading');
        map = json.decode(response.body);
        Map<String, dynamic> data = map["data"];
        currentUserId = data['id'].toString();
        print(data['id']);
        // currentUser = CurrentUserDetailsModel.fromJson(map);
        postSession(id: data['id'].toString());
        print("fcm check");
        FCMServices().postFCMToken();
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

      // print(e.toString());
    } finally {
      //   isLoading(false);
    }
  }
 Map<String, dynamic> mapSession ={};
  Future postSession({
    String? id,
  }) async {
    var url = Uri.parse(
        "${ApiDomain.apiUser}/itrustusers/session/login/$id");

    try {
      isLoading(true);
      final responseData = await http.post(
        url,
        headers: {
          "content-type": "application/json",
          "Authorization": 'Bearer ${auth_token.toString()}',
        },
      );
      //    print("responce is ${responseData.body.toString()}");
      if (responseData.statusCode == 200 ||
          responseData.statusCode == 201 ||
          responseData.statusCode == 202 ||
          responseData.statusCode == 203) {
        // isLoading(false);
        print("Succes session");
        
         mapSession = json.decode(responseData.body);
         print(responseData.body);

        print("session id");
        String session=mapSession["data"]["sessionId"].toString();
        print(session);
        box.write('sessionId',session);
        print(sessionId);
        Get.offAll(CurrentLocationScreen(
          isSearch: false,
        ));
      } else {
        //   print("error");
        Fluttertoast.showToast(
            backgroundColor: firstColor,
            msg: "please enter valid details",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1);
      }
    } catch (e) {
      //  return null;
      // return addressGetFromJson(data);
      // print(e.toString());
    } finally {
      isLoading(false);
    }
  }

//fotgot password

  var isForgotLoading = false.obs;
  Future postForgotPassword({
    required String email,
  }) async {
    var url = Uri.parse("${ApiDomain.apiAuth}/itrustauth/user/forgetPassword");
    try {
      isForgotLoading(true);
      final responseData = await http.post(url,
          headers: {
            "content-type": "application/json",
            "api_key": FoodigyConstData.apiKey,
            "scope": FoodigyConstData.scopeUser,
          },
          body: jsonEncode({
            "redirectUrl":
                "https://foodigy-app-mko4ihns5q-el.a.run.app/auth/newpassword",
            "username": email.toString()
          }));
      print("status code is ${responseData.statusCode.toString()}");
      if (responseData.statusCode == 200 ||
          responseData.statusCode == 201 ||
          responseData.statusCode == 202 ||
          responseData.statusCode == 203) {
        print(responseData.body);

        Get.to(RegisterConfirmScreen());
      } else {
        //  print("error");
        Fluttertoast.showToast(
            backgroundColor: firstColor,
            msg: "Please enter correct mail id or password",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1);
        return null;
      }
    } catch (e) {
      //  return null;
      // return addressGetFromJson(data);
      print(e.toString());
    } finally {
      isForgotLoading(false);
    }
  }
}
