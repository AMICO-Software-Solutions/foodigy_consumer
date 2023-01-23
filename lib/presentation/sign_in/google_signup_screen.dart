// ignore_for_file: avoid_print

import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:foodigy/controller/user_contoller/google_login_controller.dart';
import 'package:foodigy/presentation/sign_in/privacy_policy_screen.dart';
import 'package:foodigy/presentation/sign_in/terms_and_condition_screen.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/widgets/foodigy_button.dart';
import 'package:get/get.dart';


class GoogleSignUpScreen extends StatefulWidget {
  final String? id;
  const GoogleSignUpScreen({super.key, this.id});

  @override
  State<GoogleSignUpScreen> createState() => _GoogleSignUpScreenState();
}

class _GoogleSignUpScreenState extends State<GoogleSignUpScreen> {
  bool? isAgree = false;

  TextEditingController phoneNumberController = TextEditingController();

  final countryPicker = const FlCountryCodePicker();

  final formkey = GlobalKey<FormState>();

  double sHeight = 5;
  CountryCode? countryCode;
  // Initial Selected Value
  String dropdownvalue = 'consumer';

  // List of items in our dropdown menu
  var items = [
    'consumer',
    'provider',
  ];
  String dropdownGender = 'male';

  // List of items in our dropdown menu
  var genders = ['male', 'female', 'others'];
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
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/regi.png')),
                    )),

                /// value increase or decrease

                SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Create your new account",
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
                        // Padding(
                        //   padding: const EdgeInsets.all(0.0),
                        //   child: Container(
                        //       //  alignment: Alignment.center,
                        //       // height: 60,
                        //       // decoration: BoxDecoration(
                        //       //   borderRadius: BorderRadius.circular(10),
                        //       //   color: textFormColor,
                        //       // ),
                        //       // !RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$")
                        //       //!RegExp(r"^[A-Za-z][A-Za-z0-9_]{7,29}$")
                        //       child: Padding(
                        //     padding: const EdgeInsets.all(0.0),
                        //     child: SettingsTextFormField(
                        //         prefixIcon: MdiIcons.accountOutline,
                        //         hintText: 'DOB *',
                        //         //  controller: fNameController,
                        //         validator: (value) {
                        //           // if (value!.isEmpty ||
                        //           //     !RegExp(r"^[A-Za-z]{5,29}$")
                        //           //         .hasMatch(value)) {
                        //           //   return "Enter first name";
                        //           // } else {
                        //           //   return null;
                        //           // }
                        //         }),
                        //   )),
                        // ),

                        // Container(
                        //   color: textFormColor,
                        //   padding: EdgeInsets.symmetric(horizontal: 10),
                        //   child: DropdownButtonFormField(
                        //     decoration: InputDecoration(
                        //         border: InputBorder.none,
                        //         enabledBorder: UnderlineInputBorder(
                        //             borderSide: BorderSide(color: Colors.white))),
                        //     // Initial Value
                        //     value: dropdownvalue,
                        //     isExpanded: true,
                        //     elevation: 0,

                        //     // Down Arrow Icon
                        //     icon: const Icon(
                        //       Icons.keyboard_arrow_down,
                        //       color: Colors.grey,
                        //     ),
                        //     dropdownColor: textFormColor,

                        //     // Array list of items
                        //     items: items.map((String items) {
                        //       return DropdownMenuItem(
                        //         value: items,
                        //         child: Text(
                        //           items,
                        //           style: TextStyle(
                        //               color: Colors.grey.shade500,
                        //               fontSize: 12,
                        //               fontFamily: 'Poppins',
                        //               //fontSize: fontSize,
                        //               fontWeight: FontWeight.w300),
                        //         ),
                        //       );
                        //     }).toList(),
                        //     // After selecting the desired option,it will
                        //     // change button value to selected value
                        //     onChanged: (String? newValue) {
                        //       setState(() {
                        //         dropdownvalue = newValue!;
                        //         print(dropdownvalue);
                        //       });
                        //     },
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // Container(
                        //   color: textFormColor,
                        //   padding: EdgeInsets.symmetric(horizontal: 10),
                        //   child: DropdownButtonFormField(
                        //     decoration: InputDecoration(
                        //         border: InputBorder.none,
                        //         enabledBorder: UnderlineInputBorder(
                        //             borderSide: BorderSide(color: Colors.white))),
                        //     // Initial Value
                        //     value: dropdownGender,
                        //     isExpanded: true,
                        //     elevation: 0,

                        //     // Down Arrow Icon
                        //     icon: const Icon(
                        //       Icons.keyboard_arrow_down,
                        //       color: Colors.grey,
                        //     ),
                        //     dropdownColor: textFormColor,

                        //     // Array list of items
                        //     items: genders.map((String item) {
                        //       return DropdownMenuItem(
                        //         value: item,
                        //         child: Text(
                        //           item,
                        //           style: TextStyle(
                        //               color: Colors.grey.shade500,
                        //               fontSize: 12,
                        //               fontFamily: 'Poppins',
                        //               //fontSize: fontSize,
                        //               fontWeight: FontWeight.w300),
                        //         ),
                        //       );
                        //     }).toList(),
                        //     // After selecting the desired option,it will
                        //     // change button value to selected value
                        //     onChanged: (String? newValue) {
                        //       setState(() {
                        //         dropdownGender = newValue!;
                        //         print(dropdownGender);
                        //       });
                        //     },
                        //   ),
                        // ),
                        SizedBox(
                          height: 20,
                        ),

                        SizedBox(
                          // height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  // final code = await countryPicker.showPicker(
                                  //     context: context);
                                  // if (code != null) print(code);
                                  // setState(() {
                                  //   countryCode = code;
                                  //   print(countryCode!.dialCode.toString());
                                  // });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 26),
                                  child: Container(
                                    width: 60,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: textFormColor),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                            height: 30,
                                            width: 30,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Text('+91')
                                            // child: FittedBox(
                                            //     child: countryCode == null
                                            //         ? null
                                            //         : countryCode!.flagImage),
                                            ),
                                        // Icon(
                                        //   MdiIcons.chevronDown,
                                        //   color: Colors.grey.shade500,
                                        // )
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
                                      keyboardType: TextInputType.number,
                                      controller: phoneNumberController,
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
                                         errorMaxLines: 2,
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
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.grey.shade500),
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
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            // launchURLTerms();
                                            Get.to(TermsAndConditionsScreen());
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
                        isAgree == false
                            ? FoodigyButton(
                                onPressed: () {
                                  //    registerController.changeStatus();
                                },
                                color: Colors.grey.shade400,
                                text: 'SIGN UP',
                              )
                            : FoodigyButton(
                                onPressed: () {
                                  final form = formkey.currentState;
                                  if (form!.validate()) {
                                    form.save();
                                    print(widget.id);
                                    //    registerController.changeStatus();
                                    GoogleLoginController().postGoogleUpdate(
                                        id: widget.id,
                                        phone:
                                            "+91${phoneNumberController.text.toString()}",
                                        gender: 'male',
                                        userType: 'consumer');
                                  }
                                },
                                color: firstColor,
                                text: 'SIGN UP',
                              ),

                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ),
        ));
  }
}
