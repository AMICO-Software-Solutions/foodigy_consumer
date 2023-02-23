// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'package:foodigy/controller/tokens.dart';
import 'package:foodigy/model/item_available_search_model.dart';
import 'package:foodigy/utilities/api_const_value.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ItemAvailableSearchController extends GetxController {
  
  getLoader(){
    isDataLoading(true);
   Timer(const Duration(seconds: 1),(){
    isDataLoading(false);

   });
  }
  //AddressGet addressGet =<AddressGet>[].obs;
  ItemAvailableSearchFoodModel? searchModel;
  var isDataLoading = false.obs;
  getItemSearchFood({List? timing}) async {
    try {
      isDataLoading(true);
      //  print("Token is ${box.read('tokenClient')}");

      var response = await http.post(
          Uri.parse(
              '${ApiDomain.apiInventory}/itrustinventory/inventory/mobile/search'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            "Authorization": 'Bearer $cToken',
            // 'scope': 'users',
            // 'api_key': 'gUxXfqhrr6xxoWwnz5m4cAtzH24eHIfh',
          },
          body: jsonEncode(<String, dynamic>{
          //  "productTiming": selectedProductTiming,
            // "longitude":80.21842,
            // "latitude":12.97145,
            "limit": 10,
            "latitude": latFoodigy,
            "longitude": longFoodigy,
            "offset": 0,
            "searchDate": passDate,
           "radius":60,
            "tenantId": 1,
            "invType": "product",
            "timeZone": "Asia/Calcutta"
          }));
      //  print(response.statusCode);
      // print(latFoodigy);
      // print(longFoodigy);
      if (response.statusCode == 200 || response.statusCode == 201) {
        //  print(response.body);
        var result = jsonDecode(response.body);
        searchModel = ItemAvailableSearchFoodModel.fromJson(result);
          print("++++++++++++++++++++");
        //  print(searchModel!.data![0].address);
         print(searchModel!.data!.length);
        //   print("++++++++++++++++++++");
        //  print(currentUser.runtimeType);
      } else {
        TokenGeneretor().postClientId();
        searchModel = null;
        print(response.body.toString());
      }
    } catch (e) {
      //   print("error");
    } finally {
      isDataLoading(false);
    }
  }
}

class ItemAvailableViewSearchController extends GetxController {
  //AddressGet addressGet =<AddressGet>[].obs;
  ItemAvailableSearchFoodModel? searchModel;
  var isDataLoading = false.obs;
  getItemSearchFood({List? timing}) async {
    try {
      isDataLoading(true);
      //  print("Token is ${box.read('tokenClient')}");

      var response = await http.post(
          Uri.parse(
              '${ApiDomain.apiInventory}/itrustinventory/inventory/mobile/search'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            "Authorization": 'Bearer $cToken',
            // 'scope': 'users',
            // 'api_key': 'gUxXfqhrr6xxoWwnz5m4cAtzH24eHIfh',
          },
          body: jsonEncode(<String, dynamic>{
            "productTiming": timing,
            "invType": "product",
            "latitude": latFoodigy,
            "limit": 10,
            "longitude": longFoodigy,
            "offset": 0,
            "searchDate": "2022-07-25T03:44:57.055Z",
            "tenantId": 1,
            "timeZone": "Asia/Calcutta"
          }));
      print(response.statusCode);
      print(latFoodigy);
      print(longFoodigy);
      if (response.statusCode == 200 || response.statusCode == 201) {
        // print(response.body);
        var result = jsonDecode(response.body);
        searchModel = ItemAvailableSearchFoodModel.fromJson(result);
        //     print("++++++++++++++++++++");
        //  print(searchModel!.data![0].address);
        print(searchModel!.data!.length);
        //   print("++++++++++++++++++++");
        //  print(currentUser.runtimeType);
      } else {
        searchModel = null;
        print(response.body.toString());
      }
    } catch (e) {
      //   print("error");
    } finally {
      isDataLoading(false);
    }
  }
}
