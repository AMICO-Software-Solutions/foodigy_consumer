// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodigy/presentation/cart_screens.dart/cart_home_screen.dart';
import 'package:foodigy/utilities/api_const_value.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:http/http.dart' as http;
import 'package:foodigy/controller/cart_controller/get_cart_list_controller.dart';
import 'package:foodigy/model/cart_details_model.dart';
import 'package:get/get.dart';

class CartCountController extends GetxController {
  GetCartDetailsController cartListController =
      Get.put(GetCartDetailsController());
  // @override
  // void onInit() {
  //   addCart(cartListController.cartList);
  //   super.onInit();
  // }
  // @override
  // void onReady() {
  //   addCart(cartListController.cartList);
  //   super.onReady();
  // }
  // void countReduce(){
  //   if (_counter <= 1) {
  //                           return null;
  //                         } else {
  //                           _counter--;
  //                           totalValue = totalValue - value;
  //                         }
  //                        // print(_counter);

  // }

  RxInt value = 0.obs;
  var totValu = 0.obs;
  RxInt count = 0.obs;
  Future? add(int? addValue) {
    count.value++;
    value = value + addValue!;
    // totValu.value = 0;
    print(value);
    update();
    return null;
  }

  Future? subtract(int? subValue) {
    count.value--;
    value = value - subValue!;
    print(value);
    // totValu.value = 0;
    update();
    return null;
  }
  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  // }

  void countIncrease({
    String? itemCost,
    String? cartDetailsId,
    String? cartId,
    String? quantity,
  }) async {
    valueChoose=null;
    isDeliveryCharge = false;
    selectPayType = null;
    var url =
        Uri.parse("${ApiDomain.apiDomain}/ordermgmt/cart/update-quantity");
    try {
      //  isLoading(true);
      final responseData = await http.post(url,
          headers: {
            "content-type": "application/json",
            "Authorization": 'Bearer $token',
          },
          body: jsonEncode({
            "itemCost": int.parse(itemCost.toString()),
            "cartDetailsId": int.parse(cartDetailsId.toString()),
            "cartId": int.parse(cartId.toString()),
            "quantity": int.parse(quantity.toString())
          }));
      print("status code is ${responseData.statusCode.toString()}");
      if (responseData.statusCode == 200 ||
          responseData.statusCode == 201 ||
          responseData.statusCode == 202 ||
          responseData.statusCode == 203) {
        print(responseData.body);
      } else {
        print(responseData.body);
      
      }
    } catch (e) {
     
      print('erroer');

      print(e.toString());
    } finally {
      //isLoading(false);
    }
  }

  List products = [];
  //Map<String, Map<String, String>> get keys => cart.values;
  Map cart = <String, dynamic>{};
  Future? addCart(CartDetailsModel? cartList, int? va) {
    products.clear();
    // products = [
    for (int i = 0; i < cartList!.data!.cartDetails!.length; i++) {
     
      cart = {
        "cartDetailsId":
            int.parse(cartList.data!.cartDetails![i].cartDetailsId.toString()),
        "cartId": int.parse(cartList.data!.cartDetails![i].cartId.toString()),
        "productId":
            int.parse(cartList.data!.cartDetails![i].itemId.toString()),
        "productName": cartList.data!.cartDetails![i].itemName.toString(),
        "productDescription":
            cartList.data!.cartDetails![i].itemDesc.toString(),
        "productSlug": cartList.data!.cartDetails![i].itemSlug.toString(),
        "quantity": 1,
        "status": true,
        "cost": int.parse(cartList.data!.cartDetails![i].itemCost.toString()),
        "tax": 18,
        "total": int.parse(cartList.data!.cartDetails![i].total.toString()),
        "couponDiscount": 1,
        "currency": "INR"
      };
      products.add(cart);
      print(products);
      // Product(i.toString(), quotationList[i][0], quotationList[i][1],
      //     quotationList[i][2]),
    }
    update();
    // return null;
    // ];
  }
  
  
}
