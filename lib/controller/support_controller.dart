// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodigy/utilities/api_const_value.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/utilities/foodigy_const_data.dart';
import 'package:http/http.dart' as http;

class SupportController {
  void sendMail(
      {String? subject,
      String? message,
      String? email,
      String? name,
      File? file}) async {
    Uint8List imgbytes = await file!.readAsBytes();
   //// Uint8List imgbytes1 = file.readAsBytesSync();
   /// Uint8List bytes = Uint8List.fromList(imgbytes);
    ////List<int> binaries = await file.readAsBytes();
    // Uint8List bytes = file.readAsBytesSync() as Uint8List;
    print('bytes');
    print(file.path);
    // print(bytes);
    // print(binaries);

//    print(imgbytes1.toString());
    String bs4str = base64Encode(imgbytes);
    String baseValue = 'data:application/pdf;base64,$bs4str';
    // print(baseValue);
    final buffer = StringBuffer(baseValue);
    // final buffer = StringBuffer('DART');
    print(buffer);

    // print(bs4str);
    String fieldheader =
        "<p>Name: ${name.toString},</p><p>Email: ${email.toString},</p><p>${message.toString()}</p>";
    var url = Uri.parse("${ApiDomain.apiDomain}/ordermgmt/mail");
    try {
      //  isLoading(true);
      final responseData = await http.post(url,
          headers: {
            "content-type": "application/json",
          },
          body: jsonEncode({
            "to": FoodigyConstData().supportEmail,
            "subject": subject,
            "text": 'data',
            "html": fieldheader,
            "attachments": [
              {
                "filename": 'ordersummary.txt',
                // "content":StringBuffer(bytes),
                //  "path": baseValue,
                // "encoding": 'base64'
                //"path": baseValue,
                // "path":
                //  "content": "Buffer.from($bytes,'binary')",
                //   "filename": 'text1.txt',
                //"filename": file,
                //  "path": file.path.toString(),
                "content": 'hello world!',
                // "content": 'aGVsbG8gd29ybGQh',
                // "path": file.path.toString(),
                //"content":bs4str,
                //    "contentType": 'application/pdf',
                //  "encoding": 'base64'
                // "content": bs4str.toString()
              }
            ]
          }));
      debugPrint(
          "support screen code is ${responseData.statusCode.toString()}");
      if (responseData.statusCode == 200 ||
          responseData.statusCode == 201 ||
          responseData.statusCode == 202 ||
          responseData.statusCode == 203) {
           Map<String, dynamic>  map = json.decode(responseData.body);
        Fluttertoast.showToast(
            backgroundColor: Colors.white,
            textColor: firstColor,
            msg: map["data"],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1);
        print(responseData.body);
      } else {
        print(responseData.body);
      }
    } catch (e) {
      print('errror');

      print(e.toString());
    } finally {}
  }
}
