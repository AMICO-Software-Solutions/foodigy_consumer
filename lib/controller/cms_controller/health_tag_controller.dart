// ignore_for_file: avoid_print

import 'package:foodigy/model/cms_model/health_tag_model.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HealthTagController extends GetxController {
//  HealthTagModel? healthTagList;

  var healthTagList = <HealthTagModel>[];


  var isDataLoading = false.obs;
  getHealthDetails() async {
    try {
      isDataLoading(true);

      var response = await http.get(
        Uri.parse('https://cms-mko4ihns5q-el.a.run.app/healthtags'),
        headers: {
          //   'Content-Type': 'application/json; charset=UTF-8',
          "Authorization":
              'Bearer ${cmsToken.toString()}',
        },
      );
      print('get cart response${response.statusCode}');

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
       // var result = jsonDecode(response.body);
  
      //   print(result);
        healthTagList =healthTagModelFromJson(response.body);
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
