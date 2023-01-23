import 'dart:async';
import 'package:flutter/material.dart';
import 'package:foodigy/presentation/sign_in/login_screen.dart';


class SplashScreenTwo extends StatefulWidget {
  const SplashScreenTwo({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenTwoState createState() => _SplashScreenTwoState();
}

class _SplashScreenTwoState extends State<SplashScreenTwo> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
  
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

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => LoginSCreen()));
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
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/Foodigy_logo_PNG.png'))
              ),
              
            ),
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
