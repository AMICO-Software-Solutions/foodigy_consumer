// ignore_for_file: avoid_print

import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:foodigy/controller/user_contoller/mobile_otp_controller.dart';
import 'package:foodigy/presentation/sign_in/login_screen.dart';
import 'package:foodigy/presentation/sign_in/register_screen.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/widgets/foodigy_button.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneLoginScreen extends StatefulWidget {
  const PhoneLoginScreen({Key? key}) : super(key: key);

  @override
  State<PhoneLoginScreen> createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  MobileOTPController mobileController = Get.put(MobileOTPController());
  final countryPicker = const FlCountryCodePicker();
  TextEditingController otpNumber = TextEditingController();
  final formkey = GlobalKey<FormState>();
  CountryCode? countryCode;
  String cCode = '+91';

  //lanch url in  browser

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
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
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
                         Text(
                            "Delightful home made food.",
                            style: FoodigyTextStyle.subHeadingStyle,
                          ),
                       
                        // SizedBox(
                        //   height: 5,
                        // ),
                        // Text(
                        //   'Enter you phone number (required)',
                        //   style: TextStyle(
                        //       fontFamily: 'Poppins',
                        //       fontSize: 12,
                        //       fontWeight: FontWeight.w300,
                        //       color: Colors.grey.shade500),
                        // ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: GestureDetector(
                                  onTap: () async {
                                    final code = await countryPicker.showPicker(
                                        context: context);
                                    if (code != null) print(code);
                                    setState(() {
                                      countryCode = code;
                                      cCode = countryCode!.dialCode;
                                    });
                                  },
                                  child: Container(
                                    width: 60,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: textFormColor),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                                          color: Colors
                                                              .grey.shade500,
                                                          fontSize: 12,
                                                          fontFamily: 'Poppins',
                                                          //fontSize: fontSize,
                                                          fontWeight:
                                                              FontWeight.w300),
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
                                    height: 82,
                                    width:
                                        MediaQuery.of(context).size.width / 1.7,
                                    // decoration: BoxDecoration(
                                    //   borderRadius: BorderRadius.circular(10),
                                    //   color: textFormColor,
                                    // ),
                                    child: TextFormField(
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
                                      controller: otpNumber,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        errorStyle: FoodigyTextStyle.errorStyle,
                                        alignLabelWithHint: true,
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
                                        hintText: 'Mobile number*',
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
                        Obx(() {
                          if (mobileController.isLoading.isTrue) {
                            return FoodigyButton(
                                color: Colors.grey.shade500,
                                text: 'GET OTP',
                                onPressed: () {});
                          } else {
                            return FoodigyButton(
                                color: firstColor,
                                text: 'GET OTP',
                                onPressed: () {
                                  final form = formkey.currentState;
                                  if (form!.validate()) {
                                    form.save();
                                    print('$cCode${otpNumber.text}');
                                    mobileController.mobileOTP(
                                        phoneNumber: cCode + otpNumber.text);
                                  }
                                });
                          }
                        }),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Text(
                                  '',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(LoginSCreen());
                              },
                              child: Text(
                                'Use Email',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                    color: Colors.grey.shade800,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // RichText(
                              //     textAlign: TextAlign.center,
                              //     text: TextSpan(
                              //       style: TextStyle(
                              //           color: Colors.black, fontSize: 36),
                              //       children: const [
                              //         TextSpan(
                              //             text:
                              //                 "By signing up you've agreee to",
                              //             style: TextStyle(
                              //                 color: Colors.grey,
                              //                 fontSize: 12,
                              //                 fontFamily: 'Poppins')),
                              //         TextSpan(
                              //             text:
                              //                 ' Our Terms of Use And Privacy Notice',
                              //             style: TextStyle(
                              //                 fontSize: 12,
                              //                 fontFamily: 'Poppins'))
                              //       ],
                              //     ),
                              //   ),
                              // SizedBox(
                              //   width: MediaQuery.of(context).size.width / 1.2,
                              //   child: Column(
                              //     children: [
                              //       Row(
                              //         children: [
                              //           Text("By signing up you've agreee to",
                              //               style: TextStyle(
                              //                   color: Colors.grey,
                              //                   fontSize: 12,
                              //                   fontFamily: 'Poppins')),
                              //           InkWell(
                              //             onTap: () {
                              //               //  launchURLTerms();
                              //               // Navigator.push(
                              //               //     context,
                              //               //     MaterialPageRoute(
                              //               //         builder: (_) =>
                              //               //             TermsAndConditionsScreen()));
                              //               Get.to(TermsAndConditionsScreen());
                              //             },
                              //             child: Text(' Our Terms of Use And',
                              //                 textAlign: TextAlign.center,
                              //                 style: TextStyle(
                              //                     fontSize: 12,
                              //                     fontFamily: 'Poppins')),
                              //           )
                              //         ],
                              //       ),
                              //       InkWell(
                              //         onTap: () {
                              //           Get.to(PrivacyPolicyScreen());
                              //           //launchURLPrivacy();
                              //         },
                              //         child: Text('Privacy Notice',
                              //             textAlign: TextAlign.center,
                              //             style: TextStyle(
                              //                 fontSize: 12,
                              //                 fontFamily: 'Poppins')),
                              //       )
                              //     ],
                              //   ),
                              // ),

                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => RegisterScreen()));
                                },
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 36),
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
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: 14,
                                              fontFamily: 'Poppins'))
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
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
