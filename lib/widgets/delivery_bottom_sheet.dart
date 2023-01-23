import 'package:flutter/material.dart';
import 'package:foodigy/controller/address_controller/address_controller.dart';
import 'package:foodigy/controller/user_contoller/current_user_all_details_controller.dart';
import 'package:foodigy/presentation/location_screens/add_address_map_screen.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DeliveryAddressBottom extends StatefulWidget {
  final String? profileId;
  const DeliveryAddressBottom({super.key, this.profileId});

  @override
  State<DeliveryAddressBottom> createState() => _DeliveryAddressBottomState();
}

class _DeliveryAddressBottomState extends State<DeliveryAddressBottom> {
  GetAddressDetailsController addressListController =
      Get.put(GetAddressDetailsController());
  CurrentUserAllDetailsController curent =
      Get.put(CurrentUserAllDetailsController());
  @override
  void initState() {
    super.initState();
    addressListController.getAddressDetails();
    curent.getRecent();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Choose a delivery Address",
                  style: FoodigyTextStyle.subHeadingStyle,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey, //New
                          blurRadius: 5.0,
                        )
                      ],
                    ),
                    width: 30,
                    child: Icon(Icons.close),
                  ),
                )
              ],
            ),
            Obx(() {
              if (addressListController.isDataLoading.value == true) {
                return Center(
                  child: CircularProgressIndicator(
                    color: firstColor,
                  ),
                );
              } else {
                return SizedBox(
                  height: 250,
                  child: ListView.builder(
                      itemCount: addressListController.addressList == null
                          ? 0
                          : addressListController.addressList!.data!.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.5,
                                        child: Text(
                                          "${addressListController.addressList!.data![index].addressLine1},${addressListController.addressList!.data![index].addressLine2},${addressListController.addressList!.data![index].city},${addressListController.addressList!.data![index].country}",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 10,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w300),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 38,
                                    width: 38,
                                    child: Icon(
                                      MdiIcons.chevronRight,
                                      size: 18,
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                child: Divider(color: Colors.grey.shade500),
                              )
                            ],
                          ),
                        );
                      })),
                );
              }
            }),
            InkWell(
              onTap: () {
                Get.to(AddAddressMapScreen(
                  profileId:
                      widget.profileId,
                ));
                // Get.to(AddressMapScreen(
                //   profileId: profileId,
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
                          border: Border.all(color: Colors.black)),
                      child: Icon(
                        Icons.add,
                        size: 18,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Add New Address',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    )
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
