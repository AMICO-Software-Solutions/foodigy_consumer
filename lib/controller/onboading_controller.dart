

import 'package:foodigy/model/on_boading_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OnboadingController extends GetxController {
  OnboadingScreenModel? cartList;
  var productList = <OnboadingScreenModel>[];

  var isDataLoading = false.obs;
  getOnboading() async {
    try {
      isDataLoading(true);
      var response = await http.get(
        Uri.parse('https://cms-mko4ihns5q-el.a.run.app/mobille-app-statics'),
        headers: {
          //   'Content-Type': 'application/json; charset=UTF-8',
        },
      );
     // print('get cart response${response.statusCode}');
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
      //  var result = jsonDecode(response.body);
      //  print(result['data']);
        productList = onboadingScreenModelFromJson(response.body);
      
      } else {
        // ignore: avoid_print
        print(response.body.toString());
      }
    } catch (e) {
      //   print("error");
    } finally {
      isDataLoading(false);
    }
  }
}
