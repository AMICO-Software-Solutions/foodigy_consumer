// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:foodigy/controller/tokens.dart';
import 'package:foodigy/controller/user_contoller/current_user_profie_controller.dart';
import 'package:foodigy/presentation/home_screens/home.dart';
import 'package:foodigy/presentation/sign_in/login_screen.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/api_const_value.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:foodigy/widgets/consumer_dialogue_box.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:intl/intl.dart';

class CurrentLocationScreen extends StatefulWidget {
  final bool isSearch;
  const CurrentLocationScreen({Key? key, required this.isSearch})
      : super(key: key);

  @override
  _CurrentLocationScreenState createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
    CurrentUserProfileController registerController =
      Get.put(CurrentUserProfileController());
//  double long = 0.1;
  // double lat = 0.1;
  Future getlocation() async {
    LocationPermission per = await Geolocator.requestPermission();
    if (per == LocationPermission.denied) {
      print("permission denied");
      //  LocationPermission per1 = await Geolocator.requestPermission();
      // per = await Geolocator.requestPermission();
      // if (per == LocationPermission.denied) {
      Get.to(Home());
      // Timer(const Duration(seconds: 2), () {
      //   userAuth();
      // });

    } else if (per == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      print("permission denied for ever");
      return CustomDialogueBox(
        title: "YOu Not able to run",
      );
      // return Future.error(  'Location permissions are permanently denied, we cannot request permissions.');
    } else if (per == LocationPermission.unableToDetermine) {
      // Permissions are denied forever, handle appropriately.
      print("permission denied for ever");
      return CustomDialogueBox(
        title: "YOu Not able to run",
      );
      // return Future.error(  'Location permissions are permanently denied, we cannot request permissions.');
    }

    print("permission allowed");
    Position currentLoc = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    setState(() {
      longFoodigy = currentLoc.longitude;
      latFoodigy = currentLoc.latitude;
      currentLat = currentLoc.latitude;
      currentLong = currentLoc.longitude;
      print(longFoodigy);
      print(latFoodigy);
      Timer(const Duration(seconds: 1), () {
        getAddress(latFoodigy, longFoodigy);
      });
    });
  }
  DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();
      var formatter =  DateFormat('MM-dd-yyyy');
    String formattedDate = formatter.format(now);
    print(formattedDate); 
     var inputFormat = DateFormat('dd/MM/yyyy');
    String formattedDisplayDate = inputFormat.format(now);
    print(formattedDate); 
    selectDisaplayDate =formattedDisplayDate.toString();
    selectDate = formattedDate.toString();
    passDate= formattedDate.toString();

    widget.isSearch == true ? null : getlocation();
    registerController.getProfile();
    TokenGeneretor().postClientId();
    getAppoint();
  }

  Map<String, dynamic> map = {};
  String location = 'Fetching location......';

  //get current location using logtitude lattitude

  Future<http.Response?> getAddress(double lat, double log) async {
    var response = await http.post(
        Uri.parse(
            "${ApiDomain.apiUser}/itrustusers/reversegeocode"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, dynamic>{"latitude": latFoodigy, "longitude": longFoodigy})
        // body: data
        );
    //  print(" reponse is ${response.statusCode}");

    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202 ||
        response.statusCode == 203) {
      ///  print("check");
      setState(() {
        map = json.decode(response.body);
        // ignore: unused_local_variable
        List<dynamic> data = map["AdditionalData"];
        // print(map);
        //print(data[0]["value"]);
        location = "${map["Label"]}";
        print("Lat long value is ${response.body}");
        Timer(const Duration(seconds: 1), () {
       registerController.currentProfile!.data!.user!.userType=="consumer"?   userAuth() : showExitPopup();
        });
      });
    } else {
      return null;
    }
  }

  Future<void> userAuth() async {
    print('Location is ${location.toString()}');
    add = location;
    Get.offAll(Home());
    //  Get.to(BottomScreen(address: location.toString(),));
  }
  Future<bool> showExitPopup() async {
    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Warning!',
              style: FoodigyTextStyle.homeHeadLine,
            ),
            content: Text(
              "This ID is not registered as a consumer ID",
              style: FoodigyTextStyle.addTocartStyle,
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Get.to(LoginSCreen());
                },
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                child: Text('Login', style: FoodigyTextStyle.addressTextStyle,),
              ),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/Foodigy_ logo _PNG.png"),
                  fit: BoxFit.fill,
                ))),
            SizedBox(
              height: 20,
            ),
            Center(
              child: CircularProgressIndicator(
                color: firstColor,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: Container(
                  //       alignment: Alignment.center,
                  //       height: 100,
                  //       width: MediaQuery.of(context).size.width / 1.4,
                  //       decoration: BoxDecoration(
                  //           color: Colors.white,
                  //           borderRadius: BorderRadius.circular(10)),
                  //       child: Padding(
                  //         padding: const EdgeInsets.all(10.0),
                  //         child: Wrap(
                  //           children: [
                  //             Text(location),
                  //           ],
                  //         ),
                  //       )),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
      setState(() {
        //    ChefList = convert.jsonDecode(responseData.body);
      });
    } else if (responseData.statusCode == 401) {
      Map<String, dynamic> map = {};
      map = convert.jsonDecode(responseData.body);
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
