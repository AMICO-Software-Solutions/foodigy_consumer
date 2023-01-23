import 'package:flutter/material.dart';
import 'package:foodigy/presentation/sign_in/login_screen.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/widgets/foodigy_button.dart';
import 'package:get/get.dart';

class RegisterConfirmScreen extends StatefulWidget {
  const RegisterConfirmScreen({super.key});

  @override
  State<RegisterConfirmScreen> createState() => _RegisterConfirmScreenState();
}

class _RegisterConfirmScreenState extends State<RegisterConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.mail),
            SizedBox(
              height: 10,
            ),
            Text(
              "A verification Link has been sent to your email account",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: firstColor),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              height: 3,
              color: firstColor,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Please Click on the link that has been sent to your email account to verify your email and continue the registration process",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey.shade900),
            ),
            SizedBox(
              height: 20,
            ),
            FoodigyButton(
                color: firstColor,
                text: 'Login',
                onPressed: () {
                  Get.to(LoginSCreen());
                }),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      )),
    );
  }
}
