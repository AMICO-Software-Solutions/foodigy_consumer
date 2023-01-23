// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:foodigy/controller/address_controller/address_controller.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/widgets/foodigy_button.dart';
import 'package:foodigy/widgets/foodigy_textfield.dart';
import 'package:foodigy/widgets/profile/profile_appbar.dart';

class HomeAddAddress extends StatefulWidget {
  final String? addressLine1;
  final String? addressLine2;
  final String? city, state;
  final String? country, pincode;
  final String? addressId, profileId, userId;

  const HomeAddAddress(
      {super.key,
      this.addressLine1,
      this.addressLine2,
      this.city,
      this.state,
      this.country,
      this.pincode,
      this.addressId,
      this.profileId,
      this.userId});

  @override
  State<HomeAddAddress> createState() => _HomeAddAddressState();
}

class _HomeAddAddressState extends State<HomeAddAddress> {
  TextEditingController addressline1 = TextEditingController();
  TextEditingController addressLine2 = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController pincode = TextEditingController();

  @override
  void initState() {
    addressline1 = TextEditingController(text: widget.addressLine1);
    addressLine2 = TextEditingController(text: widget.addressLine2);
    city = TextEditingController(text: widget.city);
    state = TextEditingController(text: widget.state);
    country = TextEditingController(text: widget.country);
    pincode = TextEditingController(text: widget.pincode);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: firstColor,
      title: Text(
       'Edit Address',
        style: FoodigyTextStyle.profileTitleStyle,
      ),
    ),
      
       
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Address Line2 (Landmark) *',
                style: FoodigyTextStyle.addTocartStyle,
              ),
              SettingsTextFormField(
                hintText: '',
                controller: addressLine2,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'City *',
                          style: FoodigyTextStyle.addTocartStyle,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: SettingsTextFormField(
                              hintText: '',
                              controller: city,
                            )),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'State *',
                          style: FoodigyTextStyle.addTocartStyle,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: SettingsTextFormField(
                              hintText: '',
                              controller: state,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Country *',
                          style: FoodigyTextStyle.addTocartStyle,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: SettingsTextFormField(
                              hintText: '',
                              controller: country,
                            )),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pincode *',
                          style: FoodigyTextStyle.addTocartStyle,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: SettingsTextFormField(
                              hintText: '',
                              controller: pincode,
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
                  text: 'update address',
                  onPressed: () {
                    print(widget.userId);
                    print(widget.addressId);
                    GetAddressDetailsController().updateAddress(
                        userId: widget.userId,
                        addressLine1: addressline1.text,
                        addressLine2: addressLine2.text,
                        city: city.text,
                        state: state.text,
                        pincode: int.parse(pincode.text),
                        country: country.text,
                        addressId: widget.addressId);
                  })
            ]),
          ),
        ),
      ),
    );
  }
}
