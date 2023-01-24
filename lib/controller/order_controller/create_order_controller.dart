// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodigy/controller/address_controller/address_controller.dart';
import 'package:foodigy/controller/cart_controller/cart_count_controller.dart';
import 'package:foodigy/controller/cart_controller/cart_time_controller.dart';
import 'package:foodigy/controller/cart_controller/get_cart_list_controller.dart';
import 'package:foodigy/controller/chef_profile_controller.dart';
import 'package:foodigy/controller/user_contoller/current_user_profie_controller.dart';
import 'package:foodigy/model/cart_details_model.dart';
import 'package:foodigy/model/create_order_model.dart';
import 'package:foodigy/model/curent_user_profile_model.dart';
import 'package:foodigy/model/order_completed_model.dart';
import 'package:foodigy/presentation/chef_screens/order_placed.dart';
import 'package:foodigy/presentation/home_screens/home.dart';
import 'package:foodigy/utilities/api_const_value.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:foodigy/utilities/foodigy_const_data.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CreateOrderController extends GetxController {
  //var _razorpay = Razorpay();

  // @override
  // void onInit() {
  //   var _razorpay = Razorpay();
  //   _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
  //   _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
  //   _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  //   // TODO: implement onInit
  //   super.onInit();
  // }

  // @override
  // void onClose() {
  //   _razorpay.clear();
  //   super.onClose();
  // }

  CreateOrderModel? createList;
  var isDataLoading = false.obs;

  //create Order
  Future createOrder(
      {var cart,
      CartDetailsModel? cartData,
      int? index,
      String? address,addressId,
      String? notes,
      String? bookingDate,
      String? deliveryMode,
      String? deliveryRate,
      CurrentUserProfileModel? currentProfile,
      String? productTotalCost,
      String? totalCost,
      String? taxTotalCost,
      String? sgstCost,
      String? couponId,couponCost,couponCode,
      String? cgstCost}) async {
    var url = Uri.parse(
        "${ApiDomain.apiDomain}/ordermgmt/orders/create-order-mobile");
    try {
      isDataLoading(true);
      // String token = box.read('auth_token');
      print('token');
      print(token);
      final responseData = await http.post(url,
          headers: <String, String>{
            "content-type": "application/json",
            "Authorization": 'Bearer ${token.toString()}',
          },
          body: jsonEncode(<String, dynamic>{
            "tenantId": int.parse(cartData!.data!.tenantId.toString()),
            "providerId":
                int.parse(cartData.data!.cartDetails![0].providerId.toString()),
            "consumerId": int.parse(cartData.data!.userId.toString()),
            "bookingDate": bookingDate.toString(),
            "orderType": "SCHEDULED",
            "prefferedCurrency": "INR",
            "profileName": cartData.data!.profileName.toString(),
            "profileSlug": cartData.data!.profileSlug,
            "sgstCost": double.parse(sgstCost.toString()),
            "sgstPercent": PriceDetails().sgstPercentage,
            "cgstCost": double.parse(cgstCost.toString()),
            "cgstPercent":PriceDetails().cgstPercentage,
            "taxTotalCost": double.parse(taxTotalCost.toString()),
            "productTotalCost": int.parse(productTotalCost.toString()),
            "couponCost": int.parse(couponCost.toString()),
            "totalCost": int.parse(totalCost.toString()),
            "couponId":couponId.toString()=="null" ? null: int.parse(couponId.toString()),
            "couponCode": couponCode,
            "addressId": int.parse(addressId.toString()),
            "orderAddress": address,
            "invoiceAddress":address,
            "phoneNumber": currentProfile!.data!.user!.phoneNumber.toString(),
            "additionalNote": notes.toString(),
            "email": currentProfile.data!.user!.email.toString(),
            "deliveryMode": deliveryMode,
            "deliveryRate": int.parse(deliveryRate.toString()),
            "orderDetail": cart
          }));
          isDataLoading(false);
      print(currentUserId);
      print(" place order status code is ${responseData.statusCode.toString()}");
      if (responseData.statusCode == 200 ||
          responseData.statusCode == 201 ||
          responseData.statusCode == 202 ||
          responseData.statusCode == 203) {
        var result = jsonDecode(responseData.body);
        print("++++++++++++++++++++");
        print(result['data']);
        print(createList);
        createList = CreateOrderModel.fromJson(result);
        print(createList!.data!.response!.key.toString());
        //  print(createList!.data!.response!.callbackUrl.toString());
        // razorPay();
        //Get.offAll(Home());
        // print(responseData.body);
      } else {
         isDataLoading(false);
         print('error');
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
       isDataLoading(false);
      Fluttertoast.showToast(
          backgroundColor: firstColor,
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1);
      //  return null;
      // return addressGetFromJson(data);
      //  print(e.toString());
    } finally {
      Timer(const Duration(seconds: 2),(){
          isDataLoading(false);

      });
    
    }
  }

  OrderCompletedModel? orderCompleted;
  //post razorpay callback
  Future razorSuccess(PaymentSuccessResponse response) async {
    var url = Uri.parse(
        "${ApiDomain.apiDomain}/ordermgmt/razorpay/paymentcallback/mobile");
    try {
      //   String token = box.read('auth_token');
      print('token');
      print(token);
      final responseData = await http.post(url,
          headers: <String, String>{
            "content-type": "application/json",
            "accept": "*/*"
          },
          body: jsonEncode(<String, dynamic>{
            "razorpay_payment_id": response.paymentId.toString(),
            "razorpay_order_id": response.orderId.toString(),
            "razorpay_signature": response.signature.toString(),
          }));
      print(" reponse status code is ${responseData.statusCode.toString()}");
      if (responseData.statusCode == 200 ||
          responseData.statusCode == 201 ||
          responseData.statusCode == 202 ||
          responseData.statusCode == 203) {
        var result = jsonDecode(responseData.body);
        orderCompleted = OrderCompletedModel.fromJson(result);
        Get.to(OrderPlaceScreen(
          ordeCompleted: orderCompleted,
        ));
        //  Get.offUntil(GetPageRoute(page: () =>OrderPlaceScreen(
        //    ordeCompleted: orderCompleted)), ModalRoute.withName('toNewLogin') );
          // Get.offUntil(GetPageRoute(page: () =>Home()), ModalRoute.withName('toNewLogin') );
   
     Timer(Duration(milliseconds: 200), (){
      Get.delete<GetCartDetailsController>();
      Get.delete<GetAddressDetailsController>();
      Get.delete<CurrentUserProfileController>();
      Get.delete<ChefProfileController>();
      Get.delete<CreateOrderController>();
      Get.delete<CartCountController>();
     // Get.delete<CartTimerController>();
      }
      );
        // Get.to(()=>OrderPlaceScreen(
        //   ordeCompleted: orderCompleted))!.then((value) {
        //     Get.delete<GetCartDetailsController>();
        //     Get.delete<CartTimerController>();
        //     Get.delete<CartCountController>();
            
        //   } );
        print('razor pay response');
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
      print("catch error");
      print(e.toString());
    } finally {}
  }

  // void razorPay() async {
  //   print(createList!.data!.response!.key);
  //   print(createList!.data!.response!.amount);
  //   print(createList!.data!.response!.name);
  //   print(createList!.data!.response!.orderId);
  //   print(createList!.data!.response!.prefill!.contact);
  //   print(createList!.data!.response!.prefill!.email);
  //   print(createList!.data!.response!.key);
  //   var options = {
  //     'key': "rzp_test_FcY9JpidJOkMeN",
  //     'amount': 105000,
  //     'currency': 'INR', //in the smallest currency sub-unit.
  //     'name': 'Foodigy',
  //     'image':
  //         'https://storage.googleapis.com/ezcon-cms-preprod/logo_6d5d154030/logo_6d5d154030.png',
  //     'order_id': "order_KehJIdnb5LYHiK", // Generate order_id using Orders API

  //     'timeout': 300, // in seconds
  //     'prefill': {'contact': '+919524937752', 'email': 'jsmine97@gmail.com'},
  //     'notes': {
  //       'address': 'Gleamer Corporate Office',
  //       'orderId': '341',
  //       'consumerId': '606'
  //     },
  //     'theme': {'color': '#21823D'},
  //   };
  // }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    razorSuccess(response);
    print('raso response');
    print(response.orderId);
    print(response.paymentId);
    print(response.signature);
    // Do something when payment succeeds
    print("Payment Done");
  }

  void handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print("Payment Fail");
    print(response.code);
    print(response.error);
    print(response.message);
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    print(response.walletName);
    // Do something when an external wallet is selected
  }
}
