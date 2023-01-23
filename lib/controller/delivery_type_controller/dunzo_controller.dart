// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:foodigy/presentation/cart_screens.dart/delivery_types/dunzo_model.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GetDunzoController extends GetxController {
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
  DunzoModel? dunzoList;

  var isDataLoading = false.obs;
  getDunzo(
      {String? cheflat,
      String? chefLong,
      String? cusLat,
      String? cusLong,
      String? sheduleTime}) async {
    try {
      isDataLoading(true);
     print('sheduled time');
   print(sheduleTime.toString());
      var response = await http.post(
          Uri.parse(
              'https://foodigy-delivery-mko4ihns5q-el.a.run.app/api/v1/delivery/dunzo/estimate-cost'),
          headers: {
            "content-type": "application/json",
            "Authorization": 'Bearer $token',
          },
          body: jsonEncode(<String, dynamic>{
            "custLat": double.parse(cusLat.toString()),
            "custLng": double.parse(cusLong.toString()),
            "chefLat": double.parse(cheflat.toString()),
            "chefLng": double.parse(chefLong.toString()),
            "scheduledTime": int.parse(sheduleTime.toString())
          }));
      print('get cart response${response.statusCode}');
      
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
            print('dunso success');
        var result = jsonDecode(response.body);
      
        dunzoList = DunzoModel.fromJson(result);

        print(dunzoList!.distance.toString());
      } else {
        print('dunzo');
        print(response.body.toString());
      }
    } catch (e) {
      //   print("error");
    } finally {
      isDataLoading(false);
    }
  }
}
