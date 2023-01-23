// ignore_for_file: avoid_print

import 'package:foodigy/utilities/api_const_value.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'dart:convert';
import 'package:foodigy/presentation/location_screens/explore_location_screen.dart';
import 'package:http/http.dart' as http;

class SearchAddressController extends GetxController{

 RxBool isLoading = false.obs;
    void getAddress({
    String? address,
  }) async {
    var url = Uri.parse(
        "${ApiDomain.apiUser}/itrustusers/address/getlatlong");
    try {
     isLoading(true);
      final responseData = await http.post(url,
          headers: {
            "content-type": "application/json",
            //  "Authorization": 'Bearer $token',
          },
          body: jsonEncode({"address": address}));
      print("status code is ${responseData.statusCode.toString()}");
      if (responseData.statusCode == 200 ||
          responseData.statusCode == 201 ||
          responseData.statusCode == 202 ||
          responseData.statusCode == 203) {
        //   print(responseData.body);
        Map<String, dynamic> map = {};
        map = jsonDecode(responseData.body);
        print(map['data']);
        longFoodigy = map['data']['Longitude'];
        latFoodigy = map['data']['Latitude'];
        currentLat = map['data']['Latitude'];
        currentLong = map['data']['Longitude'];
        print(map['data']['Longitude']);
        print(map['data']['Latitude']);
       Get.offAll(ExploreLocationScreen());

        //    Get.offAll(Home());
      } else {
        print(responseData.body);

        return null;
      }
    } catch (e) {
      //  return null;
      // return addressGetFromJson(data);
      // ignore: avoid_print
      print(e.toString());
    } finally {
    isLoading(false);
    }
  }

}