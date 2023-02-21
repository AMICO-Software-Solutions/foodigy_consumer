import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodigy/controller/tokens.dart';
import 'package:foodigy/controller/user_contoller/google_login_controller.dart';
import 'package:foodigy/controller/user_contoller/login_controller.dart';
import 'package:foodigy/presentation/sign_in/forgot_password_screen.dart';
import 'package:foodigy/presentation/sign_in/google_signup_screen.dart';
import 'package:foodigy/presentation/sign_in/phone_login_screen.dart';
import 'package:foodigy/presentation/sign_in/register_screen.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/widgets/foodigy_button.dart';
import 'package:foodigy/widgets/foodigy_textfield.dart';
import 'package:get/get.dart';

class LoginSCreen extends StatefulWidget {
  const LoginSCreen({Key? key}) : super(key: key);

  @override
  State<LoginSCreen> createState() => _LoginSCreenState();
}

class _LoginSCreenState extends State<LoginSCreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  UserLoginController loginController = Get.put(UserLoginController());
  GoogleLoginController googleLoginController =
      Get.put(GoogleLoginController());

  final formkey = GlobalKey<FormState>();
  final textFieldFocusNode = FocusNode();
  bool _obscured = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: Colors.white,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(children: [
              Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/24.png')),
                  )),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Column(
                  children: [
                    Text("Delightful home made food.",
                        style: FoodigyTextStyle.subHeadingStyle),
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
                          controller: username,
                        ),
                      )),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: SettingsTextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please fill out this field";
                                  } else if (value.isEmpty ||
                                      !RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)")
                                          .hasMatch(value)) {
                                    return "Password must contain at least 8 characters, one uppercase, one number and one special case character";
                                  } else {
                                    return null;
                                  }
                                },
                                mask: _obscured,
                                //  mask: true,
                                controller: password,
                                // prefixIcon: Icons.lock_outline_rounded,
                                hintText: 'Password *',
                                suffixIcon: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                                    child: GestureDetector(
                                      onTap: _toggleObscured,
                                      child: Icon(
                                        _obscured
                                            ? Icons.visibility_off_rounded
                                            : Icons.visibility_rounded,
                                        color: _obscured
                                            ? Colors.grey
                                            : Colors.grey,
                                        size: 20,
                                      ),
                                    ))),
                          )),
                    ),

                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(2.0),
                          child: InkWell(
                            onTap: () {
                              Get.to(ForgotPasswordScreen());
                            },
                            child: Text(
                              "Forgot password?",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //    SizedBox(width: 10,),
                    //     InkWell(
                    //       onTap: () {
                    //         Get.to(PhoneLoginScreen());
                    //       },
                    //       child: Text(
                    //         'Use Mobile Number',
                    //         style: TextStyle(
                    //             fontFamily: 'Poppins',
                    //             fontSize: 10,
                    //             color: Colors.grey.shade800,
                    //             fontWeight: FontWeight.w400),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    //  GetBuilder<UserLoginController>(
                    // init: UserLoginController(),
                    // builder: (loginControler) {
                    //   return loginControler.pressedBool
                    //       ?    FoodigyButton(
                    //     color: firstColor,
                    //     text: 'LOG IN',
                    //     onPressed: () {
                    //     //   loginController.changeStatus();

                    //       final form = formkey.currentState;
                    //       if (form!.validate()) {
                    //         form.save();
                    //         UserLoginController().postUser(
                    //             username: username.text.toString(),
                    //             password: password.text.toString());
                    //              loginController.changeStatus();

                    //       }

                    //     })
                    //       :   FoodigyButton(
                    //         onPressed: (){
                    //        //    registerController.changeStatus();
                    //         },
                    //     color: Colors.grey.shade400,
                    //     text: 'LOG IN',
                    //         );
                    // }),
                    Obx(() {
                      if (loginController.isLoading.isTrue) {
                        return FoodigyButton(
                            color: Colors.grey.shade500,
                            text: 'LOG IN',
                            onPressed: () {});
                      } else {
                        return FoodigyButton(
                            color: firstColor,
                            text: 'LOG IN',
                            onPressed: () {
                              final form = formkey.currentState;
                              if (form!.validate()) {
                                form.save();
                                loginController.postUser(
                                    username: username.text,
                                    password: password.text);
                                // Navigator.push(context,
                                // MaterialPageRoute(builder: (_) => Home()));
                              }
                            });
                      }
                    }),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            height: 10,
                            color: Colors.grey.shade400,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: (){
                            Get.to(GoogleSignUpScreen());
                          },
                          child: Text(
                            'Or sign in with ',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.grey.shade400,
                                fontSize: 9,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Divider(
                            height: 10,
                            color: Colors.grey.shade400,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                   Obx(() {
                    if(googleLoginController.isLoading.isTrue){
                      return Container();

                    }else{
                      return SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  //TokenGeneretor().postClientId();
                                  googleLoginController.registerWithGoogle();
                                  // Timer(const Duration(seconds: 2), () {
                                  //   googleLoginController.postGoogleApiRegister();
                                  // });
                                },
                                child: SizedBox(
                                  height: 45,
                                  width: MediaQuery.of(context).size.width / 5,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/google.png'))),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 0,
                              ),
                              InkWell(
                                onTap: () {
                                  //  googleLoginController.registerWithGoogle();
                                  Get.to(PhoneLoginScreen());
                                },
                                child: SizedBox(
                                  height: 45,
                                  width: MediaQuery.of(context).size.width / 5,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/phone.png'))),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        '',
                                        style: TextStyle(
                                            color: Colors.grey.shade400,
                                            fontSize: 15,
                                            fontFamily: 'Poppins'),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );

                    }
                        
                      }
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => RegisterScreen()));
                      },
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 36),
                          children: const [
                            TextSpan(
                                text: "Don't have an account?",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                    fontFamily: 'Poppins')),
                            TextSpan(
                                text: ' Sign up',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 14,
                                    fontFamily: 'Poppins'))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
