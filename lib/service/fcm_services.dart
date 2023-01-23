// ignore_for_file: avoid_print

import 'package:foodigy/utilities/api_const_value.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:http/http.dart' as http;

class FCMServices {
  Future postFCMToken() async {
    var url = Uri.parse(
        "${ApiDomain.apiUser}/itrustusers/profile/$currentUserId");
    try {
      final responseData = await http.patch(url, headers: <String, String>{
        "Authorization": 'Bearer ${auth_token.toString()}',
      }, body: {
        "notificationToken": fcmToken.toString()
      });
      print( "fcm profile token status code is ${responseData.statusCode.toString()}");
      if (responseData.statusCode == 200 ||
          responseData.statusCode == 201 ||
          responseData.statusCode == 202 ||
          responseData.statusCode == 203) {
        print(responseData.body);

        // print(userId);

      } else {
        print(" fcm token update error ${responseData.body}");

        return null;
      }
    } catch (e) {
      //  return null;
      // return addressGetFromJson(data);
      //  print(e.toString());
    } finally {
      // print("success");
    }
  }
}
