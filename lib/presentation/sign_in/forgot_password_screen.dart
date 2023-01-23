import 'package:flutter/material.dart';
import 'package:foodigy/controller/user_contoller/login_controller.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/widgets/foodigy_button.dart';
import 'package:foodigy/widgets/foodigy_textfield.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  UserLoginController loginController = Get.put(UserLoginController());

  TextEditingController emailController=TextEditingController();

  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Form(
      key: formkey,
      child: Column(children: [
        Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/24.png')),
            )),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            children: [
              Text("Account recovery", style: FoodigyTextStyle.subHeadingStyle),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: SizedBox(
                    //  alignment: Alignment.center,
                    // height: 65,
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(10),
                    //   color: textFormColor,
                    // ),
                    child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: SettingsTextFormField(
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}')
                              .hasMatch(value)) {
                        return "Enter valid email";
                      } else {
                        return null;
                      }
                    },
                    // prefixIcon: MdiIcons.accountOutline,
                    hintText: 'Email *',
                   controller:emailController,
                  ),
                )),
              ),
              SizedBox(
                height: 20,
              ),
              Obx(() {
                if (loginController.isForgotLoading.isTrue) {
                  return FoodigyButton(
                      color: Colors.grey.shade500,
                      text: 'Submit',
                      onPressed: () {});
                } else {
                  return FoodigyButton(
                      color: firstColor,
                      text: 'Submit',
                      onPressed: () {
                        final form = formkey.currentState;
                        if (form!.validate()) {
                          form.save();
                          loginController.postForgotPassword(email:emailController.text );

                          // Navigator.push(context,
                          // MaterialPageRoute(builder: (_) => Home()));
                        }
                      });
                }
              }),
            ],
          ),
        ),
      ]),
    )));
  }
}
