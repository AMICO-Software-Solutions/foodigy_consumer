// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodigy/controller/address_controller/address_controller.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:foodigy/widgets/foodigy_button.dart';
import 'package:foodigy/widgets/foodigy_textfield.dart';
import 'package:foodigy/widgets/profile/profile_appbar.dart';

class AddAddressMapScreen extends StatefulWidget {
  final String? profileId;
  const AddAddressMapScreen({super.key, this.profileId});

  @override
  State<AddAddressMapScreen> createState() => _AddAddressMapScreenState();
}

class _AddAddressMapScreenState extends State<AddAddressMapScreen> {
  TextEditingController addressline1 = TextEditingController();
  TextEditingController addressLine2 = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController pincode = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    dropdownCity = cityDrop.first;
    dropdownState = stateDrop.first;
    dropdownCountry = countryDrop.first;

    super.initState();
  }

  // List of items in our dropdown menu
  var cityDrop = [
    'Chennai',
  ];
  String? dropdownCity;

  // List of items in our dropdown menu
  var stateDrop = [
    'TamilNadu',
  ];
  String? dropdownState;

  // List of items in our dropdown menu
  var countryDrop = [
    'India',
  ];
  String? dropdownCountry;

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: ProfileAppBar(text: 'Add Address'),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 7,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Address Line1 (Flat No,Flat Name, Street name) *',
                      style: FoodigyTextStyle.addTocartStyle,
                    ),
                    SettingsTextFormField(
                      hintText: '',
                      controller: addressline1,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please fill out this field.";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Address Line2 (Landmark) *',
                      style: FoodigyTextStyle.addTocartStyle,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      child: SettingsTextFormField(
                        hintText: '',
                        controller: addressLine2,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please fill out this field.";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'City *',
                                style: FoodigyTextStyle.addTocartStyle,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2.5,
                                height: 70,
                                //   color: textFormColor,
                                //   padding: EdgeInsets.symmetric(horizontal: 10),
                                child: DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    errorMaxLines: 2,
                                    fillColor: textFormColor,
                                    filled: true,
                                    hintText: '',
                                    // prefixIcon:Icon(
                                    //   prefixIcon,
                                    //   color: Colors.grey,
                                    // ) ,
                                    //  suffixIcon: suffixIcon,
                                    errorStyle: FoodigyTextStyle.errorStyle,
                                    border: InputBorder.none,
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 1.0),
                                    ),
                                    //  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    hintStyle: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        //fontSize: fontSize,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  // Initial Value
                                  value: dropdownCity,
                                  isExpanded: true,
                                  elevation: 0,

                                  // Down Arrow Icon
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.grey,
                                  ),
                                  dropdownColor: textFormColor,

                                  // Array list of items
                                  items: cityDrop.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(
                                        items,
                                        style: TextStyle(
                                            color: Colors.grey.shade500,
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            //fontSize: fontSize,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    );
                                  }).toList(),
                                  // After selecting the desired option,it will
                                  // change button value to selected value
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownCity = newValue!;
                                      print(dropdownCity);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'State *',
                                style: FoodigyTextStyle.addTocartStyle,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 2.5,
                                //  height: 50,
                                //color: textFormColor,
                                padding: EdgeInsets.symmetric(horizontal: 0),
                                child: SizedBox(
                                  height: 70,
                                  child: DropdownButtonFormField(
                                    // validator: (value) => value == null
                                    //     ? 'Please fill out fields.'
                                    //     : null,
                                    //    autofocus: false,
                                    //   alignment: Alignment.center,
                                    //   isDense: false,
                                    isExpanded: true,
                                    decoration: InputDecoration(
                                      errorMaxLines: 2,
                                      fillColor: textFormColor,
                                      filled: true,
                                      hintText: '',
                                      // prefixIcon:Icon(
                                      //   prefixIcon,
                                      //   color: Colors.grey,
                                      // ) ,
                                      //  suffixIcon: suffixIcon,
                                      errorStyle: FoodigyTextStyle.errorStyle,
                                      border: InputBorder.none,
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 1.0),
                                      ),
                                      //  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                      hintStyle: TextStyle(
                                          color: Colors.grey.shade500,
                                          fontSize: 12,
                                          fontFamily: 'Poppins',
                                          //fontSize: fontSize,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    // Initial Value
                                    value: dropdownState,

                                    elevation: 0,

                                    // Down Arrow Icon
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.grey,
                                    ),
                                    dropdownColor: textFormColor,

                                    // Array list of items
                                    items: stateDrop.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(
                                          items,
                                          style: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              //fontSize: fontSize,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      );
                                    }).toList(),
                                    // After selecting the desired option,it will
                                    // change button value to selected value
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownState = newValue!;
                                        print(dropdownState);
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width / 1,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Column(
                    //         mainAxisAlignment: MainAxisAlignment.start,
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Text(
                    //             'City*',
                    //             style: FoodigyTextStyle.addTocartStyle,
                    //           ),
                    //           SizedBox(
                    //               width: MediaQuery.of(context).size.width / 2.5,
                    //               child: SettingsTextFormField(
                    //                 hintText: '',
                    //                 controller: city,
                    //               )),
                    //         ],
                    //       ),
                    //       Column(
                    //         mainAxisAlignment: MainAxisAlignment.start,
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Text(
                    //             'State*',
                    //             style: FoodigyTextStyle.addTocartStyle,
                    //           ),
                    //           SizedBox(
                    //               width: MediaQuery.of(context).size.width / 2.5,
                    //               child: SettingsTextFormField(
                    //                 hintText: '',
                    //                 controller: state,
                    //               )),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Country *',
                                style: FoodigyTextStyle.addTocartStyle,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 2.5,
                                color: textFormColor,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    errorMaxLines: 2,
                                    fillColor: textFormColor,
                                    filled: true,
                                    hintText: '',
                                    // prefixIcon:Icon(
                                    //   prefixIcon,
                                    //   color: Colors.grey,
                                    // ) ,
                                    //  suffixIcon: suffixIcon,
                                    errorStyle: FoodigyTextStyle.errorStyle,
                                    border: InputBorder.none,
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 1.0),
                                    ),
                                    //  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    hintStyle: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        //fontSize: fontSize,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  // Initial Value
                                  value: dropdownCountry,
                                  isExpanded: true,
                                  elevation: 0,

                                  // Down Arrow Icon
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.grey,
                                  ),
                                  dropdownColor: textFormColor,

                                  // Array list of items
                                  items: countryDrop.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(
                                        items,
                                        style: TextStyle(
                                            color: Colors.grey.shade500,
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            //fontSize: fontSize,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    );
                                  }).toList(),
                                  // After selecting the desired option,it will
                                  // change button value to selected value
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownCountry = newValue!;
                                      print(dropdownCountry);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          // Column(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Text(
                          //       'Country*',
                          //       style: FoodigyTextStyle.addTocartStyle,
                          //     ),
                          //     SizedBox(
                          //         width: MediaQuery.of(context).size.width / 2.5,
                          //         child: SettingsTextFormField(
                          //           hintText: '',
                          //           controller: country,
                          //         )),
                          //   ],
                          // ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pincode *',
                                style: FoodigyTextStyle.addTocartStyle,
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  child: SettingsTextFormField(
                                    hintText: '',
                                    controller: pincode,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[0-9]+')),
                                      LengthLimitingTextInputFormatter(6)
                                    ],
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please fill out this field.";
                                      } else {
                                        return null;
                                      }
                                    },
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    FoodigyButton(
                        color: firstColor,
                        text: 'Add address',
                        onPressed: () {
                          print(currentUserId.toString());
                          print(widget.profileId);
                          final form = formkey.currentState;
                          if (form!.validate()) {
                            form.save();
                            GetAddressDetailsController().postAddress(
                                profileId: widget.profileId.toString(),
                                userId: currentUserId.toString(),
                                addressLine1: addressline1.text,
                                addressLine2: addressLine2.text,
                                city: dropdownCity.toString(),
                                state: dropdownState.toString(),
                                country: dropdownCountry.toString(),
                                pincode: pincode.text.toString());
                          }

                          // GetAddressDetailsController().updateAddress(
                          //   userId: widget.userId,
                          //   addressLine1: addressline1.text,
                          //   addressLine2: addressLine2.text,
                          //   city: city.text,
                          //   state: state.text,
                          //   pincode: int.parse(pincode.text),
                          //   country: country.text,
                          //   addressId: widget.addressId

                          // );
                        })
                  ]),
            ),
          ),
        ),
      ),
      // body: Container(
      //   height: double.infinity,
      //   width: double.infinity,
      //   color: Colors.grey.shade300,
      //   child: SingleChildScrollView(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Container(
      //           height: MediaQuery.of(context).size.height / 1.7,
      //           width: double.infinity,
      //           color: Colors.grey.shade300,
      //         ),
      //         Container(
      //           height: MediaQuery.of(context).size.height / 2.5,
      //           width: double.infinity,
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(20),
      //             color: Colors.white,
      //           ),
      //           child: Theme(
      //             data: ThemeData(
      //                 primaryColor: firstColor,
      //                 primaryColorDark: firstColor,
      //                 primarySwatch: Colors.green),
      //             child: Padding(
      //               padding: const EdgeInsets.all(20.0),
      //               child: Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Row(
      //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                       children: const [
      //                         Text(
      //                           "Address Details",
      //                           style: FoodigyTextStyle.homeHeadLine,
      //                         ),
      //                         Icon(Icons.close)
      //                       ],
      //                     ),
      //                     SizedBox(
      //                       height: 7,
      //                     ),
      //                     Text(
      //                       "Save address as",
      //                       style: FoodigyTextStyle.addressTextStyle,
      //                     ),
      //                     SizedBox(
      //                       height: 7,
      //                     ),
      //                     Row(
      //                       children: [
      //                         Container(
      //                           height: 25,
      //                           width: 60,
      //                           decoration: BoxDecoration(
      //                               border:
      //                                   Border.all(color: Colors.grey.shade500),
      //                               borderRadius: BorderRadius.circular(3)),
      //                           child: Center(
      //                               child: Text(
      //                             "Home",
      //                             style: FoodigyTextStyle.addressTextStyle,
      //                           )),
      //                         ),
      //                         SizedBox(
      //                           width: 5,
      //                         ),
      //                         Container(
      //                           height: 25,
      //                           width: 60,
      //                           decoration: BoxDecoration(
      //                               border:
      //                                   Border.all(color: Colors.grey.shade500),
      //                               borderRadius: BorderRadius.circular(3)),
      //                           child: Center(
      //                               child: Text(
      //                             "Word",
      //                             style: FoodigyTextStyle.addressTextStyle,
      //                           )),
      //                         )
      //                       ],
      //                     ),
      //                     TextFormField(
      //                       controller: addressline1,
      //                       decoration: InputDecoration(
      //                         hintText: 'COMPLETE ADDRESS',
      //                         hintStyle: TextStyle(
      //                             color: Colors.grey,
      //                             fontSize: 14,
      //                             fontFamily: 'Poppins',
      //                             //fontSize: fontSize,
      //                             fontWeight: FontWeight.w200),
      //                       ),
      //                     ),
      //                     TextFormField(
      //                       controller: addressLine2,
      //                       decoration: InputDecoration(
      //                         hintText: 'FLOOR',
      //                         hintStyle: TextStyle(
      //                             color: Colors.grey,
      //                             fontSize: 14,
      //                             fontFamily: 'Poppins',
      //                             //fontSize: fontSize,
      //                             fontWeight: FontWeight.w200),
      //                       ),
      //                     ),
      //                     TextFormField(
      //                       controller: city,
      //                       decoration: InputDecoration(
      //                         hintText: 'LANDMARK',
      //                         hintStyle: TextStyle(
      //                             color: Colors.grey,
      //                             fontSize: 14,
      //                             fontFamily: 'Poppins',
      //                             //fontSize: fontSize,
      //                             fontWeight: FontWeight.w200),
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       height: 15,
      //                     ),
      //                     FoodigyButton(
      //                         color: firstColor,
      //                         text: 'Save address',
      //                         onPressed: () {
      //                           // print(widget.profileId);
      //                           // print(currentUserId);
      //                           GetAddressDetailsController().postAddress(
      //                             profileId: widget.profileId,
      //                               userId: currentUserId,
      //                               addressLine1: addressline1.text,
      //                               addressLine2: addressLine2.text,
      //                               city: city.text);
      //                         })
      //                   ]),
      //             ),
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
