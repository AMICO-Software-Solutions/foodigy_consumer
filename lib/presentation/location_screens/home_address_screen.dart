// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodigy/controller/address_controller/address_controller.dart';
import 'package:foodigy/presentation/home_screens/home.dart';
import 'package:foodigy/presentation/location_screens/home_add_address_screen.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeAddressScreen extends StatefulWidget {
  const HomeAddressScreen({super.key});

  @override
  State<HomeAddressScreen> createState() => _HomeAddressScreenState();
}

class _HomeAddressScreenState extends State<HomeAddressScreen> {
  GetAddressDetailsController addressListController =
      Get.put(GetAddressDetailsController());
  @override
  void initState() {
    addressListController.getAddressDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // double height = 100;
    // double legnth = addressListController.addressList!.data! == null
    //     ? 0
    //     : addressListController.addressList!.data!.length.toDouble();
    // double? to;

    // to = height * legnth;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          elevation: 2,
          iconTheme: IconThemeData(
            color: Colors.white, // <-- SEE HERE
          ),
          // flexibleSpace: SizedBox(height: 10),
          // toolbarHeight: 120,
          backgroundColor: firstColor,
          automaticallyImplyLeading: true,
        ),
      ),
      body: Obx(() {
        if (addressListController.isDataLoading.value == true) {
          return Center(
            child: CircularProgressIndicator(
              color: firstColor,
            ),
          );
        } else if (addressListController.addressList == null) {
          return Center(
              child: Text(
            "No address found!",
            style: FoodigyTextStyle.homeHeadLine,
          ));
        } else {
          return SingleChildScrollView(
            child: Column(children: [
              Container(
                height: 70,
                color: Colors.white,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 50,
                        child: Checkbox(
                          value: isAgree,
                          activeColor: Colors.black54,
                          onChanged: (bool? agree) {
                            setState(() {
                              isAgree = agree;
                              latFoodigy = currentLat;
                              longFoodigy = currentLong;
                              latAddress = '';
                              selectedAddress = "";
                              Get.offAll(Home());
                            });
                          },
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 50,
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: Text("Your Location ",
                            style: FoodigyTextStyle.homeHeadLine),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Saved Addresses',
                            style: FoodigyTextStyle.homeHeadLine,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      // 
                      FutureBuilder(
            //  future: addressListController.getAddressDetails(),
              builder: (context, snapshot) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height / 1,
                  width: MediaQuery.of(context).size.width / 1,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) {
                              return Container();
                            },
                            itemCount: addressListController.addressList == null
                                ? 0
                                : addressListController
                                    .addressList!.data!.length,
                            itemBuilder: (context, index) {
                              return addressListController.addressList!.data![index].addressLine1.toString() =="null"? Container():InkWell(
                                onTap: () {
                                  setState(() {
                                    longFoodigy = double.parse(
                                        addressListController
                                            .addressList!.data![index].longitude
                                            .toString());
                                    latFoodigy = double.parse(
                                        addressListController
                                            .addressList!.data![index].latitude
                                            .toString());
                                    latAddress = addressListController
                                        .addressList!.data![index].addressLine1
                                        .toString();
                                    isAgree = false;
                                    selecteAddressId=addressListController.addressList!.data![index].id.toString();
                                    selectedAddress =
                                        "${addressListController.addressList!.data![index].addressLine1},${addressListController.addressList!.data![index].addressLine2}, ${addressListController.addressList!.data![index].city},${addressListController.addressList!.data![index].state},${addressListController.addressList!.data![index].country}";
                                     Get.offAll(Home());
                                  });
                                },
                                child: addressListController.addressList!
                                            .data![index].addressLine1 ==
                                        latAddress
                                    ? Container(
                                        width: double.infinity,
                                        color: Colors.white,
                                        height: 130,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            width: double.infinity,
                                            color: Colors.white,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                shape: BoxShape
                                                                    .circle),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(2.0),
                                                          child: Container(
                                                            height: 15,
                                                            width: 15,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .grey
                                                                    .shade800,
                                                                shape: BoxShape
                                                                    .circle,
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade800)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              1.3,
                                                      child: Text(
                                                        "${addressListController.addressList!.data![index].addressLine1}, \n${addressListController.addressList!.data![index].addressLine2},\n${addressListController.addressList!.data![index].city},\n${addressListController.addressList!.data![index].country}",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 12,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 30,
                                                  width: double.infinity,
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        IconButton(
                                                            onPressed: () {
                                                             updateAddressScreen(index);
                                                            },
                                                            icon: Icon(
                                                              MdiIcons
                                                                  .pencilOutline,
                                                              color: FoodigyColors
                                                                  .normalIcon,
                                                              size: iconHeight,
                                                            )),
                                                        IconButton(
                                                            onPressed: () {
                                                              addressListController.deleteAddress(
                                                                  addressId: addressListController
                                                                      .addressList!
                                                                      .data![
                                                                          index]
                                                                      .id
                                                                      .toString());
                                                            },
                                                            icon: Icon(
                                                              MdiIcons
                                                                  .deleteOutline,
                                                              color: FoodigyColors
                                                                  .deleteIcon,
                                                              size: iconHeight,
                                                            )),
                                                      ]),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        color: Colors.white,
                                        height: 130,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                       
                                            children: [
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .grey.shade300,
                                                          shape:
                                                              BoxShape.circle),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2.0),
                                                        child: Container(
                                                          height: 15,
                                                          width: 15,
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              shape: BoxShape
                                                                  .circle,
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade200)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            1.3,
                                                    child: Text(
                                                      "${addressListController.addressList!.data![index].addressLine1}, \n${addressListController.addressList!.data![index].addressLine2}, \n${addressListController.addressList!.data![index].city}, \n${addressListController.addressList!.data![index].country}",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 30,
                                                width: double.infinity,
                                                
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          longFoodigy = double.parse(
                                                              addressListController
                                                                  .addressList!
                                                                  .data![index]
                                                                  .longitude
                                                                  .toString());
                                                          latFoodigy = double.parse(
                                                              addressListController
                                                                  .addressList!
                                                                  .data![index]
                                                                  .latitude
                                                                  .toString());
                                                          latAddress =
                                                              addressListController
                                                                  .addressList!
                                                                  .data![index]
                                                                  .addressLine1
                                                                  .toString();
                                                          isAgree = false;
                                                          selectedAddress =
                                                              "${addressListController.addressList!.data![index].addressLine1}, \n${addressListController.addressList!.data![index].addressLine2}, \n${addressListController.addressList!.data![index].city}, \n${addressListController.addressList!.data![index].state}, \n${addressListController.addressList!.data![index].country}";
                                                        });
                                                        updateAddressScreen(index);
                                                      },
                                                 
                                                      icon: Icon(
                                                        MdiIcons.pencilOutline,
                                                        color: FoodigyColors
                                                            .normalIcon,
                                                        size: iconHeight,
                                                      )),
                                                  IconButton(
                                                      onPressed: () {
                                                        addressListController
                                                            .deleteAddress(
                                                                addressId: addressListController
                                                                    .addressList!
                                                                    .data![
                                                                        index]
                                                                    .id
                                                                    .toString());
                                                      },
                                                      icon: Icon(
                                                        MdiIcons.deleteOutline,
                                                        color: FoodigyColors
                                                            .deleteIcon,
                                                        size: iconHeight,
                                                      )),
                                                ]),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                              );
                            })
                        
                      ],
                    ),
                  ),
                );
              })
                    ],
                  ),
                ),
              )
            ]),
          );
        }
      }),
    );
  }
  
  void refreshData() {
    addressListController.getAddressDetails();
  }

  FutureOr onGoBack(dynamic value) {
    refreshData();
    setState(() {});
  }


  void updateAddressScreen(int index) {
    Route route = MaterialPageRoute(
        builder: (context) => HomeAddAddress(
              addressLine1:
                  addressListController.addressList!.data![index].addressLine1,
              addressLine2:
                  addressListController.addressList!.data![index].addressLine2,
              city: addressListController.addressList!.data![index].city
                  .toString(),
              state: addressListController.addressList!.data![index].state
                  .toString(),
              country: addressListController.addressList!.data![index].country
                  .toString(),
              pincode: addressListController.addressList!.data![index].pincode
                  .toString(),
              userId: addressListController.addressList!.data![index].userId
                  .toString(),
              addressId:
                  addressListController.addressList!.data![index].id.toString(),
            ));
    Navigator.push(context, route).then(onGoBack);
  }
}
