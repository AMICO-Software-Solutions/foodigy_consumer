// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodigy/controller/tokens.dart';
import 'package:foodigy/utilities/api_const_value.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:http/http.dart' as http;

class ClientService {
  Future postClientId() async {
    var url = Uri.parse("${ApiDomain.apiAuth}/itrustauth/auth/login");
    try {
      String username = 'k1c6CezS74Q3Zv9KZdKiMzxLtDZr3IDl';
      String password =
          'LmNnPQ5m0QIW2H2myrSh1XmkPEmJC64qNSEkBnmXt8uiDooRx4O60J1deYh6700C';
      String basicAuth =
          'Basic ' + base64.encode(utf8.encode('$username:$password'));
      //   print(basicAuth);
      final responseData = await http.post(url, headers: <String, String>{
        //   "content-type": "application/json",
        "Authorization": basicAuth.toString(),
      }, body: {
        "scope": "subscription",
        "grant_type": "client_credentials",
        "api_key": "gUxXfqhrr6xxoWwnz5m4cAtzH24eHIfh"
      });
      //   print("status code is ${responseData.statusCode.toString()}");
      if (responseData.statusCode == 200 ||
          responseData.statusCode == 201 ||
          responseData.statusCode == 202 ||
          responseData.statusCode == 203) {
        //   print(responseData.body);
        Map<String, dynamic> map = {};
        map = json.decode(responseData.body);

        String tokenClient = map["auth_token"];
        String clientId = tokenClient.toString();
        box.write('tokenClient', tokenClient);

        ("CLient id");
        print(clientId);
        // print(userId);

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
      //  return null;
      // return addressGetFromJson(data);
      print(e.toString());
    } finally {
      print("success");
    }
  }

  Future<String> getAppoint() async {
    var responseData = await http.get(
      Uri.parse("https://cms-mko4ihns5q-el.a.run.app/consumerlandings"),
      headers: {
        "Accept": "application/json",
        "Authorization": 'Bearer ${cmsToken.toString()}',
      },
    );
    // print(" reponse is ${responseData.statusCode}");

    if (responseData.statusCode == 200 ||
        responseData.statusCode == 201 ||
        responseData.statusCode == 202) {
    } else if (responseData.statusCode == 401) {
      Map<String, dynamic> map = {};
      map = json.decode(responseData.body);
      print(map['message'].toString());
      if (map['message'] == "Invalid token.") {
        print('success');
        TokenGeneretor().createCMSToken();
      } else {
        print('failure');
      }
    } else {
      print(responseData.body);
    }
    return "success";
  }
}
