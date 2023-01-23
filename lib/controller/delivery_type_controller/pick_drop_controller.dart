// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:foodigy/presentation/cart_screens.dart/delivery_types/pickdrop_model.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PickDropController extends GetxController {
  // @override
  // void onInit() {
  //   getCartDetails();
  //   super.onInit();
  // }
  // @override
  // void onReady() {
  //   fetchReview();
  //   super.onInit();
  //
  PickDropModel? pickDropList;

  var isDataLoading = false.obs;
  getPickDrop(
      {String? cusLat,
      String? cusLong,
      String? chefLat,
      String? chefLong,
      String? time,
      String? date}) async {
    try {
      isDataLoading(true);
      // print("pickdrop value");
      // print(date);
      // print(time);
    //  String token = box.read('auth_token');
      var response = await http.post(
          Uri.parse(
              'https://foodigy-delivery-mko4ihns5q-el.a.run.app/api/v1/delivery/pickndrop/estimate-cost'),
          headers: {
            "content-type": "application/json",
            "Authorization": 'Bearer $token',
          },
          body: jsonEncode(<String, dynamic>{
            "custLat": double.parse(cusLat.toString()),
            "custLng": double.parse(cusLong.toString()),
            "chefLat": double.parse(chefLat.toString()),
            "chefLng": double.parse(chefLong.toString()),
            "scheduledTime": time,
            "scheduledDate": date
          }));
      print('get cart response${response.statusCode}');
      print(currentUserId);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        var result = jsonDecode(response.body);
          print("++++++++++++++++++++");
        print(result);
        pickDropList = PickDropModel.fromJson(result);
             print("++++++++++++++++++++");

        print(pickDropList!.deliveryCharge.toString());
      } else {
        pickDropList=null;
        print('pickdrop');
        print(response.body.toString());
      }
    } catch (e) {
      //   print("error");
    } finally {
      isDataLoading(false);
    }
  }
}
