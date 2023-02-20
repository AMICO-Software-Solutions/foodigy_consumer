// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodigy/model/order_product_list_review_model.dart';
import 'package:foodigy/utilities/api_const_value.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class OrderProductListController extends GetxController {
  OrderProductIdListModel? orderProductList;

  var productsList = [];

  Map<String, dynamic> proListCOntroller = {};

  var isDataLoading = false.obs;
  orderProductIdList({List? productIdList, String? bookingDate}) async {
    try {
      isDataLoading(true);
      var response = await http.post(
          Uri.parse(
              '${ApiDomain.apiInventory}/itrustinventory/product/productIdList'),
          headers: {
            'Content-Type': 'application/json',
            "Authorization": 'Bearer ${cToken.toString()}',
          },
          body: jsonEncode(<String, dynamic>{
            "productId": productIdList,
            "orderScheduleDate": bookingDate.toString()
          }));
      //  print(chefId);
      print(response.statusCode);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        // print("***************");
        print(response.body);
        //  List map = [];
        // Map<String, dynamic> map = {};
        //   map = json.decode(response.body);
        //    Map<String, dynamic> token = map["auth_token"];
        var result = jsonDecode(response.body);
        orderProductList = OrderProductIdListModel.fromJson(result);

        print("++++++++++++++++++++");
        print(orderProductList!.data!.inventory!.id.toString());

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

//post Rating
  Future postRatingReview({List<Map<String,dynamic>>? productList, String? orderId}) async {
    var url = Uri.parse("https://itrustorders-mko4ihns5q-el.a.run.app/api/v1/ordermgmt/rating");
    try {
      print('rarting');
      print(productList);
      final responseData = await http.post(url,
          headers: <String, String>{
            "content-type": "application/json",
            "Authorization": 'Bearer ${cToken.toString()}',
          },
          body: jsonEncode(<String, dynamic>{
            "rating": productList,
            "orderId": int.parse(orderId.toString())
          }));
      print(currentUserId);
      print(" address status code is ${responseData.statusCode.toString()}");
      if (responseData.statusCode == 200 ||
          responseData.statusCode == 201 ||
          responseData.statusCode == 202 ||
          responseData.statusCode == 203) {
            print('review added successfully');
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

//post comments
  Future postComments(
      {String? consumerId,
      String? chefId,
      String? comments,
      String? orderId}) async {
    var url = Uri.parse("${ApiDomain.apiDomain}/ordermgmt/comments");
    try {
      final responseData = await http.post(url,
          headers: <String, String>{
            "content-type": "application/json",
            "Authorization": 'Bearer ${cToken.toString()}',
          },
          body: jsonEncode(<String, dynamic>{
            "consumerId": int.parse(consumerId.toString()),
            "chefId": int.parse(chefId.toString()),
            "comments": comments.toString(),
            "productId": 0,
            "orderId": int.parse(orderId.toString()),
            "commentType": "CHEF"
          }));
      print(currentUserId);
      print(" address status code is ${responseData.statusCode.toString()}");
      if (responseData.statusCode == 200 ||
          responseData.statusCode == 201 ||
          responseData.statusCode == 202 ||
          responseData.statusCode == 203) {
       // Get.back();
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
}
