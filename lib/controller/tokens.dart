// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodigy/utilities/api_const_value.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

// CMS token
class TokenGeneretor extends GetxController {
  Future createCMSToken() async {
    var url = Uri.parse("https://cms-mko4ihns5q-el.a.run.app/auth/local");
    try {
      final responseData = await http.post(url, body: {
        "identifier": "access@itrustsol.com",
        "password": "Admin@1234"
      });
      if (responseData.statusCode == 200 ||
          responseData.statusCode == 201 ||
          responseData.statusCode == 202 ||
          responseData.statusCode == 203) {
        print(responseData.body);
        Map<String, dynamic> map = {};
        map = convert.jsonDecode(responseData.body);
        cmsToken = map['jwt'];
        box.write('cms_token', cmsToken);
      } else {
        print(responseData.body);
      }
    } catch (e) {
      print(e.toString());
    } finally {
    }
  }

//step 2

  Future postClientId() async {
    var url = Uri.parse("${ApiDomain.apiAuth}/itrustauth/auth/login");
    try {
      String username = 'k1c6CezS74Q3Zv9KZdKiMzxLtDZr3IDl';
      String password = 'LmNnPQ5m0QIW2H2myrSh1XmkPEmJC64qNSEkBnmXt8uiDooRx4O60J1deYh6700C';
      String basicAuth =  'Basic ${base64.encode(utf8.encode('$username:$password'))}';
      //   print(basicAuth);
      final responseData = await http.post(url, headers: <String, String>{
        //   "content-type": "application/json",
        "Authorization": basicAuth.toString(),
      }, body: {
        "scope": "subscription",
        "grant_type": "client_credentials",
        "api_key": "gUxXfqhrr6xxoWwnz5m4cAtzH24eHIfh"
      });
        print("client id status code is ${responseData.statusCode.toString()}");
      if (responseData.statusCode == 200 ||
          responseData.statusCode == 201 ||
          responseData.statusCode == 202 ||
          responseData.statusCode == 203) {
        Map<String, dynamic> map = {};
        map = json.decode(responseData.body);
        String tokenClient = map["auth_token"];
        String clientId = tokenClient.toString();
        cToken = clientId.toString();
        googleClientToken = clientId;
        box.remove('tokenClient');
        box.write('tokenClient', tokenClient);
        print("CLient id");
        print(clientId);
      } else {
        print(responseData.body);
        Fluttertoast.showToast(
            msg: "please enter valid details",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1);
        return null;
      }
    } catch (e) {
      print(e.toString());
    } finally {
      print("success");
    }
  }
}
