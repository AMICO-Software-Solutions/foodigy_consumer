// ignore_for_file: avoid_print

import 'package:foodigy/model/cms_model/item_timings_model.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class ItemTimingController extends GetxController {
  // ItemTimingsModel? healthTagList;
  var healthTagList = <ItemTimingsModel>[];

  var isDataLoading = false.obs;
  getHealthDetails() async {
    try {
      isDataLoading(true);

      var response = await http.get(
        Uri.parse('https://cms-mko4ihns5q-el.a.run.app/menu-tags-v-2-s'),
        headers: {
          //   'Content-Type': 'application/json; charset=UTF-8',
          "Authorization":'Bearer ${cmsToken.toString()}',
        },
      );
      print('get cart response${response.statusCode}');

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
       // var result = jsonDecode(response.body);
    
        //   print(result);
        //healthTagList =ItemTimingsModel.fromJson(result);
        healthTagList = itemTimingsModelFromJson(response.body);
        print("++++++++++++++++++++");
        print(healthTagList);
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
