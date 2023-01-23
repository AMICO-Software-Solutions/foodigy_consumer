// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:foodigy/model/chef_rating_model.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:http/http.dart' as http;
import 'package:foodigy/model/chef_details_model.dart';
import 'package:get/get.dart';

class ChefDetailsControllerList extends GetxController {
  ChefDetailsModelList? chefDetailsList;

  var isDataLoading = false.obs;
  chefDetails({String? chefId, List? menuTag,List? nProduct}) async {
    try {
      isDataLoading(true);
      var response = await http.post(
          Uri.parse(
              'https://itrustinventory-mko4ihns5q-el.a.run.app/api/v1/itrustinventory/inventory/search'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            "Authorization": 'Bearer $cToken',
          },
          body: jsonEncode(<String, dynamic>{
            
            "natureofProduct":nProduct,
            "searchDate": passDate,
            "latitude": latFoodigy,
          "longitude": longFoodigy,
         //   "latitude": 13.05129,
          //  "longitude": 80.18242,
            "timeZone": "Asia/Calcutta",
            "tenantId": 1,
            "radius":60,
            "invType": "product",
            "menuTag": menuTag,
            "userId": int.parse(chefId.toString()),
            "limit": 100,
            "offset": 0,
          }));
          // print(chefId);
          // print(nProduct);
          // print( passDate);
          // print(latFoodigy);
          // print(longFoodigy);
          // print(menuTag);
      print(response.statusCode);
      print(int.parse(chefId.toString()));
      if (response.statusCode == 200 ||response.statusCode == 201 || response.statusCode == 202) {
        // print("***************");
        // print(response.body);
        //  List map = [];
        // Map<String, dynamic> map = {};
        //   map = json.decode(response.body);
        //    Map<String, dynamic> token = map["auth_token"];
        print(response.body);
        var result = jsonDecode(response.body);
        // print(result["data"].length);
        chefDetailsList = ChefDetailsModelList.fromJson(result);

         print("++++++++++++++++++++");
        // print(chefDetailsList!.data![0].address);
        // print(chefDetailsList!.data!.length);
        // //  print(popularChefList!.description);

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


class ChefRatingController extends GetxController{
    ChefRatingModel? chefRatingList;

  var isDataLoading = false.obs;
  chefDetails({String? chefId, }) async {
    try {
      isDataLoading(true);
      var response = await http.get(
          Uri.parse(
              'https://itrustorders-mko4ihns5q-el.a.run.app/api/v1/ordermgmt/pivot/chefRating/$chefId'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            "Authorization": 'Bearer $cToken',
          },
         );
         
      print(response.statusCode);
      if (response.statusCode == 200 ||response.statusCode == 201 || response.statusCode == 202) {

        var result = jsonDecode(response.body);
        print(result["data"].length);
        chefRatingList = ChefRatingModel.fromJson(result);

        print("++++++++++++++++++++");
      
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
