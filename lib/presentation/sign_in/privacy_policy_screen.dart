

// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:foodigy/utilities/foodigy_const_data.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../widgets/profile/profile_appbar.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(text: 'Privacy Policy'),
      backgroundColor: Colors.white,
     
      body: SafeArea(
        child: WebView(
         initialUrl: FoodigyConstUrlLinks().privacyPolicyLink,
        //  initialUrl: 'https://www.foodigy.co.in/privacy-policy.php',

         javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
          //  _controller.complete(webViewController);
          },
          onProgress: (int progress) {
            print('WebView is loading (progress : $progress%)');
          },
        //  javascriptChannels: <JavascriptChannel>{
          //  _toasterJavascriptChannel(context),
       //   },
          // navigationDelegate: (NavigationRequest request) {
          //   if (request.url.startsWith('https://www.youtube.com/')) {
          //     print('blocking navigation to $request}');
          //     return NavigationDecision.prevent;
          //   }
          //   print('allowing navigation to $request');
          //   return NavigationDecision.navigate;
          // },
          onPageStarted: (String url) {
            print('Page started loading: $url');
          },
          onPageFinished: (String url) {
            print('Page finished loading: $url');
          },
          gestureNavigationEnabled: true,
          backgroundColor: const Color(0x00000000),
        ),
      ),
 
    );
  }
}