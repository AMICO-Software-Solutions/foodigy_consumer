

///this page currently not used



import 'package:flutter/material.dart';
import 'package:foodigy/presentation/location_screens/add_address_map_screen.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:get/get.dart';

class AddressMapScreen extends StatefulWidget {
  final String? profileId;
  const AddressMapScreen({super.key,  this.profileId});

  @override
  State<AddressMapScreen> createState() => _AddressMapScreenState();
}

class _AddressMapScreenState extends State<AddressMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(''),
        iconTheme: IconThemeData(
          color: Colors.grey, //change your color here
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(children: [
        Text(
          'Set location',
          style: FoodigyTextStyle.bigTextStyle,
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Hi, we would like to access your locationin order to secure your account',
            textAlign: TextAlign.center,
            style: FoodigyTextStyle.addressTextStyle,
          ),
        ),
        Container(
          height: 400,
          width: double.infinity,
          color: Colors.grey.shade200,
        )
      ]),
      bottomSheet: Container(
        color: Colors.white,
        height: 180,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                InkWell(
                                    onTap: () {},
                                    child: Text(
                                      "CHANGE",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontFamily: "Poppins",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade200,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SizedBox(
                          height: 5,
                        ),
                        Text('Address',
                            style: FoodigyTextStyle.addressTextStyle),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '11,Monitech manison ., morbry froad , egmore......',
                          style: FoodigyTextStyle.addTocartStyle,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width / 1,
                child: TextButton(
                  style: TextButton.styleFrom(
                      //  primary: Colors.purple,
                      backgroundColor: firstColor,
                      textStyle:
                          const TextStyle(fontSize: 14, fontFamily: 'Poppins')),
                  onPressed: () {
                    Get.to(AddAddressMapScreen(profileId: widget.profileId.toString(),));
                  },
                  child: Text(
                    "Enter complete address",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
