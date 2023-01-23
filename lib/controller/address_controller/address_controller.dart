// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodigy/model/current_user_address_model.dart';
import 'package:foodigy/utilities/api_const_value.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GetAddressDetailsController extends GetxController {
  // @override
  // void onInit() {
  //    getAddressDetails() ;
  // //  getCartDetails();
  //   super.onInit();
  // }
  // @override
  // void onReady() {
  //    getAddressDetails() ;
  //  // fetchReview();
  //   super.onInit();
  // }
  CurrentUserAddressModel? addressList;

  //get address

  var isDataLoading = false.obs;
  getAddressDetails() async {
    try {
      isDataLoading(true);
     
      var response = await http.get(
        Uri.parse(
            '${ApiDomain.apiUser}/itrustusers/address/addressData/$currentUserId'),
        headers: {
          //   'Content-Type': 'application/json; charset=UTF-8',
          "Authorization": 'Bearer $token',
        },
      );
    print('get address response${response.statusCode}');
      print(currentUserId);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        var result = jsonDecode(response.body);
        
        addressList = CurrentUserAddressModel.fromJson(result);
        //      print("++++++++++++++++++++");

           print(addressList!.data![1].addressLine1);
      } else {
        print(response.body.toString());
      }
    } catch (e) {
      //   print("error");
    } finally {
      isDataLoading(false);
    }
  }

//post address
  Future postAddress(
      {String? addressLine1,
      String? addressLine2,
      String? city,
      country,
      state,
      String? pincode,
      profileId,
      userId}) async {
    var url = Uri.parse(
        "${ApiDomain.apiUser}/itrustusers/address");
    try {
      print(token);
      final responseData = await http.post(url,
          headers: <String, String>{
            "content-type": "application/json",
            "Authorization": 'Bearer ${token.toString()}',
          },
          body: jsonEncode(<String, dynamic>{
            "addressLine1": addressLine1.toString(),
            "addressLine2": addressLine2.toString(),
            "city": city.toString(),
            "country": country.toString(),
            "isHome": true,
            "isPrimary": true,
            "pincode": int.parse(pincode.toString()),
            "profileId": int.parse(profileId),
            "showAddress": true,
            "state": state,
            //"userId": 391,
            'userId': int.parse(currentUserId)
          }));
      print(currentUserId);
      print(" address status code is ${responseData.statusCode.toString()}");
      if (responseData.statusCode == 200 ||
          responseData.statusCode == 201 ||
          responseData.statusCode == 202 ||
          responseData.statusCode == 203) {
        Get.back();
        print(responseData.body);
      } else {
        print(responseData.body);
        Map<String, dynamic> map = {};
        map = json.decode(responseData.body);
        String errormsg = map["message"];
        Fluttertoast.showToast(
            backgroundColor: firstColor,
            msg: errormsg,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1);
        return null;
      }
    } catch (e) {
      //  return null;
      // return addressGetFromJson(data);
      //  print(e.toString());
    } finally {}
  }



  //delete address
  Future deleteAddress({
    String? addressId,
  }) async {
    var url = Uri.parse(
        "${ApiDomain.apiUser}/itrustusers/address/$addressId");
    try {
      final responseData = await http.delete(
        url,
        headers: <String, String>{
          "content-type": "application/json",
          "Authorization": 'Bearer ${token.toString()}',
        },
      );
  
      print(" address status code is ${responseData.statusCode.toString()}");
      if (responseData.statusCode == 200 ||
          responseData.statusCode == 201 ||
          responseData.statusCode == 202 ||
          responseData.statusCode == 203) {
        print(responseData.body);
        getAddressDetails();
      } else {
        print(responseData.body);

        return null;
      }
    } catch (e) {
      //

    } finally {}
  }

  //update address
  Future updateAddress(
      {String? addressLine1,
      addressId,
      String? addressLine2,
      String? city,
      state,
      country,
      showAddress,
      int? pincode,
      profileId,
      userId}) async {
    var url = Uri.parse(
        "${ApiDomain.apiUser}/itrustusers/address/$addressId");
    try {
      final responseData = await http.patch(url,
          headers: <String, String>{
            "content-type": "application/json",
            "Authorization": 'Bearer ${token.toString()}',
          },
          body: jsonEncode(<String, dynamic>{
            "addressLine1": addressLine1.toString(),
            "addressLine2": addressLine2.toString(),
            "showAddress": true,
            "city": city,
            "state": state,
            "country": country,
            "pincode": pincode,
            'userId': int.parse(currentUserId)
          }));
  
      print(" address status code is ${responseData.statusCode.toString()}");
      if (responseData.statusCode == 200 ||
          responseData.statusCode == 201 ||
          responseData.statusCode == 202 ||
          responseData.statusCode == 203) {
        print(responseData.body);
        Get.back();
      } else {
        print(responseData.body);
        // Fluttertoast.showToast(
        //     msg: "please enter valid details",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.BOTTOM,
        //     timeInSecForIosWeb: 1);
        return null;
      }
    } catch (e) {
      //  return null;
      // return addressGetFromJson(data);
      //  print(e.toString());
    } finally {}
  }
}
