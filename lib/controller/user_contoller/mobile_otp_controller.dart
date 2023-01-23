// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodigy/controller/user_contoller/login_controller.dart';
import 'package:foodigy/model/otp_verification_model.dart';
import 'package:foodigy/presentation/sign_in/otp_screen.dart';
import 'package:foodigy/utilities/api_const_value.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MobileOTPController extends GetxController {
  OtpVerificationCodeModel? otpModel;
  var isLoading = false.obs;
  void mobileOTP({
    String? phoneNumber,
  }) async {
    var url =
        Uri.parse("${ApiDomain.apiAuth}/itrustauth/auth/loginWithPhoneNumber");
    try {
      isLoading(true);

      var responseData = await http.post(url,
          headers: {
            "content-type": "application/json",
          },
          body: jsonEncode(<String, dynamic>{"phonenumber": phoneNumber}));
      print("status code is ${responseData.statusCode.toString()}");
      if (responseData.statusCode == 200 ||
          responseData.statusCode == 201 ||
          responseData.statusCode == 202 ||
          responseData.statusCode == 203) {
        var result = jsonDecode(responseData.body);
        otpModel = OtpVerificationCodeModel.fromJson(result);

        print('otp is');
        print(otpModel!.trxDetails!.otpCode.toString());
        Timer(const Duration(seconds: 1), () {
          Get.to(OtpScreen(
            otpValue: otpModel!.trxDetails!.otpCode.toString(),
            phoneNumber: phoneNumber,
            trxId: otpModel!.trxDetails!.trxId.toString(),
          ));
        });

      } else {
        var ma = json.decode(responseData.body);
        print(responseData.body);
        print(ma["errorMessage"]);

        print(ma["errorMessage"]);
        //  print("error");

        Fluttertoast.showToast(
            msg: "it's not registered",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: firstColor,
            timeInSecForIosWeb: 1);
        //   Get.to(RegisterConfirmScreen());
        //   return null;
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'Error',
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: firstColor,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1);
    } finally {
      isLoading(false);
    }
  }

  void verifyOTP({
    String? otp, String?trxID,
  }) async {
    var url = Uri.parse("${ApiDomain.apiAuth}/itrustauth/auth/verifyOtp");

    try {
      isLoading(true);

      var responseData = await http.post(url,
          headers: {
            "content-type": "application/json",
          },
          body: jsonEncode(
              <String, dynamic>{"otp_code": otp, "trx_id":trxID}));
      print("status code is ${responseData.statusCode.toString()}");
      if (responseData.statusCode == 200 ||
          responseData.statusCode == 201 ||
          responseData.statusCode == 202 ||
          responseData.statusCode == 203) {
      Map<String, dynamic> map = {};
        map = json.decode(responseData.body);
        print('otp is verified');
         token = map["token_details"]["auth_token"];
          auth_token = map["token_details"]["auth_token"];
          box.write('auth_token', auth_token);
        print(map["token_details"]["auth_token"]);
      UserLoginController().getRecent();

      } else {
        var ma = json.decode(responseData.body);
        // print(responseData.body);
        // print(ma["errorMessage"]);
        // print(ma["errorMessage"]);
        Fluttertoast.showToast(
            msg: "otp mismatched",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: firstColor,
            timeInSecForIosWeb: 1);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'Error',
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: firstColor,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1);
    } finally {
      isLoading(false);
    }
  }
}
