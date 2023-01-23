// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:foodigy/model/order_complete_api_model.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class OrderCompletedApiController extends GetxController {
  OrderCompleteApiModel? orderCompletedApi;

  var isDataLoading = false.obs;
  orderCompletedList({String? orderId}) async {
    try {
      isDataLoading(true);
      
      var response = await http.get(
        Uri.parse(
            'https://itrustorders-mko4ihns5q-el.a.run.app/api/v1/ordermgmt/orders/orderData/${orderId.toString()}'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Authorization": 'Bearer ${auth_token.toString()}',
        },
      );
      print(response.statusCode);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
         print("***************");
       print(response.body);
        var result = jsonDecode(response.body);
        orderCompletedApi = OrderCompleteApiModel.fromJson(result);
        print(orderCompletedApi!.data!.orderId);

   
        //  print(currentUser.runtimeType);
      } else {
        orderCompletedApi=null;
        print(response.body.toString());
      }
    } catch (e) {
      //   print("error");
    } finally {
      isDataLoading(false);
    }
  }

}
