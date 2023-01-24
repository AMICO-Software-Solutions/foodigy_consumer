// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodigy/model/cart_details_model.dart';
import 'package:foodigy/presentation/cart_screens.dart/cart_home_screen.dart';
import 'package:foodigy/routes/navigate_routes.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/api_const_value.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class GetCartDetailsController extends GetxController {
  // @override
  // void onInit() {
  //   getCartDetails('');
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   getCartDetails('');
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //    getCartDetails('');
  //   super.onClose();
  // }
  // @override
  // void onReady() {
  //   fetchReview();
  //   super.onInit();

  CartDetailsModel? cartList;

  var isDataLoading = false.obs;
  getCartDetails(String? uId) async {
    try {
      isDataLoading(true);
      var response = await http.get(
        Uri.parse('${ApiDomain.apiDomain}/ordermgmt/cart/$currentUserId'),
        headers: {
          //   'Content-Type': 'application/json; charset=UTF-8',
          "Authorization": 'Bearer $token',
        },
      );
    print('get cart response${response.statusCode}');
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        var result = jsonDecode(response.body);
       // print(result);

       // cartList =  result['data'] == null ? null : CartDetailsModel.fromJson(result);
        cartList =  result['data'] == null ? null : CartDetailsModel.fromJson(result);

        print(cartList!.data!.cartId);
      } else {
        print(response.body.toString());
      }
    } catch (e) {
      //   print("error");
    } finally {
      isDataLoading(false);
    }
  }

  Future loadingIndicator()async{
    try{
       isDataLoading(true);
       

    }catch(e){
      print(e);

    }finally{
       isDataLoading(false);

    }

  }

  void navigateAndRefresh(BuildContext context) async {
    final result = await Get.to(() => CartHomeScreen());
    if (result != null) {
      getCartDetails('');
      //model.getEMR(''); // call your own function here to refresh screen
    }
  }

  // create cart
  Future createCart(
      {List? customize,
      int? id,
      String? tenantId,
      String? orderCutOfTime,
      itemId,
      providerId,
      String? pName,
      itemCount,
      pCost,
      pSlug,
      pTiming,
      pAvaiTiming,
      iName,
      pAtiming,
      currency,
      itemdec,
      iSlug,
      BuildContext? context}) async {
    var url = Uri.parse("${ApiDomain.apiDomain}/ordermgmt/cart/create");
    try {
      // String token = box.read('auth_token');
      //  isLoading(true);
      final responseData = await http.post(url,
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            "Authorization": 'Bearer $token',
          },
          body: jsonEncode(<String, dynamic>{
            "userId": id,
            "tenantId": 1,
            "profileName": pName,
            "profileSlug": pSlug,
            "cartDetails": [
              {
                //item avalaible erro chnage string to int its wordked
                "itemId": int.parse(itemId.toString()),
                "productTiming": pTiming,
                "providerId": providerId,
                "itemCost": int.parse(pCost.toString()),
                "itemName": iName,
                "currency": currency,
                "productAvailableTime": pAvaiTiming,
                "orderCutOffTime": orderCutOfTime,
                "itemDesc": itemdec,
                "itemSlug": iSlug,
                "quantity": int.parse(itemCount.toString()),
                "customization": {
                  "customization": {"custom": customize}
                }
              }
            ]
          }));
      //     print("status code is ${responseData.statusCode.toString()}");
      if (responseData.statusCode == 200 ||
          responseData.statusCode == 201 ||
          responseData.statusCode == 202 ||
          responseData.statusCode == 203) {
        print("cart created sucessfully");
     //   navigateAndRefresh(context!);
    // Navigator.push(context!,MaterialPageRoute(builder: (context) => CartHomeScreen()));
    Get.off(()=>CartHomeScreen());

        //  print(responseData.body);
      //   Get.toNamed(AppRoutes.cartHomeScreen);
     //  Get.to(CartHomeScreen());
        //  Get.to(() => CartHomeScreen(
        //   uId: id.toString(),
        // ));
        // Get.to(CartHomeScreen(
        //   uId: id.toString(),
        // ));
        //  Map<String, dynamic> map = {};
        //  map = json.decode(responseData.body);
        // Map<String, dynamic> token = map["auth_token"];

      } else {
        // getCartDetails("");
        //   Fluttertoast.showToast(
        //     backgroundColor: firstColor,
        //     msg: "already created",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.BOTTOM,
        //     timeInSecForIosWeb: 1);
        // addCartItem(
        //     customize: customize,
        //     id: int.parse(currentUserId),
        //     //  id: int.parse('391'),
        //     providerId: providerId,
        //     itemId: int.parse(itemId.toString()),
        //     iName: iName,
        //     itemCount: int.parse(itemCount.toString()),
        //     currency: currency,
        //     itemdec: itemdec,
        //     iSlug: iSlug,
        //     pTiming: pTiming,
        //     proCost: int.parse(pCost.toString()),
        //     orderCutOfTime: orderCutOfTime,
        //     pAvaiTiming: pAvaiTiming,
        //     cartId: cartList!.data!.cartId);
        // Fluttertoast.showToast(
        //     backgroundColor: firstColor,
        //     msg: "already created",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.BOTTOM,
        //     timeInSecForIosWeb: 1);
        print(responseData.body);

        //  return null;
      }
    } catch (e) {
      //  return null;
      // return addressGetFromJson(data);
      print(e.toString());
    } finally {
      // isLoading(false);
      //  print(isLoading);
    }
  }

  //add add to cart
  Future addCartItem(
      {int? id,
      List? customize,
      cartId,
      providerId,
      proCost,
      itemId,
      String? orderCutOfTime,
      String? tenantId,
      String? pName,
      itemCount,
      pSlug,
      pTiming,
      pAvaiTiming,
      iName,
      currency,
      itemdec,
      iSlug,
      BuildContext? context}) async {
    var url = Uri.parse("${ApiDomain.apiDomain}/ordermgmt/cart/add");
    try {
      //  String token = box.read('auth_token');
      final responseData = await http.post(url,
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            "Authorization": 'Bearer $token',
          },
          body: jsonEncode(<String, dynamic>{
            "itemId": itemId,
            "providerId": providerId,
            "itemCost": proCost,
            'orderCutOffTime': orderCutOfTime,
            "itemName": iName,
            "currency": currency,
            "itemDesc": itemdec,
            "itemSlug": iSlug,
            "productTiming": pTiming,
            "productAvailableTime": pAvaiTiming,
            "quantity": int.parse(itemCount.toString()),
            "cartId": int.parse(cartId),
            // "cartId": cartId,
            "customization": {
              "customization": {"custom": customize}
            }
          }));

      print("status code is ${responseData.statusCode.toString()}");
      if (responseData.statusCode == 200 ||
          responseData.statusCode == 201 ||
          responseData.statusCode == 202 ||
          responseData.statusCode == 203) {
        print("cart added sucessfully");
          Navigator.push(context!,MaterialPageRoute(builder: (context) => const CartHomeScreen( )),);
        // Get.toNamed(AppRoutes.cartHomeScreen);
        // print(responseData.body);
        //  Map<String, dynamic> map = {};
        //  map = json.decode(responseData.body);
        // Map<String, dynamic> token = map["auth_token"];
        // Get.to(CartHomeScreen(
        //   uId: id.toString(),
        // ));
        //  Get.off(CartHomeScreen(
        //   uId: id.toString(),
        // ));
        //  Get.to(() => CartHomeScreen(
        //   uId: id.toString(),
        // ));
      } else {
        print(responseData.body);
        Map<String, dynamic> map = json.decode(responseData.body);
        String data = map['message'];
        if (data == "Item From Other Chef.") {
          return Get.defaultDialog(
              onConfirm: () {
                replacementCartItem(
                    customize: customize,
                    itemCount: itemCount,
                    id: id,
                    cartId: cartId,
                    providerId: providerId,
                    proCost: proCost,
                    itemId: itemId,
                    tenantId: tenantId,
                    pName: pName,
                    pSlug: pSlug,
                    pTiming: pTiming,
                    pAvaiTiming: pAvaiTiming,
                    orderCutOfTime: orderCutOfTime,
                    iName: iName,
                    currency: currency,
                    itemdec: itemdec,
                    iSlug: iSlug);
              },
              onCancel: () {
                Get.back();
              },
              title: "Foodigy",
              middleText: '',
              backgroundColor: Colors.white,
              titleStyle: FoodigyTextStyle.homeHeadLine,
              middleTextStyle: TextStyle(color: Colors.black),
              textConfirm: "Yes",
              textCancel: "No",
              cancelTextColor: Colors.amber,
              confirmTextColor: Colors.red,
              buttonColor: Colors.white,
              barrierDismissible: false,
              radius: 10,
              content: Text(
                "You are trying to add item from different Chef. It will remove all items in your current cart.",
                textAlign: TextAlign.center,
                style: FoodigyTextStyle.addTocartStyle,
              ));
        } else {
          Fluttertoast.showToast(
              backgroundColor: firstColor,
              msg: data,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1);
        }
      }
    } catch (e) {
      //  return null;
      // return addressGetFromJson(data);
      //  print(e.toString());
    } finally {
      // isLoading(false);
      //  print(isLoading);
    }
  }

//replacement cart
  Future replacementCartItem(
      {List? customize,
      int? id,
      cartId,
      providerId,
      proCost,
      itemId,
      String? tenantId,
      String? orderCutOfTime,
      itemCount,
      String? pName,
      pSlug,
      pTiming,
      pAvaiTiming,
      iName,
      currency,
      itemdec,
      iSlug}) async {
    var url = Uri.parse(
        "${ApiDomain.apiDomain}/ordermgmt/cart/replaceitem/${cartId.toString()}");
    try {
      //  String token = box.read('auth_token');
      final responseData = await http.patch(url,
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            "Authorization": 'Bearer $token',
          },
          body: jsonEncode(<String, dynamic>{
            "providerId": providerId,
            "itemId": itemId,

            "itemCost": proCost,

            "itemName": iName,
            "itemDesc": itemdec,
            "itemSlug": iSlug,
            "currency": currency,
            "quantity": int.parse(itemCount.toString()),
            "productTiming": pTiming,
            "productAvailableTime": pAvaiTiming,
            'orderCutOffTime': orderCutOfTime,

            "cartId": int.parse(cartId),
            // "cartId": cartId,
            "customization": {
              "customization": {"custom": customize}
            }
          }));
      print("heelo");
      print("status code is ${responseData.statusCode.toString()}");
      if (responseData.statusCode == 200 ||
          responseData.statusCode == 201 ||
          responseData.statusCode == 202 ||
          responseData.statusCode == 203) {
        print(responseData.body);
        //  Map<String, dynamic> map = {};
        //  map = json.decode(responseData.body);
        // Map<String, dynamic> token = map["auth_token"];
        //  Get.to(() => CartHomeScreen(
        //   uId: id.toString(),
        // ));
        Get.off(CartHomeScreen(
          uId: id.toString(),
        ));
      } else {
        print(responseData.body);
        Map<String, dynamic> map = json.decode(responseData.body);
        String data = map['message'];

        // Fluttertoast.showToast(
        //     msg: data,
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.BOTTOM,
        //     timeInSecForIosWeb: 1);
        return null;
      }
    } catch (e) {
      //  return null;
      // return addressGetFromJson(data);
      //  print(e.toString());
    } finally {
      // isLoading(false);
      //  print(isLoading);
    }
  }

  //delete add to cart
  Future deleteCartItem(
      {int? id,
      cartId,
      providerId,
      proCost,
      String? tenantId,
      cartDetailsID,
      itemId,
      String? pName,
      pSlug,
      pTiming,
      pAvaiTiming,
      iName,
      currency,
      itemdec,
      iSlug}) async {
    var url = Uri.parse(
        "${ApiDomain.apiDomain}/ordermgmt/cart/delete/$cartDetailsID");
    try {
      //  String token = box.read('auth_token');

      final responseData = await http.post(url,
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            "Authorization": 'Bearer $token',
          },
          body: jsonEncode(<String, dynamic>{
            "itemId": int.parse(itemId.toString()),
            "providerId": int.parse(providerId.toString()),
            "itemCost": int.parse(proCost.toString()),
            //"orderCutOffTime": Null,
            "itemName": iName,
            "currency": currency,
            "itemDesc": itemdec,
            "itemSlug": iSlug,
            "productTiming": pTiming,
            "productAvailableTime": pAvaiTiming,
            "quantity": 1,
            "cartId": int.parse(cartId),
            "customization": {
              "customization": {"custom": []}
            }
          }));
      print('one');
      print("heelo");
      print("status code is ${responseData.statusCode.toString()}");
      if (responseData.statusCode == 200 ||
          responseData.statusCode == 201 ||
          responseData.statusCode == 202 ||
          responseData.statusCode == 203) {
        print(responseData.body);
        //  Map<String, dynamic> map = {};
        //  map = json.decode(responseData.body);
        // Map<String, dynamic> token = map["auth_token"];
      } else {
        print(responseData.body);
        Map<String, dynamic> map = json.decode(responseData.body);
        String data = map['message'];

        Fluttertoast.showToast(
            msg: data,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1);
        return null;
      }
    } catch (e) {
      //  return null;
      // return addressGetFromJson(data);
      //  print(e.toString());
    } finally {
      // isLoading(false);
      //  print(isLoading);
    }
  }
}
