// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:foodigy/model/chef_order_model.dart';
import 'package:foodigy/utilities/api_const_value.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';

class ChefOrderController extends GetxController {
  ChefOrderModel? chefOrder;

  var isDataLoading = false.obs;
  chefOrderList({String? chefId}) async {
    try {
      isDataLoading(true);
      var response = await http.get(
        Uri.parse(
            '${ApiDomain.apiDomain}/ordermgmt/orders/chefConsumerOrderList?providerId=$chefId&consumerId=$currentUserId&orderType=active'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Authorization": 'Bearer $auth_token',
        },
      );
      print(chefId);
      print(response.statusCode);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        // print("***************");
        // print(response.body);
        //  List map = [];
        // Map<String, dynamic> map = {};
        //   map = json.decode(response.body);
        //    Map<String, dynamic> token = map["auth_token"];
        var result = jsonDecode(response.body);
        chefOrder = ChefOrderModel.fromJson(result);

        //    print("++++++++++++++++++++");
        print(chefOrder!.data![0].addressId.toString());

        //  print(popularChefList!.description);

        //  print(currentUser.runtimeType);
      } else {
        print(response.body.toString());
      }
    } catch (e) {
      //   print("error");
    } finally {
      isDataLoading(false);
    }
  }
}
