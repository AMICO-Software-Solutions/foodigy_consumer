// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'package:foodigy/controller/tokens.dart';
import 'package:foodigy/presentation/sign_in/google_signup_screen.dart';
import 'package:foodigy/utilities/api_const_value.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodigy/presentation/location_screens/current_location_screen.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLoginController extends GetxController {
  GoogleSignInAccount? currentUserGoogle;
//google authentication
var isLoading = false.obs;
//step 1
  registerWithGoogle() async {
    // ignore: no_leading_underscores_for_local_identifiers
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    _googleSignIn.signIn().then((value) {
      if (value != null) {
        value.authentication.then((value) {});
      }
    });
    currentUserGoogle = await _googleSignIn.signIn();
    TokenGeneretor().postClientId();
    if (currentUserGoogle != null) {
       isLoading(true);
      GoogleSignInAuthentication currentUserAuth =
          await currentUserGoogle!.authentication;
     //// print("current user list ${currentUserAuth.accessToken}");
      //// print("email ${currentUserGoogle!.email}");
      //// print("id is ${currentUserGoogle!.id.toString()}");
      //// print("id is ${currentUserGoogle!.photoUrl.toString()}");
      Timer(const Duration(seconds: 1), () {
        print('google veriication success');
        postGoogleApiRegister(
            username: currentUserGoogle!.email,
            email: currentUserGoogle!.email,
            pName: currentUserGoogle!.displayName,
            id: currentUserGoogle!.id,
            image: currentUserGoogle!.photoUrl);
      });
      ////  Get.offAll(CurrentLocationScreen());
      ////   Get.offAllNamed(HomePage.routeName);
    }
  }

  //user/registerUser
  // step 2
  Future postGoogleApiRegister({
    String? username,
    String? email,
    image,
    pName,
    id,
    String? type,
  }) async {
    var url =
        Uri.parse("${ApiDomain.apiAuth}/itrustauth/user/loginGoogleMobile");
    try {       
      final responseData = await http.post(url,
          headers: {
            "content-type": "application/json",
            "Authorization": 'Bearer $googleClientToken',
            "scope": "subscription"
          },
          body: jsonEncode({
            "api_key": "gUxXfqhrr6xxoWwnz5m4cAtzH24eHIfh",
            "username": email,
            "email": email,
            "password": "Test@1234",
            "displayName": email,
            "id": id,
            "provider": "Mobile[Flutter]",
            "picture": image
          }));
      print(" login google mobile  api status code is ${responseData.statusCode.toString()}");
      if (responseData.statusCode == 200 ||
          responseData.statusCode == 201 ||
          responseData.statusCode == 202 ||
          responseData.statusCode == 203) {
        print(responseData.body);

        Map<String, dynamic> map = {};
        map = json.decode(responseData.body);
        //   Map<String, dynamic> token = map["auth_token"];
        auth_token = map["auth_token"];
        token = map["auth_token"];
        print(auth_token);
        box.write('auth_token', auth_token);

        //  box.write('email', username.toString());
        //   box.write('password', 'Test@1234');
        print('Auth token is');
        print(auth_token);
        googleTokenCheck();

        // Get.offAll(CurrentLocationScreen(
        //   isSearch: false,
        // ));
        //     getRecent();
      } else {
        print("error");
        //print(responseData.body);
        // postUser(username: username, password: "Test@1234");
        // UserLoginController()
        //     .postUser(username: "nishdigit428@gmail.com", password: "Test@1234");

        return null;
      }
    } catch (e) {
      //  return null;
      // return addressGetFromJson(data);

      print(e.toString());
    } finally {
      Timer(const Duration(seconds: 2), (){
          isLoading(false);

      });


    
    }
  }

//after mobile_google_login

//step 3
  Future googleTokenCheck() async {
    var url = Uri.parse(
        "${ApiDomain.apiUser}/itrustusers/users/googleSignup");
    try {
      //  isLoading(true);
      final responseData = await http.post(url,
          headers: {
            "content-type": "application/json",
            "Authorization": 'Bearer $auth_token',
            //    "scope": "subscription"
          },
          body: jsonEncode({}));
      print("google signup token check status code is ${responseData.statusCode.toString()}");
      if (responseData.statusCode == 200|| responseData.statusCode==201||responseData.statusCode==202|| responseData.statusCode==203||responseData.statusCode==204 ) {
        getGoogleSigupUpdate();
        print(responseData.body);
      } else {
        getRecent();
        //  print("error");
        //  print(responseData.body);
        Map<String, dynamic> map = {};
        map = json.decode(responseData.body);
        if (map["message"].toString() == "User Already Exists") {
          print("created already");
          getRecent();
        } else {
          print("error");
        }

        return null;
      }
    } catch (e) {
      //  return null;
      // return addressGetFromJson(data);

      print(e.toString());
    } finally {
      //isLoading(false);
    }
  }

//current user details  use google signupupdate API
  Map<String, dynamic> map = {};
  Future getGoogleSigupUpdate() async {
    var url = Uri.parse("${ApiDomain.apiAuth}/itrustauth/user/me/");

    try {
      // isLoading(true);
      var response = await http.get(
        url,
        // body: {"id": datacount.read("id").toString(), "status": "1"}
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Authorization": 'Bearer ${auth_token.toString()}',
          'scope': 'users',
          'api_key': 'gUxXfqhrr6xxoWwnz5m4cAtzH24eHIfh',
        },
      );
      // print(" reponse is ${response.statusCode}");
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
        Get.to(GoogleSignUpScreen(
          id: data['id'].toString(),
        ));
        //  postGoogleUpdate(id: currentUserId.toString());
      } else {
        print(response.body);
      }
    } catch (e) {
      print(e);
    } finally {
      //   isLoading(false);
    }
  }

  //current user details API
  //Map<String, dynamic> map = {};
  Future getRecent() async {
    var url = Uri.parse("${ApiDomain.apiAuth}/itrustauth/user/me/");

    try {
      // isLoading(true);
      var response = await http.get(
        url,
        // body: {"id": datacount.read("id").toString(), "status": "1"}
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Authorization": 'Bearer ${auth_token.toString()}',
          'scope': 'users',
          'api_key': 'gUxXfqhrr6xxoWwnz5m4cAtzH24eHIfh',
        },
      );
     print("already login reponse is ${response.statusCode}");
      //print("token is ${auth_token.toString()}");

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
        postSession(id: currentUserId);
        // Get.to(GoogleSignUpScreen(
        //   id: data['id'].toString(),
        // ));
        //   postGoogle(id: data['id'].toString());
      } else {
        print(response.body);
      }
    } catch (e) {
      print(e);
    } finally {
      //   isLoading(false);
    }
  }
  //session
 Map<String, dynamic> mapSession ={};
  Future postSession({
    String? id,
  }) async {
    var url = Uri.parse(
        "${ApiDomain.apiUser}/itrustusers/session/login/$id");

    try {
      //    isLoading(true);
      final responseData = await http.post(
        url,
        headers: {
          "content-type": "application/json",
          "Authorization": 'Bearer ${auth_token.toString()}',
        },
      );
      // print("status code is ${responseData.statusCode.toString()}");
      //    print("responce is ${responseData.body.toString()}");
      if (responseData.statusCode == 200 ||
          responseData.statusCode == 201 ||
          responseData.statusCode == 202 ||
          responseData.statusCode == 203) {
        // isLoading(false);
        print("Succes session");
         mapSession = json.decode(responseData.body);
        String session=mapSession["data"]["sessionId"].toString();
       //// print(session);
        box.write('sessionId',session);
       //// print(sessionId);
        Get.offAll(CurrentLocationScreen(
          isSearch: false,
        ));
      } else {
        print(responseData.body);
      }
    } catch (e) {
      print(e);
    } finally {
      //  isLoading(false);
    }
  }

  Future postGoogleUpdate({String? id, String? phone, gender, userType}) async {
    var url = Uri.parse(
        "${ApiDomain.apiUser}/itrustusers/users/googleSignupUpdate/$id");

    try {
      // isLoading(true);
      var response = await http.patch(url,
          // body: {"id": datacount.read("id").toString(), "status": "1"}
          headers: <String, String>{
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          },
          body: jsonEncode(<String, dynamic>{
            "phoneNumber": phone,
            "gender": gender,
            "userType": userType,
            "termsandCondition": true
          }));
      print(" reponse is ${response.statusCode}");

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203 ||
          response.statusCode == 204) {
        print('data loading');
        map = json.decode(response.body);
        Get.to(CurrentLocationScreen(
          isSearch: false,
        ));
      } else {
        print(response.body);
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

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
  static Future logout() => _googleSignIn.disconnect();
}
