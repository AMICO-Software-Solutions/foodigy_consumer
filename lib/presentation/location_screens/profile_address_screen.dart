import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodigy/controller/address_controller/address_controller.dart';
import 'package:foodigy/controller/user_contoller/current_user_all_details_controller.dart';
import 'package:foodigy/presentation/location_screens/add_address_map_screen.dart';
import 'package:foodigy/presentation/location_screens/home_add_address_screen.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:foodigy/widgets/profile/profile_appbar.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../utilities/const_color.dart';

class ProfileAddressScreen extends StatefulWidget {
  final String? profileId;
  const ProfileAddressScreen({super.key, this.profileId});

  @override
  State<ProfileAddressScreen> createState() => _ProfileAddressScreenState();
}

class _ProfileAddressScreenState extends State<ProfileAddressScreen> {
  GetAddressDetailsController addressListController =
      Get.put(GetAddressDetailsController());
  CurrentUserAllDetailsController curent =
      Get.put(CurrentUserAllDetailsController());
  @override
  void initState() {
    addressListController.getAddressDetails();
    curent.getRecent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(text: 'Addresses'),
      body: Obx(() {
        if (addressListController.isDataLoading.isTrue) {
          return Center(
            child: CircularProgressIndicator(color: firstColor),
          );
        } else {
          return FutureBuilder(
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
                            : addressListController.addressList!.data!.length,
                        itemBuilder: (context, index) {
                          return addressListController
                                      .addressList!.data![index].addressLine1
                                      .toString() ==
                                  "null"
                              ? Container()
                              : InkWell(
                                  onTap: () {
                                    setState(() {
                                      longFoodigy = double.parse(
                                          addressListController.addressList!
                                              .data![index].longitude
                                              .toString());
                                      latFoodigy = double.parse(
                                          addressListController.addressList!
                                              .data![index].latitude
                                              .toString());
                                      latAddress = addressListController
                                          .addressList!
                                          .data![index]
                                          .addressLine1
                                          .toString();
                                      isAgree = false;
                                       selecteAddressId=addressListController.addressList!.data![index].id.toString();
                                      selectedAddress =
                                          "${addressListController.addressList!.data![index].addressLine1},${addressListController.addressList!.data![index].addressLine2}, ${addressListController.addressList!.data![index].city},${addressListController.addressList!.data![index].state},${addressListController.addressList!.data![index].country}";
                                      // Get.offAll(Home());
                                    });
                                  },
                                  child: addressListController.addressList!
                                              .data![index].addressLine1 ==
                                          latAddress
                                      ? Container(
                                          width: double.infinity,
                                          color: Colors.white,
                                          height: 150,
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
                                                            const EdgeInsets
                                                                .all(10.0),
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
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            1.3,
                                                        child: Text(
                                                          "${addressListController.addressList!.data![index].addressLine1}, \n${addressListController.addressList!.data![index].addressLine2},\n${addressListController.addressList!.data![index].city}, \n${addressListController.addressList!.data![index].country}",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
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
                                                    height: 10,
                                                    width: double.infinity,
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          IconButton(
                                                              onPressed: () {
                                                                updateAddressScreen(
                                                                    index);
                                                              },
                                                              icon: Icon(
                                                                MdiIcons
                                                                    .pencilOutline,
                                                                color: FoodigyColors
                                                                    .normalIcon,
                                                                size:
                                                                    iconHeight,
                                                              )),
                                                          IconButton(
                                                              onPressed: () {
                                                                addressListController
                                                                    .deleteAddress(
                                                                        addressId: addressListController
                                                                            .addressList!
                                                                            .data![index]
                                                                            .id
                                                                            .toString())
                                                                    .whenComplete(
                                                                      () => addressListController
                                                                          .getAddressDetails(),
                                                                    );
                                                              },
                                                              icon: Icon(
                                                                MdiIcons
                                                                    .deleteOutline,
                                                                color: FoodigyColors
                                                                    .deleteIcon,
                                                                size:
                                                                    iconHeight,
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
                                          height: 120,
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
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Colors
                                                                    .grey
                                                                    .shade300,
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
                                                                    .white,
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
                                                        "${addressListController.addressList!.data![index].addressLine1},\n${addressListController.addressList!.data![index].addressLine2},\n${addressListController.addressList!.data![index].city},\n${addressListController.addressList!.data![index].country}",
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
                                                              setState(() {
                                                                longFoodigy = double.parse(addressListController
                                                                    .addressList!
                                                                    .data![
                                                                        index]
                                                                    .longitude
                                                                    .toString());
                                                                latFoodigy = double.parse(
                                                                    addressListController
                                                                        .addressList!
                                                                        .data![
                                                                            index]
                                                                        .latitude
                                                                        .toString());
                                                                latAddress = addressListController
                                                                    .addressList!
                                                                    .data![
                                                                        index]
                                                                    .addressLine1
                                                                    .toString();
                                                                isAgree = false;
                                                                selectedAddress =
                                                                    "${addressListController.addressList!.data![index].addressLine1},${addressListController.addressList!.data![index].addressLine2}, ${addressListController.addressList!.data![index].city},${addressListController.addressList!.data![index].state},${addressListController.addressList!.data![index].country}";
                                                              });
                                                              updateAddressScreen(
                                                                  index);
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
                                );
                        }),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: InkWell(
                        onTap: () {
                          navigateSecondPage();
                          // Get.to(AddressMapScreen(
                          //   profileId:curent.currentUser!.data!.profile![0].id.toString(),
                          // ));
                          // Get.to(AddAddressMapScreen(
                          //   profileId: widget.profileId.toString(),
                          // ));
                          // Get.to(AddAddressMapScreen(
                          //   profileId: curent
                          //       .currentUser!.data!.profile![0].id
                          //       .toString(),
                          // ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            child: Row(children: [
                              Container(
                                height: 38,
                                width: 38,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: firstColor)),
                                child: Icon(
                                  Icons.add,
                                  size: 18,
                                  color: firstColor,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Add New Address',
                                style: TextStyle(
                                    color: firstColor,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              )
                            ]),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            );
          });
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

  void navigateSecondPage() {
    Route route = MaterialPageRoute(
        builder: (context) => AddAddressMapScreen(
              profileId: widget.profileId.toString(),
            ));
    Navigator.push(context, route).then(onGoBack);
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
