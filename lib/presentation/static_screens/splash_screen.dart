// ignore_for_file: avoid_print

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:foodigy/presentation/on_boarding_screen/on_board_screen.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:platform_device_id/platform_device_id.dart';

DateTime now = DateTime.now();

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? _id;

  // This function will be called when the floating button is pressed
  Future _getInfo() async {
    // Get device id
    String? result = await PlatformDeviceId.getDeviceId;

    // Update the UI
    setState(() {
      _id = result;
    });
  }

  DateTime date = DateTime(now.month, now.day, now.year);
  @override
  void initState() {
    //   var formatter =  DateFormat('MM-dd-yyyy');
    // String formattedDate = formatter.format(now);
    // print(formattedDate);
    // selectDate = formattedDate.toString();
    // passDate= formattedDate.toString();
    _getInfo();

    super.initState();
    Timer(const Duration(seconds: 3), () {
      print('system id');
      print(_id);
      userAuth();

      // Get.to(InitializerWidget());
      // Get.to(AuthVerifiedScreen());
    });
  }

  Future<void> userAuth() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // var email = prefs.getString('tok');
    // email == null
    //     ? Get.toNamed(AppRoutes.onboardScreen)
    //     : Get.toNamed(AppRoutes.homeScreen);

    Navigator.push(context, MaterialPageRoute(builder: (_) => Onbording()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: firstColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            // logo here

            SizedBox(
              height: 30,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
