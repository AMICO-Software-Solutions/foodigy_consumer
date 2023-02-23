// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:foodigy/utilities/foodigy_const_data.dart';
import 'package:foodigy/widgets/profile/profile_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutFoodigyScreen extends StatefulWidget {
  const AboutFoodigyScreen({super.key});

  @override
  State<AboutFoodigyScreen> createState() => _AboutFoodigyScreenState();
}

class _AboutFoodigyScreenState extends State<AboutFoodigyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(text: 'About Foodigy'),
      body: SafeArea(
        child: WebView(
          initialUrl: FoodigyConstUrlLinks().aboutFoodigyLink,
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
