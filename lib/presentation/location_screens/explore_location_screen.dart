import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodigy/presentation/home_screens/home.dart';
import 'package:foodigy/presentation/static_screens/splash_screen.dart';
import 'package:foodigy/service/client_service.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ExploreLocationScreen extends StatefulWidget {
  const ExploreLocationScreen({super.key});

  @override
  State<ExploreLocationScreen> createState() => _ExploreLocationScreenState();
}

class _ExploreLocationScreenState extends State<ExploreLocationScreen> {
  
  @override
  void initState() {
   //  var inputFormat = DateFormat('dd/MM/yyyy HH:mm');
     var formatter =  DateFormat('MM-dd-yyyy');
    String formattedDate = formatter.format(now);
    print(formattedDate); 
    selectDate = formattedDate.toString();
    passDate= formattedDate.toString();
    super.initState();
    ClientService().postClientId();
    ClientService().getAppoint();
    Timer(const Duration(seconds: 2), () {
      userAuth();
    });
  }

  Future<void> userAuth() async {
    Get.offAll(Home());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
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
}
