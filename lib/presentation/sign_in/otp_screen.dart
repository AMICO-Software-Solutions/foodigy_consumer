// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodigy/controller/user_contoller/mobile_otp_controller.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/widgets/foodigy_button.dart';
import 'package:get/get.dart';
import 'package:alt_sms_autofill/alt_sms_autofill.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  final String? otpValue;
  final String? phoneNumber;
  final String? trxId;

  const OtpScreen({
    Key? key,
    this.otpValue,
    this.phoneNumber,
    this.trxId,
  }) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  MobileOTPController mobileController = Get.put(MobileOTPController());
  //MobileOTPController onboadingController = Get.put(MobileOTPController());

  TextEditingController? textEditingController1;

  String _comingSms = 'Unknown';

  Future<void> initSmsListener() async {
    String comingSms;
    try {
      comingSms = (await AltSmsAutofill().listenForSms)!;
    } on PlatformException {
      comingSms = 'Failed to get Sms.';
    }
    if (!mounted) return;
    setState(() {
      _comingSms = comingSms;
      print("====>Message: $_comingSms");
      print(" ${_comingSms[32]}");
      textEditingController1!.text = _comingSms[36] +
          _comingSms[37] +
          _comingSms[38] +
          _comingSms[39] +
          _comingSms[40] +
          _comingSms[41]; //used to set the code in the message to a string and setting it to a textcontroller. message length is 38. so my code is in string index 32-37.
    });
  }

  @override
  void dispose() {
    textEditingController1!.dispose();
    AltSmsAutofill().unregisterListener();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    textEditingController1 = TextEditingController();
    initSmsListener();
  }

  String? otpCode;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //    appBar: AppBar(title: Text(widget.OtpValue.toString())),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  padding: const EdgeInsets.symmetric(horizontal: 45),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "OTP Verification",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 36),
                          children: [
                            TextSpan(
                                text: "Enter the OTP sent to  ",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontFamily: 'Poppins')),
                            TextSpan(
                                text: widget.phoneNumber.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Poppins'))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Theme(
                      //   data: Theme.of(context).copyWith(
                      //       primaryColor: Colors.amber,
                      //       backgroundColor: textFormColor,
                      //       splashColor: Colors.transparent),
                      //   child: OTPCustomeTextField(

                      //     contentPadding: EdgeInsets.all(0),
                      //     outlineBorderRadius: 0,
                      //     length: 6,
                      //     // width: 200,
                      //     width: MediaQuery.of(context).size.width,
                      //     fieldWidth: 40,
                      //     style: TextStyle(

                      //         //   background: Paint(),
                      //         //   foreground: Paint(),

                      //         decorationColor: Colors.amber,
                      //         //  backgroundColor: Colors.red,
                      //         fontSize: 20,
                      //         fontWeight: FontWeight.bold),
                      //     textFieldAlignment: MainAxisAlignment.spaceAround,
                      //     fieldStyle: FieldStyle.box,
                      //     onCompleted: (pin) {
                      //       // ignore: avoid_print
                      //       print("Completed: " + pin);
                      //       //  print("otp is ${otpController.text}");
                      //       setState(() {
                      //         otpCode = pin;
                      //         //  otp = otpController.text.isEmpty ? pin : otpController.text;
                      //       });
                      //     },
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: PinCodeTextField(
                            appContext: context,
                            pastedTextStyle: TextStyle(
                              color: Colors.green.shade600,
                              fontWeight: FontWeight.bold,
                            ),
                            length: 6,
                            obscureText: false,
                            animationType: AnimationType.fade,
                            pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(0),
                                fieldHeight: 50,
                                fieldWidth: 40,
                                borderWidth: 1,
                                inactiveFillColor: textFormColor,
                                inactiveColor: Colors.grey.shade500,
                                selectedColor: Colors.grey.shade500,
                                selectedFillColor: textFormColor,
                                activeFillColor: textFormColor,
                                activeColor: Colors.grey.shade500),
                            cursorColor: Colors.black,
                            animationDuration: Duration(milliseconds: 300),
                            enableActiveFill: true,
                            controller: textEditingController1,
                            keyboardType: TextInputType.number,
                            // boxShadows: [
                            //   BoxShadow(
                            //     offset: Offset(0, 1),
                            //     color: Colors.black12,
                            //     blurRadius: 1,
                            //   )
                            // ],
                            onCompleted: (v) {
                              //do something or move to next screen when code complete
                            },
                            onChanged: (value) {
                              print(value);
                              setState(() {
                                otpCode = value;
                                print(' $value');
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      InkWell(
                        onTap: () {
                          print(widget.otpValue);
                          Get.to(OtpScreen());
                          mobileController.mobileOTP(
                              phoneNumber: widget.phoneNumber);
                        },
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 36),
                            children: const [
                              TextSpan(
                                  text: "Didn't receive OTP?  ",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 11,
                                      fontFamily: 'Poppins')),
                              TextSpan(
                                  text: ' RESEND OTP',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 11,
                                      fontFamily: 'Poppins'))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Obx(() {
                        if (mobileController.isLoading.isTrue) {
                          return FoodigyButton(
                              color: Colors.grey.shade500,
                              text: 'Submit',
                              onPressed: () {});
                        } else {
                          return FoodigyButton(
                              color: firstColor,
                              text: 'Submit',
                              onPressed: () {
                                setState(() {
                                  isLoading = true;
                                  mobileController.verifyOTP(
                                      otp: otpCode,
                                      trxID: mobileController
                                          .otpModel!.trxDetails!.trxId);
                                  // if (otpCode ==  mobileController.otpModel!.trxDetails!.otpCode.toString()) {
                                  //   isLoading = false;
                                  //   Get.to(Home());
                                  //   print("success");
                                  // } else {
                                  //   isLoading = false;
                                  //   Fluttertoast.showToast(
                                  //       msg: 'OTP Mismatch',
                                  //       toastLength: Toast.LENGTH_SHORT,
                                  //       gravity: ToastGravity.BOTTOM,
                                  //       backgroundColor: firstColor,
                                  //       textColor: Colors.white,
                                  //       fontSize: 16.0,
                                  //       timeInSecForIosWeb: 1);
                                  //   print("otp mismatched");
                                  // }
                                });
                              });
                        }
                      }),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
