// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:foodigy/model/popular_chef_model_list.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PopularChefController extends GetxController {
  @override
  void onInit() {
    getPopularChef();
    super.onInit();
  }

  PopularChefModelList? popularChefList;

  var isDataLoading = false.obs;
  getPopularChef() async {
    try {
      isDataLoading(true);
      var response = await http.get(
        Uri.parse('https://cms-mko4ihns5q-el.a.run.app/consumerlandings'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Authorization":
              'Bearer ${cmsToken.toString()}',
        },
      );
      print(response.statusCode);
      if (response.statusCode >= 200 && response.statusCode <= 205) {
        var result = jsonDecode(response.body);

       print(result[2]["data"]["list"]);
        popularChefList =
            PopularChefModelList.fromJson(result[2]);

      //  print("++++++++++++++++++++");
         print(popularChefList!.data!.list![0].name);
        // print(map);
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
