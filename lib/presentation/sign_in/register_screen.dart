import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:foodigy/controller/user_contoller/register_controller.dart';
import 'package:foodigy/presentation/home_screens/profile_screens/terms&condition_profile_screen.dart';
import 'package:foodigy/presentation/sign_in/login_screen.dart';
import 'package:foodigy/presentation/sign_in/privacy_policy_screen.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/widgets/foodigy_button.dart';
import 'package:foodigy/widgets/foodigy_textfield.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegiterController registerController = Get.put(RegiterController());
  bool? isAgree = false;
  final countryPicker = const FlCountryCodePicker();
  TextEditingController fNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  final formkey = GlobalKey<FormState>();

  CountryCode? countryCode;
  double sHeight = 5;

  Future launchURLTerms() async {
    var url = Uri.parse("https://www.foodigy.co.in/about-1");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future launchURLPrivacy() async {
    var url = Uri.parse("https://www.foodigy.co.in/about-2");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: double.infinity,
          color: Colors.white,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(children: [
                Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/regi.png')),
                    )),

                /// value increase or decrease

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45),
                  child: Column(
                    children: [
                      Text(
                        "Create account",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      // Text(
                      //   'Create account and move to top in the place of Register',
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(
                      //       fontFamily: 'Poppins',
                      //       fontSize: 12,
                      //       fontWeight: FontWeight.w300,
                      //       color: Colors.grey),
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: SizedBox(
                            //  alignment: Alignment.center,
                            // height: 60,
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(10),
                            //   color: textFormColor,
                            // ),
                            // !RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$")
                            //!RegExp(r"^[A-Za-z][A-Za-z0-9_]{7,29}$")
                            child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: SettingsTextFormField(
                              prefixIcon: MdiIcons.accountOutline,
                              hintText: 'First Name *',
                              controller: fNameController,
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r"^[A-Za-z]{2,29}$")
                                        .hasMatch(value)) {
                                  return "Enter first name";
                                } else {
                                  return null;
                                }
                              }),
                        )),
                      ),
                      SizedBox(
                        height: sHeight,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                            alignment: Alignment.center,
                            // height: 60,
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(10),
                            //   color: textFormColor,
                            // ),
                            // !RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$")
                            //!RegExp(r"^[A-Za-z][A-Za-z0-9_]{7,29}$")
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: SettingsTextFormField(
                                  prefixIcon: MdiIcons.accountOutline,
                                  hintText: 'Last Name *',
                                  controller: lastNameController,
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r"^[A-Za-z]{2,29}$")
                                            .hasMatch(value)) {
                                      return "Enter last name";
                                    } else {
                                      return null;
                                    }
                                  }),
                            )),
                      ),
                      SizedBox(
                        height: sHeight,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                            alignment: Alignment.center,
                            //    height: 60,
                            /*decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: textFormColor,
                              ),*/
                            child: SettingsTextFormField(
                              controller: emailController,
                              prefixIcon: MdiIcons.accountOutline,
                              hintText: 'Email *',
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}')
                                        .hasMatch(value)) {
                                  return "Enter valid email";
                                } else {
                                  return null;
                                }
                              },
                            )),
                      ),
                      SizedBox(
                        height: sHeight,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                            alignment: Alignment.center,
                            //height: 60,
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(10),
                            //   color: textFormColor,
                            // ),
                            child: SizedBox(
                              height: 70,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)")
                                          .hasMatch(value)) {
                                    return "Password must contain at least 8 characters, one uppercase, one number and one special case character";
                                  } else {
                                    return null;
                                  }
                                },
                                controller: passwordController,
                                //  mask: true,
                                decoration: InputDecoration(
                                  fillColor: textFormColor,
                                  filled: true,
                                  hintText: 'Password *',
                                  errorStyle: FoodigyTextStyle.errorStyle,
                                  errorMaxLines: 2,
                                  // prefixIcon:Icon(
                                  //   prefixIcon,
                                  //   color: Colors.grey,
                                  // ) ,

                                  border: InputBorder.none,
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 1.0),
                                  ),
                                  //  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  hintStyle: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      //fontSize: fontSize,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            )),
                      ),
                      // InkWell(
                      //   onTap: () {},
                      //   child: Container(
                      //     alignment: Alignment.centerLeft,
                      //     height: 45,
                      //     color: textFormColor,
                      //     width: double.infinity,
                      //     child: Padding(
                      //       padding: const EdgeInsets.only(left: 10),
                      //       child: Text(
                      //         'Date of brith',
                      //         style: TextStyle(
                      //             color: Colors.grey.shade500,
                      //             fontSize: 12,
                      //             fontFamily: 'Poppins',
                      //             //fontSize: fontSize,
                      //             fontWeight: FontWeight.w300),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: sHeight,
                      // ),
                      // InkWell(
                      //   onTap: () {},
                      //   child: Container(
                      //     alignment: Alignment.centerLeft,
                      //     height: 45,
                      //     color: textFormColor,
                      //     width: double.infinity,
                      //     child: Padding(
                      //       padding: const EdgeInsets.only(left: 10),
                      //       child: Text(
                      //         'Date of brith',
                      //         style: TextStyle(
                      //             color: Colors.grey.shade500,
                      //             fontSize: 12,
                      //             fontFamily: 'Poppins',
                      //             //fontSize: fontSize,
                      //             fontWeight: FontWeight.w300),
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      SizedBox(
                        height: sHeight,
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(0.0),
                      //   child: Container(
                      //       alignment: Alignment.center,
                      //       //  height: 60,
                      //       /* decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(10),
                      //         color: textFormColor,
                      //       ),*/
                      //       child: SettingsTextFormField(
                      //         validator: (value) {
                      //           if (value != passwordController.text ||
                      //               !RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)")
                      //                   .hasMatch(value!)) {
                      //             return "password mismatched";
                      //           } else {
                      //             return null;
                      //           }
                      //         },
                      //         controller: cPassword,
                      //         //  mask: true,
                      //         prefixIcon: Icons.lock_outline_rounded,
                      //         hintText: 'Confirm password',
                      //       )),
                      // ),
                      SizedBox(
                        height: sHeight,
                      ),
                      SizedBox(
                        // height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                final code = await countryPicker.showPicker(
                                    context: context);
                                if (code != null) print(code);
                                setState(() {
                                  countryCode = code;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 24),
                                child: Container(
                                  width: 60,
                                  height: 53,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: textFormColor),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: FittedBox(
                                            child: countryCode == null
                                                ? Text(
                                                    '+91',
                                                        style: TextStyle(
                                                        color: Colors.grey.shade500,
                                                        fontSize: 12,
                                                        fontFamily: 'Poppins',
                                                        //fontSize: fontSize,
                                                        fontWeight:FontWeight.w300),
                                                  )
                                                : countryCode!.flagImage),
                                      ),
                                      Icon(
                                        MdiIcons.chevronDown,
                                        color: Colors.grey.shade500,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: SizedBox(
                                  height: 75,
                                  width:
                                      MediaQuery.of(context).size.width / 1.7,
                                  // decoration: BoxDecoration(
                                  //   borderRadius: BorderRadius.circular(10),
                                  //   color: textFormColor,
                                  // ),
                                  child: TextFormField(
                                    controller: phoneNumberController,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          //r'/^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/'
                                          !RegExp(r'(^(?:[+0]9)?[0-9]{10}$)')
                                              // !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                                              .hasMatch(value)) {
                                        return "Enter valid phone number";
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      floatingLabelAlignment:
                                          FloatingLabelAlignment.center,
                                      // labelStyle: ,
                                      //  isCollapsed: false,
                                      //    isDense: true,
                                      errorStyle: FoodigyTextStyle.errorStyle,
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 1.0),
                                      ),
                                      fillColor: textFormColor,
                                      filled: true,
                                      // prefixIcon: SizedBox(
                                      //     child: Padding(
                                      //   padding: const EdgeInsets.all(13.0),
                                      //   child: Text(
                                      //     countryCode == null
                                      //         ? '+91'
                                      //         : countryCode!.dialCode,
                                      //     style: TextStyle(
                                      //         fontFamily: 'Poppins',
                                      //         fontSize: 15,
                                      //         fontWeight: FontWeight.w300,
                                      //         color: Colors.grey.shade500),
                                      //   ),
                                      // )),
                                      border: InputBorder.none,
                                      hintText: 'Mobile number *',
                                      hintStyle: TextStyle(
                                          color: Colors.grey.shade500,
                                          fontSize: 12,
                                          fontFamily: 'Poppins',
                                          //fontSize: fontSize,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 30,
                            child: Checkbox(
                              value: isAgree,
                              activeColor: Colors.black54,
                              onChanged: (bool? agree) {
                                setState(() {
                                  isAgree = agree;
                                });
                              },
                            ),
                          ),
                          // SizedBox(
                          //   width: MediaQuery.of(context).size.width / 1.5,
                          //   child: RichText(
                          //     textAlign: TextAlign.center,
                          //     text: TextSpan(
                          //       style: TextStyle(
                          //           color: Colors.black, fontSize: 36),
                          //       children: const [
                          //         TextSpan(
                          //             text: "By creating an account, ",
                          //             style: TextStyle(
                          //                 color: Colors.grey,
                          //                 fontSize: 11,
                          //                 fontFamily: 'Poppins')),
                          //         TextSpan(
                          //             text:
                          //                 'you agree to Our Conditions of Use',
                          //             style: TextStyle(
                          //             //  decoration: TextDecoration.underline,
                          //                 fontSize: 11,
                          //                 fontFamily: 'Poppins')),
                          //                 TextSpan(
                          //             text:
                          //                 ' and ',
                          //             style: TextStyle(

                          //                 fontSize: 11,
                          //                 fontFamily: 'Poppins')),
                          //                 TextSpan(
                          //             text:
                          //                 'Privacy Notice',
                          //             style: TextStyle(
                          //             //  decoration: TextDecoration.underline,
                          //                 fontSize: 11,
                          //                 fontFamily: 'Poppins'))
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text("By clicking signup, ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11,
                                              fontFamily: 'Poppins')),
                                      Text("I agree to the ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11,
                                              fontFamily: 'Poppins'))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          // launchURLTerms();
                                          Get.to(TermsAndConditionProfile());
                                          //Get.to(TermsAndConditionsScreen());
                                        },
                                        child: Text('Terms and Conditions',
                                            style: TextStyle(
                                                color: firstColor,
                                                fontSize: 11,
                                                fontFamily: 'Poppins')),
                                      ),
                                      Text(' and ',
                                            style: TextStyle(
                                                fontSize: 11,
                                                fontFamily: 'Poppins')),
                                      InkWell(
                                        onTap: () {
                                          // launchURLPrivacy();
                                          Get.to(PrivacyPolicyScreen());
                                        },
                                        child: Text('Privacy Policy',
                                            style: TextStyle(
                                                //  decoration: TextDecoration.underline,
                                                color: firstColor,
                                                fontSize: 11,
                                                fontFamily: 'Poppins')),
                                      )
                                    ],
                                  )
                                ]),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      isAgree == true
                          ? GetBuilder<RegiterController>(
                              init: RegiterController(),
                              builder: (registerController) {
                                // return registerController.pressedBool
                                if (registerController.isLoading.isTrue) {
                                  return FoodigyButton(
                                      color: Colors.grey.shade500,
                                      text: 'SIGN UP',
                                      onPressed: () {});
                                } else {
                                  return FoodigyButton(
                                      color: firstColor,
                                      text: 'SIGN UP',
                                      onPressed: () {
                                        registerController.changeStatus();

                                        final form = formkey.currentState;
                                        if (form!.validate()) {
                                          form.save();

                                          registerController.registerUser(
                                              cCode: countryCode == null
                                                  ? '+91'
                                                  : countryCode!.dialCode,
                                              firstname: fNameController.text,
                                              lastName: lastNameController.text,
                                              email: emailController.text,
                                              password: passwordController.text,
                                              phoneNumber:
                                                  phoneNumberController.text);
                                        }
                                        registerController.changeStatus();
                                      });
                                }
                              })
                          : FoodigyButton(
                              onPressed: () {
                                //    registerController.changeStatus();
                              },
                              color: Colors.grey.shade400,
                              text: 'SIGN UP',
                            ),

                      SizedBox(
                        height: 30,
                      ),

                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => LoginSCreen()));
                        },
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 36),
                            children: const [
                              TextSpan(
                                  text: "Already have an account?",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                      fontFamily: 'Poppins')),
                              TextSpan(
                                  text: ' Login',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 14,
                                      fontFamily: 'Poppins'))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ]),
            ),
          ),
        ));
  }
}
