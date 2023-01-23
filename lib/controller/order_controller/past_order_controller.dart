// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:foodigy/model/past_order_model.dart';
import 'package:foodigy/utilities/api_const_value.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class PastOrderController extends GetxController {
  PastOrderModel? pastOrder;

  var isDataLoading = false.obs;
  pastOrderList({String? chefId, List? menuTag, List? nProduct}) async {
    try {
      isDataLoading(true);
      var response = await http.get(
        Uri.parse(
            '${ApiDomain.apiDomain}/ordermgmt/orders/userId?userId=$currentUserId&type=consumer&orderType=others'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Authorization":'Bearer ${auth_token.toString()}',
        },
      );
  //    print(chefId);
   //   print(response.statusCode);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        // print(response.body);
        //  List map = [];
        // Map<String, dynamic> map = {};
        //   map = json.decode(response.body);
        //    Map<String, dynamic> token = map["auth_token"];
        var result = jsonDecode(response.body);
        pastOrder = PastOrderModel.fromJson(result);
      //  print(pastOrder!.data![0].orderStatus);

        //    print("++++++++++++++++++++");
        //  print(chefDetailsList!.data![0].address);
        //  print(chefDetailsList!.data!.length);
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
