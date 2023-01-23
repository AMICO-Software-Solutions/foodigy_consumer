// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:foodigy/model/coupon_model.dart';
import 'package:foodigy/utilities/api_const_value.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class CouponsController extends GetxController {
  CouponModel? couponModel;
  var isDataLoading = false.obs;
  getCoupons(
      {String? chefId,
      String? consumerId,
      String? orderDate,
      String? cartValue}) async {
    try {
      isDataLoading(true);

      var response = await http.get(
        Uri.parse(
            '${ApiDomain.apiDomain}/ordermgmt/coupons/findCoupon?chefId=$chefId&consumerId=$consumerId&orderDate=$orderDate&cartValue=$cartValue'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Authorization": 'Bearer $auth_token',
        },
      );
       print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("coupons completed");
        print(response.body);
        var result = jsonDecode(response.body);
        couponModel = CouponModel.fromJson(result);

        print(couponModel!.data!.length);
      } else {
        couponModel=null;
        print('error');
        //print(response.body.toString());
      }
    } catch (e) {
      //   print("error");
    } finally {
      isDataLoading(false);
    }
  }
}
