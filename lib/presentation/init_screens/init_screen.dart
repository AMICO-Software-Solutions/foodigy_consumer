// ignore_for_file: avoid_print
//import 'package:device_info_plus/device_info_plus.dart';
import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:foodigy/controller/user_contoller/google_login_controller.dart';
import 'package:foodigy/controller/user_contoller/login_controller.dart';
import 'package:foodigy/main.dart';
import 'package:foodigy/presentation/location_screens/current_location_screen.dart';
import 'package:foodigy/presentation/static_screens/splash_screen.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:platform_device_id/platform_device_id.dart';
GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
  ],
);

class InitializerWidget extends StatefulWidget {
  const InitializerWidget({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _InitializerWidgetState createState() => _InitializerWidgetState();
}

class _InitializerWidgetState extends State<InitializerWidget> {
  GoogleSignInAccount? currentUserGoogle;
  bool isLoading = true;

  Widget getData() {
    UserLoginController().postUser(
        username: box.read('email').toString(),
        password: box.read('password').toString());
    return CurrentLocationScreen(
          isSearch: false,
        );
  }

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
  Widget getGoogleAccount(){
    Timer(Duration(seconds: 0), (){
        GoogleLoginController().registerWithGoogle();
    });
  
     return CurrentLocationScreen(
          isSearch: false,
        );

  }

  @override
  void initState() {
    _getInfo();

    // initPlatformState();
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
      currentUserGoogle = account;
      });
      if (currentUserGoogle!= null) {
        print(currentUserGoogle!.email.toString());
      }else{
        print("failed");
      }
    });
    _googleSignIn.signInSilently();
    isLoading = false;
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
               // channel.description,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      // if (notification != null && android != null) {
      //   showDialog(
      //       context: context,
      //       builder: (_) {
      //         return AlertDialog(
      //           title: Text(notification.title),
      //           content: SingleChildScrollView(
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [Text(notification.body)],
      //             ),
      //           ),
      //         );
      //       });
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Column(children: [
    //     SizedBox(
    //       height: 30,
    //     ),
    //     TextButton(
    //         onPressed: () {
    //           _getInfo();
    //           print(_id);
    //         },
    //         child: Text("Click")),
    //     Text(_id.toString() == '' ? 'kdj' : _id.toString())
    //   ]),
    // );
    // print('device id');
    //print(_deviceData['appName']);
    // return
    // Scaffold(
    //     // body: Center(child: Text(_deviceData['id'])),
    //     );
    if (box.read('email') != null) {
      //return CurrentLocationScreen(isSearch: false,);
// return SplashScreen();
      return getData();

    }
    else if(currentUserGoogle!= null){
     return getGoogleAccount();

    }
     else {
      return SplashScreen();
    }
  }
}
