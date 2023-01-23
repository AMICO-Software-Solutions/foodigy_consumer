// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:foodigy/model/current_user_all_details_model.dart';
import 'package:foodigy/utilities/api_const_value.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CurrentUserAllDetailsController extends GetxController {
  @override
  void onInit() {
    getRecent();
    super.onInit();
  }

  CurrentUserAllDetailsModel? currentUser;
  //current user details API
  Map<String, dynamic> map = {};
  Future getRecent() async {
    var response = await http.get(
      Uri.parse(
          "${ApiDomain.apiUser}/itrustusers/users/$currentUserId"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": 'Bearer ${auth_token.toString()}',
      },
    );
    print("HHHHHHHH");
    print(response.statusCode);

    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202 ||
        response.statusCode == 203 ||
        response.statusCode == 204) {
           var result = jsonDecode(response.body);
        //    print("++++++++++++++++++++");
        //  print(result['data']);
       // addressList = CurrentUserAddressModel.fromJson(result);
   //   map = json.decode(response.body);

      currentUser = currentUserAllDetailsModelFromJson(result);
      print('current user is ${currentUser!.data!.email}}');
    } else {
      // Fluttertoast.showToast(
      //     backgroundColor: firstColor,
      //     msg: "Current user api error",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     timeInSecForIosWeb: 1);
    }
    return "Success";
  }
}
